Deface::Override.new(
  :virtual_path => 'spree/shared/_taxonomies',
  :name => 'taxonmies_sidebar',
  :replace_contents => '#taxonomies',
  :text =>'
  <% @taxonomies.each do |taxonomy| %>
    <% cache [I18n.locale, taxonomy, max_level] do %>
      <h2 class="heading1 animated fadeInUp time3""><span class="maintext"><%= Spree.t(:shop_by_taxonomy, :taxonomy => taxonomy.name) %></span></h2>
      <%= taxons_tree_new(taxonomy.root, @taxon, max_level) %>
    <% end %>
  <% end %>

  '
)
