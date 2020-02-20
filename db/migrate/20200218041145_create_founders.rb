class CreateFounders < ActiveRecord::Migration[5.2]
  def change
    create_table :founders do |t|
      t.string :name
      t.string :title
      t.integer :company_id
      t.timestamps null: false
    end
  end
end
