class CategoryExpense < ApplicationRecord
  belongs_to :category
  belongs_to :expense

  validates :expense_id, presence: true
  validates :category_id, presence: true
end
