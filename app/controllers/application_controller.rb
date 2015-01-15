class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :image, :email, :password, :password_confirmation]

    devise_parameter_sanitizer.for(:invite).concat [:first_name, :last_name, :image]
    devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name, :email, :image]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

end







# before_filter :configure_permitted_parameters, if: :devise_controller?
#
# protected
#
# def configure_permitted_parameters
#   # Only add some parameters
#   devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name, :phone]
#   # Override accepted parameters
#   devise_parameter_sanitizer.for(:accept_invitation) do |u|
#     u.permit(:first_name, :last_name, :phone, :password, :password_confirmation,
#     :invitation_token)
#   end
# end
