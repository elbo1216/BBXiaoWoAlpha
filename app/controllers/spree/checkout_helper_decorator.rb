Spree::CheckoutHelper.class_eval do
  def line_item_description_text(description_text)
   if description_text.present?
      truncate(strip_tags(description_text.gsub('&nbsp;', ' ')), length: 100)
    else
      Spree.t(:product_has_no_description)
    end
  end
end
