class Book < ApplicationRecord
  belongs_to :author
  has_many :loans, dependent: :destroy
  validates_presence_of :author, :quantity
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
