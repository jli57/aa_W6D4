require_relative "./questions.rb"

class QuestionLike
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM question_likes")
    data.map {|datum| QuestionLike.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.likers_for_question_id(question_id)
    data = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_likes
      JOIN users ON question_likes.user_id = users.id
      WHERE question_id = ?
    SQL

    return nil unless data.length > 0
    data.map {|datum| User.new(datum)}
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        count(*)
      FROM
        question_likes
      JOIN users ON question_likes.user_id = users.id
      WHERE question_id = ?
    SQL

    return nil unless data.length > 0
    data
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_likes
      JOIN questions ON question_likes.question_id = questions.id
      WHERE questions.user_id = ?
    SQL

    return nil unless data.length > 0
    data.map {|datum| Question.new(datum)}
  end

  def self.most_liked_questions(n)
    data = QuestionDBConnection.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        question_likes
      JOIN questions ON question_likes.question_id = questions.id

      GROUP BY
        questions.id
      ORDER BY
        COUNT(*)
      LIMIT ?
    SQL

    return nil unless data.length > 0
    data.map {|datum| Question.new(datum)}
  end
end
