var growls = '[class^="growl"]';
(function($){
  $(document).ready(function(){
    $('body').append('<div id="growlContainer" style="z-index:2000;position:fixed;width:250px;top:20px;right:20px;overflow:auto;"></div>')
    $.extend({
      growl: function(options) {

        // OPTS
        // ====
        //
        // REQUIRED
        // --------
        // text: The html/text content to show under the title or by itself.
        //
        // OPTIONAL
        // --------
        // title: Bold-faced html/text content to appear to the left of the text.
        // type: Either success/warning/info/error (Info is default)
        // delay: Milliseconds before growl disappears. (0 is default and creates
        // a dismissable growl.)
        // container: css-formatted (e.g. ".container") container in which to
        // populate growls. Default is "#growlContainer"

        var defaults = {
          delay: 0
          , type: 'warning'
          , container: '#growlContainer'
          , text: ''
          , class: ''
        };
        var _ = $.extend(defaults, options);

        // FORMATTING
        _.fTitle =  ( _.title ? '<strong>' + _.title + '</strong>' : '')

        // UNIQUE IDENTIFICATION
        this.id = Math.floor(Math.random()*1000)

        // CREATE FULL DOM OBJECT
        this.html = document.createElement('div')
        this.html.className = 'growl' + this.id + ' alert alert-' + _.type + ' ' + _.class
        var xHtml = '<a style="pointer-events: auto; cursor: pointer" onclick="$(this).parent().fadeOut(\'fast\')" data-closeid=""' + this.id + '" class="close">&times;</a>'
        $(this.html).html(
          xHtml + _.fTitle + ' ' + _.text
        )

        // APPEND ALERT TO CONTAINER
        $(_.container).prepend(this.html)

        // SET DELAYS
        if ( _.delay > 0 ) {
          var fn = (function(delay, id) {
            setTimeout(function() {
              $('.growl' + id).fadeOut()
              }
              , delay
            )
          })(_.delay, this.id)
        }
      }
    })
  });
})(jQuery);
