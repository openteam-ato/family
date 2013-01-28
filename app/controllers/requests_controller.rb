#encoding: utf-8

class RequestsController < MainController
  def new
    @request = Request.new
    super
  end

  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if verify_recaptcha
        @request.save
        format.html { redirect_to new_request_path, :notice => 'Сообщение отправлено успешно, спасибо за обращение.' }
      else
        format.html { redirect_to new_request_path, :notice => 'Ошибка проверки' }
      end
    end
  end
end
