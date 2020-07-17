class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.timestamps
      t.string :title
      t.date :date
      t.string :location

    end
  end
end
