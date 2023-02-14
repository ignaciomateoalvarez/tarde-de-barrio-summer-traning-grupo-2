class StudentDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

    def initialize (student)
    @student = student
  end

  def full_name
    "#{student.first_name.first.capitalize} #{student.last_name.first.capitalize}"
  end


end
