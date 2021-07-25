class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.float :rating
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
