class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user,    null: false, default: "", foreign_key: true
      t.string :name,        null: false, default: ""
      t.text :content,       null: false, default: ""
      t.integer :category_id null: false, default: "---"
      t.integer :status_id   null: false, default: "---"
      t.integer :cost_id     null: false, default: "---"
      t.integer :area_id     null: false, default: "---"
      t.integer :day_id      null: false, default: "---"
      t.integer :price,      null: false, default: ""
      t.timestamps
    end
  end
end
