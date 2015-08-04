class SecretCodesController < ApplicationController
  def index
    @secret_codes = SecretCode.all.to_a
  end

  def create
    SecretCode.generate_secret_codes(params[:count])
    redirect_to secret_codes_path
  end
end
