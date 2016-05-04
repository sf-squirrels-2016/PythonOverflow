class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, {null: false}
      t.references :voteable, {polymorphic: true, index: true}
      t.integer :vote_type

      t.timestamps
    end
  end
end
