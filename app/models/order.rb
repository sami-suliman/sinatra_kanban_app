class Order < ActiveRecord::Base
    has_many :parts
    has_many :users
  end