class StudentManagementError < StandardError; end

class IDAlreadyExistsError < StudentManagementError
  def initialize(id, message = "ID already exists")
    @id = id
    super("#{message}: #{id}")
  end
end

class InvalidScoreError < StudentManagementError
  def initialize(score, message = "Score must be between 0 and 10")
    @score = score
    super("#{message}: #{score}")
  end
end

class StudentNotFoundError < StudentManagementError
  def initialize(id, message = "Student not found")
    @id = id
    super("#{message}: #{id}")
  end
end

class EmptyDatabaseError < StudentManagementError
  def initialize(message = "No students found in database")
    super(message)
  end
end

