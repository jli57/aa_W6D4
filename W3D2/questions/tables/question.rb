require_relative "./questions.rb"

class Question < Table
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

  def most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def likers
    QuestionLikes.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(@id)
  end

  def self.most_liked(n)
    QuestionLikes.most_liked_questions(n)
  end

  def save
    raise "#{@title} already in database" if @id
    QuestionDBConnection.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO
        questions (title, body, user_id)
      VALUES
        (?, ?, ?)
      SQL

    @id = QuestionDBConnection.instance.last_insert_row_id
  end
end
