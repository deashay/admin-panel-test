class AddSomeFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_account, :string
    add_column :users, :facebook_account, :string
    add_column :users, :hours_a_day_on_facebook, :integer
    add_column :users, :posts_a_week_on_facebook, :integer
    add_column :users, :hours_a_day_on_twitter, :integer
    add_column :users, :posts_a_week_on_twitter, :integer
    add_column :users, :like_cookies, :boolean
    add_column :users, :like_pancakes, :boolean
    add_column :users, :like_tomatoes, :boolean
  end
end
