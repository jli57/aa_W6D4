require 'sqlite3'
require 'singleton'

class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Table
  # attr_accessor :class_name



  # def initialize(class_name)
  #   @class_name = class_name
  # end

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM #{to_s}s")
    data.map {|datum| Object.const_get(to_s).new(datum)}
  end

  def self.find_by_id(id)

    temp = to_s + 's'

    data = QuestionDBConnection.instance.execute(<<-SQL, temp, id)
      SELECT
        *
      FROM
        ?
      WHERE
        id = ?
    SQL

    return nil unless data.length > 0
    Object.const_get(to_s).new(data.first)
  end

  def to_s
    self.inspect
  end

end

class User < Table
  attr_accessor :fname, :lname


  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  # def self.find_by_name(fname, lname)
  #   temp = to_s
  #   data = QuestionDBConnection.instance.execute(<<-SQL, temp, fname, lname)
  #     SELECT
  #       *
  #     FROM
  #       ?
  #     WHERE
  #       fname = ? AND lname = ?
  #   SQL
  #   return nil unless results.length > 0
  #   to_object.new(data.first)
  # end

end

class Question < Table
  attr_accessor :title, :body, :user_id


  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
    # super("questions")


  end
end
