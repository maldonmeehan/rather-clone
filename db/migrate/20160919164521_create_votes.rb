class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :profile_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
