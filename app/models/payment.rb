class Payment < ApplicationRecord
      belongs_to :sender, class_name: 'Custumer', foreign_key: :sender_id
      belongs_to :book

      # Validation
      validates :amount, numericality: { greater_than: 0 }
end
