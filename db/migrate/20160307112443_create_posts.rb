class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.text :content
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
