class Book < ApplicationRecord
  def self.index(book_params)
  end

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

end
