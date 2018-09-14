module UserHelper

  def sign_up_hash(type)
    result = Hash.new
    if type == :login
      result[:path] = session_url
      result[:button_label] = 'Sign-In'
    elsif type == :new
      result[:path] = new_user_url
      result[:button_label] = 'Sign-Up'
    end
    result
  end

end
