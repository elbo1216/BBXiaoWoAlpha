namespace :jobs do
  desc "job task to load products from google drive"
  task :product_loading_job => :environment do
    Jobs::JobLoadProductsAndImages.process
  end
end
