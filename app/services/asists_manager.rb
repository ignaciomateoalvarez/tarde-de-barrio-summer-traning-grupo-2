class AsistsManager
  attr_reader :params

  def initialize
    today_list
  end

  def call
    if @asists.empty?
      student_all
      @students.each do |s|
        Asist.create(student: s)
      end
      today_list
    end
    @asists
  end

  def student_all
    @students = Student.all
  end

  def today_list
    @asists = Asist.where("created_at >= ?", Time.zone.now.beginning_of_day).order(created_at: :asc)
  end
end
