class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  # The path used after sign in
  def after_sign_in_path_for(resource)
    '/ru/na-povestke-dnya/reestr-postavschikov-sotsialnyh-uslug' || root_path
  end

  # The path used after sign out
  def after_sign_out_path_for(resource)
    '/ru/na-povestke-dnya/reestr-postavschikov-sotsialnyh-uslug' || root_path
  end
end
