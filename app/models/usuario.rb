class Usuario < ApplicationRecord
  validates :nombre, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :correo_electronico, { uniqueness: { case_sensitive: false },
                                   presence: true,
                                   length: { minimum: 5, maximum: 100 },
                                   format: { with: VALID_EMAIL_REGEX } }
  validates :password, length: { minimum: 6, maximum: 255 }
  has_secure_password
end
