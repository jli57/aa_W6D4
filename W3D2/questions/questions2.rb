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
