class ChangeRateToRating < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :reviews, :rate, :rating
  end
end
