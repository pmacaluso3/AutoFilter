class CarPopulatorForUser < ActiveRecord::Base
  def self.populate_cars_for_user(user)
    user.zip
  end
end