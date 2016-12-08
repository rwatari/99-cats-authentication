class SessionToken < ActiveRecord::Base
  belongs_to :user

  def self.generate_token
    SecureRandom.urlsafe_base64
  end
end
