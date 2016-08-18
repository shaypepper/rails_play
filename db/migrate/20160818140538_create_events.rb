class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.string :city
      t.string :state
      t.datetime :date

      t.timestamps null: false
    end
  end
end
