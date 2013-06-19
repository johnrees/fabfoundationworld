class CreateOpeningTimes < ActiveRecord::Migration
  def change
    create_table :opening_times do |t|
      t.references :lab, index: true
      t.integer :day_of_the_week
      t.integer :minute
      t.integer :duration
      t.timestamps
    end
  end
end
