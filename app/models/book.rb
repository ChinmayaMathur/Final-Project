class Book < ApplicationRecord
      before_save :capitalize_name
      has_many :comments, dependent: :destroy

      belongs_to :custumer, optional: true
      has_many :likes, dependent: :destroy
      has_many :likers, through: :likes, source: :custumer
      has_many :payments, dependent: :destroy

      validates :name_of_book, length: { minimum: 5, maximum: 500}
      validates :description,length: {minimum: 30, maximum: 500}
      validates :author, presence: true
      validates :price, numericality: { greater_than: 0}
      validates :no_of_books_available, presence: true


      private

      def capitalize_name
            self.name_of_book.capitalize!
      end
end
