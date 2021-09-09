class AddImageTobooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :main_img, :text
    add_column :books, :detail_img, :text
  end
end
