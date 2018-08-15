# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # this is overriding devise create inorder to create guest user record
  # def create
  # super
  # current_or_guest_user
  # end


  def create

  def auth_options
    { :scope => resource_name, :recall => "checkout#index" }
  end
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if !session[:return_to].blank?
      if params[:user][:qp] == 'login_qp'
        redirect_to checkout_index_path
        session[:return_to] = nil
      else
        redirect_to session[:return_to]
        session[:return_to] = nil
      end
    else
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
    current_or_guest_user
  end

  private

  def after_sign_in_path_for(resource)
    if params[:user][:qp] == 'login_qp'
    checkout_index_path
    else
    root_path
    end
  end

end
