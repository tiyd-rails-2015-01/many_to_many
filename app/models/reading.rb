class Course
  has_many :lessons

  has_many :readings, through: :lessons
  # def readings
  #   array = []
  #   lessons.each do |lesson|
  #     array = array + lesson.readings
  #   end
  #   array
  # end

  has_many :page_numbers, through: :readings
end


class Lesson
  belongs_to :course
  has_many :readings

  def number_of_likes
    # does something
  end
end


class Reading
  belongs_to :lesson
  # belongs_to :course, through: :lesson WON'T WORK

  # This is okay
  # def course
  #   lesson.course
  # end

  # This is awesome
  delegate :course, to: :lesson
  delegate :number_of_likes, to: :lesson

  has_many :page_numbers
end


class PageNumbers
  belongs_to :reading
end
