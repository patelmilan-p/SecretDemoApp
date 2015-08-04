class SecretCode < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :code

  def generate_secret_codes(count)
    pass
  end
end
