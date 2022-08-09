class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.references :created_by, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
