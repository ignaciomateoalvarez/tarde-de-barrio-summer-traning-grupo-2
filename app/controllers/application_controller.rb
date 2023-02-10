# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  around_action :use_locale

  private

  def use_locale(&block)
    I18n.with_locale(:es, &block)
  end
end
