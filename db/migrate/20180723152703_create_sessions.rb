class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.text :notes
      t.references :user, foreign_key: true
      t.references :doctor, foreign_key: true
      t.datetime :date_time

      t.timestamps
    end
  end
end
