class User < ActiveRecord::Base
    has_many :orders
    has_many :parts, through: :orders
    has_secure_password

    validates :username, uniqueness: true
end