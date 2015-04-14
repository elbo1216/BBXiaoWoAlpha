Deface::Override.new(
  :virtual_path => 'spree/checkout/edit',
  :name => 'checkout_view_override',
  :replace_contents => '#checkout',
  :partial => 'checkout/edit'
)

Deface::Override.new(
  :virtual_path => 'spree/checkout/_address',
  :name => 'remove_submit_btn_override',
  :remove => '[data-hook="buttons"]'
)

Deface::Override.new(
  :virtual_path => 'spree/checkout/_delivery',
  :name => 'remove_submit_btn_override',
  :remove => '[data-hook="buttons"]'
)

Deface::Override.new(
  :virtual_path => 'spree/checkout/_payment',
  :name => 'remove_submit_btn_override',
  :remove => '[data-hook="buttons"]'
)
