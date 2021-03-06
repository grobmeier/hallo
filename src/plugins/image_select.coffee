#    Plugin to work with images inside the editable for Hallo
#    (c) 2013 Christian Grobmeier, http://www.grobmeier.de
#    This plugin may be freely distributed under the MIT license
((jQuery) ->
  jQuery.widget "IKS.hallo-image-select",
    options:
      editable: null
      toolbar: null
      uuid: ''

    populateToolbar: ->
      @options.editable.selectedImage = null

      jQuery(@options.editable.element).on "click", "img", (event) =>
        sel = rangy.getSelection();
        range = rangy.createRange();
        range.selectNode event.target;
        sel.setSingleRange range;
        @options.editable.selectedImage = jQuery(event.target);

      jQuery(document).on "halloselected", (a, b) =>
        source = jQuery b.originalEvent.originalEvent.srcElement
        if !source.is('img')
          @options.editable.selectedImage = null
)(jQuery)