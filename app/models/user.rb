require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  USERNAME_FORMAT = /\A\w+\z/

  attr_accessor :password

  has_many :questions, dependent: :destroy
  has_many :asked_questions, class_name: 'Question', foreign_key: :author_id, dependent: :nullify

  before_save :encrypt_password
  before_validation :downcase_username, :downcase_email

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true
  validates :username, length: { maximum: 40 }, format: { with: USERNAME_FORMAT}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :avatar_url, format: { with: URI::DEFAULT_PARSER.make_regexp, allow_blank: true }
  validates :profile_color, format: { with: /\A#\h{6}\z/ }

  def self.hash_to_string(password_hash)
    password_hash.unpack("H*")[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email&.downcase)

    return unless user.present?    

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )
    user if user.password_hash == hashed_password

  end

  private

  def downcase_username
    username&.downcase!
  end

  def downcase_email
    email&.downcase!
  end

  def encrypt_password
    return if password.blank?

    self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

    self.password_hash = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )
  end
end
