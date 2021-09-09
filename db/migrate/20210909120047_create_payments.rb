class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :sender_id
      t.integer :amount
      t.string :status
      t.text :security_key
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
