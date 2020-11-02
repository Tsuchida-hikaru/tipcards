class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.references      :card, null: false, foreign_key: true
      t.references      :tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
