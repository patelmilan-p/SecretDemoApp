class SecretCodesController < ApplicationController
  def index
    @secret_codes = SecretCode.all.to_a
  end

  def create
  end
end
