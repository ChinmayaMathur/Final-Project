class Custumer < ApplicationRecord
      has_many :books, dependent: :nullify
      has_many :comments, dependent: :nullify
      has_secure_password
      has_many :likes
      has_many :liked_books, through: :likes, source: :book
      has_many :sent_payments, class_name: 'Payment', foreign_key: :sender_id, dependent: :nullify

      VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
      validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  
      def full_name
          "#{first_name} #{last_name}"
      end
end
