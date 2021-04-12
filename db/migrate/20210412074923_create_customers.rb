class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :zipcode
      t.string :vatid
      t.string :tel
      t.string :mobile
      t.boolean :locked
      t.boolean :active
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
