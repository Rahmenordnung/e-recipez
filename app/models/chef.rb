class Chef < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :chefname, presence: true, length: { maximum:31}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { minimum: 5, maximum:200 },
                format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
    has_many :recipes, dependent: :destroy 
    has_secure_password
    validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
end