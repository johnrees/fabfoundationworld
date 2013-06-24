class CreateOpeningTimes < ActiveRecord::Migration
  def change
    create_table :opening_times do |t|
      t.references :lab, index: true
      t.integer :start_minute
      t.integer :end_minute
      t.timestamps
    end
  end
end
