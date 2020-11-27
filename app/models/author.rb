class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private

  def self.search(search)
    if search
      joins(:books).where('authors.name LIKE ? or books.title LIKE ?', "%#{search}%", "%#{search}%")
    else
      find(:all)
    end
  end

end
