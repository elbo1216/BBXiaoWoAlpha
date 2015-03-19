Deface::Override.new(
  :virtual_path => 'spree/shared/_footer',
  :name => "footer_content_change",
  :replace => "#spree-footer",
  :partial => 'shared/footer'
)
