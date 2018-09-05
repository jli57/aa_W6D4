require 'sqlite3'
require 'singleton'
require_relative 'tables/user.rb'
require_relative 'tables/question.rb'
require_relative 'tables/questionlike.rb'
require_relative 'tables/reply.rb'
require_relative 'tables/questionfollow.rb'


class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Table
  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM #{to_s}s")
    data.map {|datum| Object.const_get(to_s).new(datum)}
  end

  def initialize

  end

  def self.find_by_id(id)
    data = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{to_s}s
      WHERE
        id = ?
    SQL

    return nil unless data.length > 0
    Object.const_get(to_s).new(data.first)
  end

  def to_s
    self.inspect
  end

  # def save
  #   update if @id
  #   QuestionDBConnection.instance.execute(<<-SQL, @user_id, @question_id, @parent_id, @body)
  #     INSERT INTO
  #       replies (user_id, question_id, parent_id, body))
  #     VALUES
  #       (?, ?, ?, ?)
  #     SQL
  #
  #   @id = QuestionDBConnection.instance.last_insert_row_id
  # end
  #
  # def update
  #   raise "#{self} not in database" unless @id
  #   QuestionDBConnection.instance.execute(<<-SQL, @user_id, @question_id, @parent_id, @body)
  #     UPDATE
  #       reply
  #     SET
  #       user_id = ?, question_id = ?, parent_id = ?, body = ?
  #     WHERE
  #       id = ?
  #   SQL
  # end
end
