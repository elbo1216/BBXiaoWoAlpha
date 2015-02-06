Spree::BaseHelper.class_eval do
  def taxons_tree_new(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.children.empty?
    content_tag :ul, class: 'nav nav-list categories' do
      root_taxon.children.map do |taxon|
        link = link_to(taxon.name, seo_url(taxon)) + taxons_tree(taxon, current_taxon, max_level - 1)
        "<li>#{link}</li>"
      end.join("\n").html_safe
    end
  end
end
