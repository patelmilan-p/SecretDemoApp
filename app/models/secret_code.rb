require 'Hashids'

class SecretCode < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :code

  def self.generate_secret_codes(count)

    hash = Hashids.new("Secret code demo app salt", 5)

    (1..count).each do |i|
      SecretCode.create(code: hash.encode(i))
    end
  end
end
