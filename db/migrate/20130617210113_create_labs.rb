class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :state
      t.integer :kind
      t.string :name
      t.string :slug
      t.text :address
      t.text :notes
      t.string :postal_code
      t.string :country_code
      t.float :latitude
      t.float :longitude
      t.string :urls, array: true

      t.timestamps
    end
  end
end
