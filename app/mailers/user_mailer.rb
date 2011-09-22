class UserMailer < ActionMailer::Base

  default :from => "gourab.techno@gmail.com"
  def signup_notification(user,url)
    setup_email(user)
    @subject = 'Please activate your new account.'
    @body[:url]  = url
  end
  def sendmail_tohost(user)
    @user=user
    mail(:to => "gourab.techno@gmail.com",
      :subject => "Details of new user")
  end

  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
  end

  def reset_password_request(user, url)
    setup_email(user)
    @subject = 'Your password reset request.'
    @body[:url]  = url
  end
  protected
  def setup_email(user)
    @recipients  ="#{user.email.strip}"
    @from        = "contact@deepakmantra.net"
    @subject     = "[YOURSITE]"
    @content_type ='text/html'
    @sent_on     = Time.now
    @body[:user] = user
  end
end
