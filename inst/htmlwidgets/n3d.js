HTMLWidgets.widget({

  name: 'n3d',

  type: 'output',

  factory: function(el, width, height) {

    var elem,
        graph;

    return {

      renderValue: function(x) {

        elem = document.getElementById(el.id);
        graph = ForceGraph3D(x.config)(elem);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});