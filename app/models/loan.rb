class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates_presence_of :user, :book
end
