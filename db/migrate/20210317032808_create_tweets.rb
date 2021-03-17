class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true
      t.string :username
      t.string :userpicture

      t.timestamps
    end
  end
end
