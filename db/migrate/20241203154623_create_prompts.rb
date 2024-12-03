class CreatePrompts < ActiveRecord::Migration[7.2]
  def change
    create_table :prompts do |t|
      t.string :name
      t.text :content
      t.boolean :processed_in_job

      t.timestamps
    end
  end
end
