# frozen_string_literal: true

module AuthForRequest
  def login_user(user = nil)
    user ||= create(:user, role: 'administrador', active: true)
    username = user.email
    user.update password: 'secret', password_confirmation: 'secret'
    send(:post, login_url, params: { email: username, password: 'secret' })
  end

  def logout_user
    UserSessionsController.send(:destroy)
  end
end
