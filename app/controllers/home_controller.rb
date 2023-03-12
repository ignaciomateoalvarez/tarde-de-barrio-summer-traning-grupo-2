class HomeController < ApplicationController
  def index
    @presenter = PublicationPresenter.new(params)
  end
end
