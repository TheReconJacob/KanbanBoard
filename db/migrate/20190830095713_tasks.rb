class Tasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :board_id
      t.integer :user_id
      t.string :title
      t.string :description
    end
  end
end
