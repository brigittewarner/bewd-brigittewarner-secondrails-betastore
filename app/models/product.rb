class Product < ActiveRecord::Base
	include PgSearch
	
	has_many :line_items
	has_many :orders, :through => :line_items
	has_many :categorizations
	has_many :categories, :through => :categorizations

	pg_search_scope :search, :against => [:name]
end
