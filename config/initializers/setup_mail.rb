domain = Settings['mail']['domain']
login = Settings['mail']['login']
password = Settings['mail']['password']

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => domain,
  :user_name            => login,
  :password             => password,
  :authentication       => "plain",
  :enable_starttls_auto => true
}
