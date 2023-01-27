class User < ApplicationRecord
    require "securerandom"

    has_secure_password

    validates :name, presence: true
    validates :password, presence: true
    validates :number, presence: true, uniqueness: true

end
