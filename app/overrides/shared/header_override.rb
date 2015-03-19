Deface::Override.new(
  :virtual_path => 'spree/shared/_header',
  :name => "spree_header_background_change",
  :set_attributes => "#spree-header",
  :attributes => {:style => 'background:none'}
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_header',
  :name => "top_header_padding_change",
  :set_attributes => "#header",
  :attributes => {:style => 'padding:0px; background: none;'}
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_header',
  :name => "header_container_surround_elements",
  :surround => "#header .container",
  :text => "<div class='headerdetails'><%= render_original %></div>"
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_header',
  :name => "spree_header_sencond_child_container_attribute_change",
  :replace => "#spree-header .container:nth-child(2)",
  :partial => 'shared/main_nav_bar'
)
