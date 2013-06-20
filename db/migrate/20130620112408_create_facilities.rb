class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :type
      t.string :name
      t.text :description

      t.timestamps
    end

    add_index :facilities, :type
  end
end
