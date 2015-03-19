$(document).ready(function() {
  $('.taxonomy-root-container').hoverIntent({ over: function() {
      var id = $(this).attr('id').split('-').pop();
      $('#taxonomy-root-' + id).addClass('hover-state');
      $($(this).find('.pink-popup-arrow')[0]).removeClass('hidden');
      $($(this).find('.taxonomy-children')[0]).removeClass('hidden');
    },
    out: function() {
      var id = $(this).attr('id').split('-').pop();
      $('#taxonomy-root-' + id).removeClass('hover-state');
      $('.taxonomy-children').each(function() {
         if (!$(this).hasClass('hidden')) { $(this).addClass('hidden') };
       });
  
      $('.pink-popup-arrow').each(function() {
         if (!$(this).hasClass('hidden')) { $(this).addClass('hidden') };
       })
    }
  });
});
