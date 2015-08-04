class SecretCodesController < ApplicationController
  def index
    @secret_codes = SecretCode.all
  end

  def create
    SecretCode.generate_secret_codes(params[:count].to_i)
    redirect_to secret_codes_path
  end
end
