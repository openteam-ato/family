class UserMailer < Devise::Mailer
  #helper :application # gives access to all helpers defined within `application_helper`.
  #include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'users/mailer' # to make sure that you mailer uses the devise views

  #def reset_password_instructions(record, token, opts={})
    #super
  #end

  #def confirmation_instructions(record, token, opts={})
    #super
  #end
end
