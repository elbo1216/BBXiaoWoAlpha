Deface::Override.new(
  :virtual_path => 'spree/shared/_products',
  :name => "products_no_results_override",
  :remove => "[data-hook='products_search_results_heading_no_results_found']"
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_products',
  :name => "products_override",
  :replace => "#products",
  :partial => "shared/products"
)
