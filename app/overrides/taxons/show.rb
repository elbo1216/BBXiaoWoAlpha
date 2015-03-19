Deface::Override.new(
  :virtual_path => 'spree/taxons/show',
  :name => "taxon_title_overried",
  :set_attributes=> ".taxon-title",
  :attributes => {'class' => 'product-listing-title'}
)

Deface::Override.new(
  :virtual_path => 'spree/taxons/show',
  :name => "taxon_children_remove",
  :remove => "[data-hook='taxon_children']"
)
