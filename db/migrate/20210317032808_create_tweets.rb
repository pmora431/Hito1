class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :retweet, default: 0
      t.references :retweet, foreign_key: { to_table: :tweets }

      t.timestamps
    end
  end
end
