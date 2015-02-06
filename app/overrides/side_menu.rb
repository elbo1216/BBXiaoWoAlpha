Deface::Override.new(
  :virtual_path => 'spree/shared/_sidebar',
  :name => 'sidemenu',
  :replace => '#sidebar',
  :text => '
      <aside id="sidebar" class="col-lg-3 col-md-3 col-sm-12 col-xs-12 mt40column" data-hook>
        <%= yield :sidebar %>
      </aside>
  '
)
