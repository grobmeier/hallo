#    Plugin to work with images inside the editable for Hallo
#    (c) 2013 Christian Grobmeier, http://www.grobmeier.de
#    This plugin may be freely distributed under the MIT license
((jQuery) ->
  jQuery.widget "IKS.hallo-image-edit",
    options:
      editable: null
      toolbar: null
      uuid: ''
      floatLeftClass: 'hallo-float-left'
      floatRightClass: 'hallo-float-right'

    populateToolbar: (toolbar) ->
      widget = this

      buttonset = jQuery "<span class=\"#{@widgetName}\"></span>"
      buttonize = (alignment, icon) =>
        buttonElement = jQuery '<span></span>'
        buttonElement.hallobutton
          uuid: @options.uuid
          editable: @options.editable
          label: alignment
          command: null
          icon: icon
          cssClass: @options.buttonCssClass
        buttonset.append buttonElement
        return buttonElement

      button = buttonize "Left", "icon-arrow-left"
      button.on "click", =>
        selection = jQuery(widget.options.editable.getSelection().startContainer)
        elements = selection.find "img"
        elements.removeClass @options.floatRightClass
        elements.addClass @options.floatLeftClass

      button = buttonize "Eraser", "icon-eraser"
      button.on "click", =>
        selection = jQuery(widget.options.editable.getSelection().startContainer)
        elements = selection.find "img"
        elements.removeClass @options.floatRightClass
        elements.removeClass @options.floatLeftClass

      button = buttonize "Right", "icon-arrow-right"
      button.on "click", =>
        selection = jQuery(widget.options.editable.getSelection().startContainer)
        elements = selection.find "img"
        elements.removeClass @options.floatLeftClass
        elements.addClass @options.floatRightClass

      buttonset.hallobuttonset()
      toolbar.append buttonset
)(jQuery)