class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #Enables implicit order column
  self.implicit_order_column = "created_at"
end
