class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references    :user, foreign_key: true
      t.string        :title, null: false
      t.text          :text, null: false
      t.boolean       :publish_setting, null: false, default: true
      t.timestamps
    end
  end
end
