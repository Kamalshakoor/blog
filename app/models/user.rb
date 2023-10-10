class User < ApplicationRecord
    before_save {self.email = email.downcase}
    has_many :articles
    validates :username, presence: true, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end