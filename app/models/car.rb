class Car < ActiveRecord::Base
  belongs_to :edmunds_make
  belongs_to :edmunds_model
  belongs_to :edmunds_year

  scope :hidden, -> { where(hidden: true) }

  def hide
    self.hidden = true
  end
end