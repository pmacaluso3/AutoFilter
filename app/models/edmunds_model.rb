class EdmundsModel < ActiveRecord::Base
  belongs_to :edmunds_make
  has_many :edmunds_years
end