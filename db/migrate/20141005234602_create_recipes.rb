class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.string :title

      t.timestamps
    end
  end
end
