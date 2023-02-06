# frozen_string_literal: true

class HomeController < ApplicationController
  def login
    flash[:notice] = t(:hello)
  end

  def index
  end
end
