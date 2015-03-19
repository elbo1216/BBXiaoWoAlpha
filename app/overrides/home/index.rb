Deface::Override.new(
  :virtual_path => 'spree/home/index',
  :name => "home_content_override",
  :replace => "[data-hook='homepage_products']",
  :partial => 'home/index'
)
