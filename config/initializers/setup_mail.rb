domain   = Settings['mail']['domain']
smtp     = Settings['mail']['smtp']
port     = Settings['mail']['port']

ActionMailer::Base.smtp_settings = {
  :address              => smtp,
  :port                 => port,
  :domain               => domain
}
