# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  before_action :require_login
  add_flash_types :success, :warning
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authenticated
    redirect_to login_path
  end

  def not_authorized
    flash[:notice] = t('.notice')
    redirect_back(fallback_location: root_path)
  end
end
