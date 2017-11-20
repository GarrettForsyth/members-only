module SessionsHelper

  def sign_in(user)
    user.remember # give the user a new token(avoid becoming 'stale')
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def sign_out(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user
    if (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user 
        sign_in user
        current_user = user
      end
    else
      nil
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def is_signed_in?
    !current_user.nil?
  end

end
