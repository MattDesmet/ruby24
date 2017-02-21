class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :thumb_image, :main_image
  include Placeholder

# pulls angular items from DB.  can be called on from the controller.
  def self.angular
    where(subtitle: 'Angular')
  end

# pulls all items from the DB that meet these conditions.  Can be called on by the controller.
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

    @portfolio_item = Portfolio.all

# this sets default values IF they are not entered.  Also shows up on form in form box.
    after_initialize :set_defaults

    def set_defaults
      self.subtitle ||= 'Angular'
      #example of using a concern vs hard coding a string for setting the default
      self.main_image ||= "http://placehold.it/600x400"
      self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end
