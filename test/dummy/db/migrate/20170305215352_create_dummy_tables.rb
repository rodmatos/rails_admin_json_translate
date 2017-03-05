class CreateDummyTables < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.jsonb :title_translations
      t.jsonb :body_translations

      t.timestamps null: false
    end
  end
end
