class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.string "username"
    	t.string "password"
      t.string "status"
    	t.string "first_name"
    	t.string "last_name"
    	t.string "display_name"
    	t.string "profile_picture_url"
      t.text "about" 
      t.boolean "admin", :default => false
      t.datetime "date_of_signup"
      t.datetime "date_of_first_created"
      t.datetime "date_of_first_attendance"
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
