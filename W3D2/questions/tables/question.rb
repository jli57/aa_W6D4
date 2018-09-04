
class Question
  attr_accessor :title, :body, :user_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
    data.map {|datum| Question.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def self.find_by_author_id(author_id)
    data = QuestionDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    return nil unless data.length > 0
    Question.new(data.first)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end
end
