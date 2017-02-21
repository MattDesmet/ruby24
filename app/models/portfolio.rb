class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :thumb_image, :main_image

# pulls angular items from DB.  can be called on from the controller.
  def self.angular
    where(subtitle: 'Angular')
  end

# pulls all items from the DB that meet these conditions.  Can be called on by the controller.
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

    @portfolio_item = Portfolio.all
end
