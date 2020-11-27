class Book < ApplicationRecord
  belongs_to :author
  has_many :loans, dependent: :destroy
  validates_presence_of :author, :quantity
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  private

  def self.search(search)
    if search
      joins(:author).where('books.title LIKE ? or authors.name LIKE ?', "%#{search}%", "%#{search}%")
    else
      find(:all)
    end
  end

end
