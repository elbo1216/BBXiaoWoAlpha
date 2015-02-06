Deface::Override.new(
  :virtual_path => 'spree/shared/_main_nav_bar',
  :name => 'sub_nav_class_change',
  :set_attributes => '.col-md-12',
  :attributes => {:class => 'subnav'}
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_main_nav_bar',
  :name => 'change_class_nav_main_bar',
  :set_attributes => '#main-nav-bar',
  :attributes => {:class => 'container menurelative'}
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_main_nav_bar',
  :name => 'change_class_first_ul',
  :set_attributes => '#main-nav-bar ul:first-child',
  :attributes => {:class => 'nav-pills mainmenucontain container"'}
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_main_nav_bar',
  :name => 'change_class_second_ul',
  :set_attributes => '#main-nav-bar ul:nth-child(2)',
  :attributes => {:class => 'nav-pills navbar-right'}
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_main_nav_bar',
  :name => "home_link_change_content",
  :replace_contents => "#home-link",
  :text => '
    <a class="active home" href="/"><i class="icon-home icon-white font18"></i> <span> Home</span></a>
  '
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_main_nav_bar',
  :name => 'locale_select_change_style',
  :set_attributes => '#locale-select',
  :attributes => {:class => 'locale-select'}
)
