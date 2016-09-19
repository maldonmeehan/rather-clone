class AlterProfilesAddColumns < ActiveRecord::Migration[5.0]
  def change
    change_table :profiles do |t|
      t.string :country
      t.string :gender
    end
  end
end
