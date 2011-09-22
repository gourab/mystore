# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mystore::Application.initialize!
ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "google.com",
    :user_name => "gourab.techno@gmail.com",
    :password => "gourabdas",
    :authentication => :"plain"
#    :enable_starttls_auto => true

  }