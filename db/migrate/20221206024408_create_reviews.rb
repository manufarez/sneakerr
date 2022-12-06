class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sneaker, null: false, foreign_key: true
      t.text :body
      t.integer :rate, unsigned: true, default: 0
      #Unsigned means integers don't have a + or - sign associated with them. Thus they are always non-negative.

      t.timestamps
    end
  end
end
