class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, foreign_key: false
      t.references :following, null: false, foreign_key: false

      t.timestamps
    end
  end
end
