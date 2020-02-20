class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.date :founded_on
      t.text :description
      t.timestamps null: false
    end
  end
end
