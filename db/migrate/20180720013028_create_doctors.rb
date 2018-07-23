class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :clinic_affiliation
      t.string :sub_specialty_english
      t.string :sub_specialty_spanish
      t.string :phone_number

      t.timestamps
    end
  end
end
