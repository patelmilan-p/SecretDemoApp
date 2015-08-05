class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    if code = verify_secret_code
      super { |user| code.user = user }

      #build_resource(sign_up_params)

      #resource.save
      #yield resource if block_given?
      #if resource.persisted?
        #code.user = resource
        #if resource.active_for_authentication?
          #set_flash_message :notice, :signed_up if is_flashing_format?
          #sign_up(resource_name, resource)
          #respond_with resource, location: after_sign_up_path_for(resource)
        #else
          #set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          #expire_data_after_sign_in!
          #respond_with resource, location: after_inactive_sign_up_path_for(resource)
        #end
      #else
        #clean_up_passwords resource
        #set_minimum_password_length
        #respond_with resource
      #end
    else
      build_resource(sign_up_params)
      resource.valid?
      resource.errors.add(:base, "Secret Code is wrong. Please re-enter the code.")
      clean_up_passwords(resource)
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    signed_in_root_path(resource)
  end

  def after_update_path_for(resource)
    signed_in_root_path(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def verify_secret_code
    SecretCode.find_by(user: nil, code: params[:secret_code])
  end
end
