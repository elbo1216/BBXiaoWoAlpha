Deface::Override.new(
  :virtual_path => 'spree/products/show',
  :name => 'products_show_container_override',
  :replace_contents => '[data-hook="product_show"]',
  :partial => 'products/show'
)

Deface::Override.new(
  :virtual_path => 'spree/products/show',
  :name => 'sidebar_product_insert',
  :replace_contents => '#sidebar-products',
  :partial => 'shared/sidebar'
)

Deface::Override.new(
  :virtual_path => 'spree/products/show',
  :name => 'product_cart_form_override',
  :replace_contents => '#cart-form',
  :partial => 'shared/cart_form'
)

Deface::Override.new(
  :virtual_path => 'spree/products/show',
  :name => 'product_meta_info_override',
  :replace_contents => '#product-meta-info',
  :partial => 'products/products_meta_info'
)

Deface::Override.new(
  :virtual_path => 'spree/products/show',
  :name => 'thumbnail_override',
  :replace_contents => '#thumbnails',
  :partial => 'products/thumbnails'
)
