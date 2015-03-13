# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string           not null
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, :password_digest, :name, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :sessions, dependent: :destroy

  def self.find_by_session_token(token)
    users = User.find_by_sql([<<-SQL, token])
      SELECT users.*
      FROM users
      JOIN sessions ON sessions.user_id = users.id
      WHERE sessions.token = ?
    SQL
    users.first
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
