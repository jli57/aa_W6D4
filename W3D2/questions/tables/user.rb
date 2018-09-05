require_relative "./questions.rb"

class User < Table
  attr_accessor :fname, :lname


  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM users")
    data.map {|datum| User.new(datum)}
  end

  def self.find_by_name(fname, lname)
    data = QuestionDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless data.length > 0
    User.new(data.first)
  end

  def average_karma
    data = QuestionDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        AVG(likes)
      FROM
        (SELECT
          count(*) as likes
        FROM
          users
        JOIN
          questions ON users.id = questions.user_id
        LEFT JOIN
          question_likes ON questions.id = question_likes.question_id
        WHERE
          users.id = @id
        GROUP BY
          questions.id)
    SQL
    return nil unless data.length > 0
    data.first.values.first
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def save
    raise "#{@fname}, #{@lname} already in database" if @id
    QuestionDBConnection.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
      SQL

    @id = QuestionDBConnection.instance.last_insert_row_id
  end
end
