module Authenticatable
  def current_user
    @user ||= User.find_by(auth_token: request.headers['Authorization'])
  end
end
