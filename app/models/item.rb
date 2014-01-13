class Item < ActiveRecord::Base
  attr_accessible :category, :imageurl, :paypalcode, :price, :title
  
  validates_presence_of :category, :imageurl, :paypalcode, :price, :title
end
