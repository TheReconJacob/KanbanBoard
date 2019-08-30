class Boards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title
    end
  end
end
