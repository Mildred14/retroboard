class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :category, null: false
      t.references :author, foreign_key: { to_table: :users }
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
