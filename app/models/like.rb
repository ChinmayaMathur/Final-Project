class Like < ApplicationRecord
      belongs_to :book
      belongs_to :custumer

      validates(
            :book_id,
            uniqueness: {
                  scope: :custumer_id,
                  message: "has already been liked"
            }
      )
end
