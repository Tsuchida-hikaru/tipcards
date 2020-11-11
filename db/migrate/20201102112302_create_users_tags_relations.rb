class CreateUsersTagsRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :users_tags_relations do |t|
      t.string      :tag, null: false, unique: true
      t.timestamps
    end
  end
end
