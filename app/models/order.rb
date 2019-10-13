class Order < ActiveRecord::Base
    belongs_to :part
    belongs_to :user
  end