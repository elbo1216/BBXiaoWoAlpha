require "GDrive"
require "ProductDataLoader"

module Jobs
  class JobLoadProductsAndImages
    def self.process
      gdrive = ::GDrive.new
      worksheet = gdrive.get_ws
      worksheet.rows.each_with_index do |row, index|
        # Skip header row
        next if index == 0
      
        slug = row[GDrive::Headers::SLUG].blank? ? nil : row[GDrive::Headers::SLUG]
        bb = ProductDataLoader.new(:name => row[GDrive::Headers::NAME],
                                   :product_id => row[GDrive::Headers::PRODUCTID],
                                   :sku => row[GDrive::Headers::SKU],
                                   :description => row[GDrive::Headers::DESCRIPTION],
                                   :cost_price => row[GDrive::Headers::COST_PRICE],
                                   :available_on => row[GDrive::Headers::AVAILABLE_ON],
                                   :weight => row[GDrive::Headers::WEIGHT],
                                   :height => row[GDrive::Headers::HEIGHT],
                                   :width => row[GDrive::Headers::WIDTH],
                                   :depth => row[GDrive::Headers::DEPTH],
                                   :name_ch => row[GDrive::Headers::CH_NAME],
                                   :desc_ch => row[GDrive::Headers::CH_DESCRIPTION])
        bb.process!
        worksheet[index+1, 1] = bb.product_id

        if File.exists?("/opt/images/#{row[GDrive::Headers::SKU]}.png")
          file = File.new("/opt/images/#{row[GDrive::Headers::SKU]}.png")
          bb.create_image(file)
        end
      end
      worksheet.save
    end
  end
end
