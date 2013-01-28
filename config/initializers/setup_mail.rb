domain   = Settings['mail']['domain']
login    = Settings['mail']['login']
password = Settings['mail']['password']
smtp     = Settings['mail']['smtp']
port     = Settings['mail']['port']

ActionMailer::Base.smtp_settings = {
  :address              => smtp,
  :port                 => port,
  :domain               => domain,
  :user_name            => login,
  :password             => password,
  :authentication       => "plain",
  :enable_starttls_auto => true
}
