class SecretCode < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :code

  def self.generate_secret_codes(count)
    (1..count).each do
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...5).map { o[rand(o.length)] }.join
      SecretCode.create(code: string)
    end
  end
end
