class ProductDataLoader
  attr_accessor :name, :description, :sku, :height, :width, :weight, :depth, :cost_price, :available_on, :name_ch, :desc_ch, :slug, :product_id
  CHINESE_LOCALE = 'zh-CN'
  ENGLISH_LOCALE = 'en'
 
  def initialize(hash)
    @name = hash.delete(:name).gsub(/'/, "''")
    @description = hash.delete(:description).gsub(/'/, "''")
    @sku = hash.delete(:sku)
    @height = hash[:height].blank? ? 0.0 : hash.delete(:height).to_f
    @weight = hash[:weight].blank? ? 0.0 : hash.delete(:weight).to_f
    @depth = hash[:depth].blank? ? 0.0 : hash.delete(:depth).to_f
    @cost_price = hash[:cost_price].blank? ? 0.0 : hash.delete(:cost_price).to_f
    @available_on = hash.delete(:available_on)
    @name_ch = hash.delete(:name_ch).gsub(/'/, "''")
    @desc_ch = hash.delete(:desc_ch).gsub(/'/, "''")
    @slug = hash.delete(:slug) || @name.downcase.gsub(/[^\w\d\s]/, '').gsub(/ /, '-')
    @product_id = hash.delete(:product_id)
  end

  def process!
    ActiveRecord::Base.transaction do
      if @product_id.blank?
        product = get_product_by_slug
        # If there is no product id and the slug exists, create new variant
        @product_id = product ? product.id : create_product
      end

      create_product_translation(@name, @description, ENGLISH_LOCALE) unless product_translation_exists?(ENGLISH_LOCALE)
      create_product_translation(@name_ch, @desc_ch, CHINESE_LOCALE) unless product_translation_exists?(CHINESE_LOCALE)
      create_variants if variant.blank?
    end
  end

  def create_image(file)
    image = Spree::Image.new
    image.attachment = file
    image.viewable = variant
    image.save!
  end

  private

  def create_product
    sql = """INSERT INTO spree_products (name, description, slug, available_on, created_at, updated_at, tax_category_id, shipping_category_id) VALUES
             ('#{@name}', '#{@description}', '#{@slug}', '#{@available_on}', '#{Time.now}', '#{Time.now}', 1, 1) returning id"""
    rec = ActiveRecord::Base.connection.select_one(sql)
    rec["id"]
  end

  def create_product_translation(name_ch, desc_ch, locale)
    sql = """INSERT INTO spree_product_translations (name, description, slug, spree_product_id, created_at, updated_at, locale) VALUES
             ('#{name_ch}', '#{desc_ch}', '#{@slug}', #{@product_id}, '#{Time.now}', '#{Time.now}', '#{locale}')"""
    ActiveRecord::Base.connection.execute(sql)
  end

  def create_variants
    sql = """INSERT INTO spree_variants (sku, weight, height, width, depth, is_master, product_id, cost_price, updated_at) VALUES
             ('#{@sku}', #{@weight.to_f}, #{@height.to_f}, #{@width.to_f}, #{@depth.to_f}, true, #{@product_id}, #{@cost_price}, '#{Time.now}');"""
    ActiveRecord::Base.connection.execute(sql)
  end

  def get_product_by_slug
    Spree::Product.find_by_slug(@slug)
  end

  def product_translation_exists?(locale)
    !Spree::Product::Translation.where('slug = ? and locale = ?', @slug, locale).blank?
  end

  def variant
    Spree::Variant.where('product_id = ?', @product_id).first
  end
end
