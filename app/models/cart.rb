class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :sneakers, through: :line_items

  def add_sneaker(sneaker)
    item = find_item(sneaker)
    if item
      item.increment(:quantity)
    else
      item = line_items.build(sneaker_id: sneaker.id, quantity: 1)
    end
    item
  end

  def remove_sneaker(sneaker)
    item = find_item(sneaker)
    if item
      item.decrement(:quantity) if item.quantity > 0
    end
    item.destroy if item.quantity == 0
    item
  end

  def total_price
    #If total_price is a column in the line_items table:
    line_items.sum(&:total_price)
  end

  def sneaker_count(sneaker)
    find_item(sneaker)&.quantity || 0
  end

  private
  def find_item(sneaker)
    line_items.find_by(sneaker_id: sneaker.id)
  end
end
