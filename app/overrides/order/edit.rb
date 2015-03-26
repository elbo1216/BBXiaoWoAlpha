Deface::Override.new(
  :virtual_path => 'spree/orders/edit',
  :name => 'cart_container_add_id',
  :set_attributes => '[data-hook="cart_container"]',
  :attributes => {:id => "cart-container"}
)

Deface::Override.new(
  :virtual_path => 'spree/orders/edit',
  :name => 'cart_title_style_override',
  :replace_contents => '[data-hook="cart_container"]',
  :partial => 'orders/edit'
)
