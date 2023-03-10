class HomeController < ApplicationController
  def index
    @presenter = PublicationPresenter.new(params)
    @students = Student.all
  end
end
