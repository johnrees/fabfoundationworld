class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :state
      t.string :name
      t.string :slug
      t.text :address
      t.string :postal_code
      t.string :country_code
      t.string :latitude
      t.string :longitude
      t.string :urls, array: true

      t.timestamps
    end
  end
end
