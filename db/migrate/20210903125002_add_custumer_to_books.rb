class AddCustumerToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :custumer, foreign_key: true #removed null: false
  end
end
