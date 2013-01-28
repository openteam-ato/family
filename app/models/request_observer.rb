class RequestObserver < ActiveRecord::Observer
  def after_save(request)
    RequestMailer.send_email(request).deliver
  end
end
