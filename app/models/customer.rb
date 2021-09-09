class Customer < ApplicationRecord
  belongs_to :admin
  has_one :user
end
