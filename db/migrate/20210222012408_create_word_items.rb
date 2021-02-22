class CreateWordItems < ActiveRecord::Migration[6.1]
  def change
    create_table :word_items do |t|
      t.string :name
      t.string :meaning
    end
  end
end
