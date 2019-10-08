class User < ActiveRecord::Base
    belongs_to :orders
end