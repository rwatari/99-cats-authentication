class SessionToken < ActiveRecord::Base
  belongs_to :user

  def self.generate_token!(user, client)
    new_token = self.new
    new_token.token = SecureRandom.urlsafe_base64
    new_token.user_id = user.id
    new_token.client = client
    new_token.save!
    new_token
  end

  def self.find_user_with_token(token)
    token = self.find_by_token(token)
    token.nil? ? nil : token.user
  end
end
