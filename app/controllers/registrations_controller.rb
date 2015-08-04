class RegistrationsController < Devise::RegistrationsController

  def create
    if verify_secret_code
      super
    else
      build_resource(sign_up_params)
      resource.valid?
      resource.errors.add(:base, "Secret Code is wrong. Please re-enter the code.")
      clean_up_passwords(resource)
      render :new
    end
  end

  private

  def verify_secret_code
    params[:secret_code] == "foobar"
  end
end
