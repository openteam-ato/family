class CreateContestVotes < ActiveRecord::Migration
  def change
    create_table :contest_votes do |t|
      t.text :ip
      t.text :user_agent
      t.text :session_id
      t.references :contest_work

      t.timestamps
    end
    add_index :contest_votes, :ip
  end
end
