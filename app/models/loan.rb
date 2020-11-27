class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates_presence_of :user, :book
  validate :check_current_user_loans_count
  validate :check_book_inventory

  scope :active, -> { where("is_active = 1") }

  private

  def check_current_user_loans_count
    if !user.nil?
      if user.loans.active.count >= 3
        errors.add(:user, "can't borrow more than three books")
      end
    end
  end

  def check_book_inventory
    if !book.nil?
      if book.loans.active.count >= book.quantity
        errors.add(:book, "no more books left in inventory")
      end
    end
  end

end
