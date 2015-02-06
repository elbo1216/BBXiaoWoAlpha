Deface::Override.new(
  :virtual_path => 'spree/taxons/show',
  :name => 'taxon_show',
  :replace => '.taxon-title',
  :text => '<h2 class="taxon-title heading1 animated fadeInUp time3""><%= @taxon.name %></h2>'
)
