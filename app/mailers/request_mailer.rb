class RequestMailer < ActionMailer::Base
  default :from => Settings['mail']['from']

  def send_email(request)
    @request = request
    mail(:to => Settings['mail']['to'], :subject => 'New request')
  end
end
