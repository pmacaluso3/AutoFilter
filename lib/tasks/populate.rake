namespace :populate do
  task :edmunds => :environment do
    ActiveRecord::Base.transaction do
      EdmundsMake.destroy_all
      EdmundsModel.destroy_all
      EdmundsYear.destroy_all
      EdmundsPopulator.populate!
    end
  end
end