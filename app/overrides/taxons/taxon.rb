Deface::Override.new(
  :virtual_path => 'spree/taxons/_taxon',
  :name => "products_subtaxon_title_override",
  :set_attributes => ".subtaxon-title",
  :attributes => {"class" => "product-subtitle"}
)

Deface::Override.new(
  :virtual_path => 'spree/taxons/_taxon',
  :name => "taxon_div_clear_both_override",
  :set_attributes => ".taxon",
  :attributes => {"style" => "clear: both"}
)
