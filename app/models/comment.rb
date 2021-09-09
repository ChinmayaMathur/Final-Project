class Comment < ApplicationRecord
      belongs_to :custumer, optional: true
      belongs_to :book

      validates :body, length: { minimum: 5, maximum: 500}
end
