class CreateGambars < ActiveRecord::Migration
  def change
    create_table :gambars do |t|
      t.string :title
      t.string :lokasi

      t.timestamps
    end
  end
end
