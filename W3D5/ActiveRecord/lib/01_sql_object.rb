require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    return @columns if @columns

    columns = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    @col_names = columns.first.join(", ")
    @columns = columns.first.map!(&:to_sym)

  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        self.attributes[name]
      end

      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize

  end

  def self.all
    columns = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    self.parse_all(columns)
  end

  def self.parse_all(results)
   results.map { |result| self.new(result) }
  end

  def self.find(id)
    # self.all.find { |obj| obj.id == id }
    my_hash = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = #{id}
    SQL

    return nil if my_hash.empty?

    self.new(my_hash.first)
  end

  def initialize(params = {})
    params.each do |key, value|
      if self.class.columns.include?(key.to_sym)
        self.send("#{key}=", value)
      else
        raise "unknown attribute '#{key}'"
      end
    end
  end

  def attributes
    @attributes || @attributes = {}
  end

  def attribute_values
    self.class.columns.map {|name| self.send(name)}
  end

  def insert
    question_marks = (["?"] * (self.attribute_values.count - 1)).join(", ")
    col_names = self.class.columns.drop(1).join(", ")

    my_hash = DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id

  end

  def update
    # ...
  end

  def save
    # ...
  end
end
