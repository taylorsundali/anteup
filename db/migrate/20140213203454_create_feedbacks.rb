class CreateFeedbacks < ActiveRecord::Migration
  def up
    create_table :feedbacks do |t|
      t.integer "user_id"
      t.text "feedback_entry"
        t.timestamps
    end
  end

  def down
    drop_table :feedbacks
  end
end
