class Session
  def cookies
    @cookies ||= begin
      secret = Rails.application.config.secret_token
      cookies = ActionDispatch::Cookies::CookieJar.new(secret)
      cookies
    end
  end
end