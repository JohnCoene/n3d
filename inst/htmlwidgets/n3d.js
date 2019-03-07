HTMLWidgets.widget({

  name: 'n3d',

  type: 'output',

  factory: function(el, width, height) {

    var elem;
    var graph;

    return {

      renderValue: function(x) {

        elem = document.getElementById(el.id);
        graph = ForceGraph3D(x.config)(elem)
          .graphData(x.data)
          .nodeId(x.nodeId)
          .linkSource(x.linkSource)
          .linkTarget(x.linkTarget)
          .nodeRelSize(x.nodeRelSize)
          .nodeVal(x.nodeVal)
          .nodeLabel(x.nodeLabel)
          .nodeColor(x.nodeColor)
          .nodeOpacity(x.nodeOpacity)
          .nodeResolution(x.nodeResolution)
          .backgroundColor(x.backgroundColor)
          .showNavInfo(x.showNavInfo)
          .linkLabel(x.linkLabel)
          .linkVisibility(x.linkVisibility)
          .linkColor(x.linkColor)
          .linkOpacity(x.linkOpacity)
          .linkWidth(x.linkWidth)
          .linkResolution(x.linkResolution)
          .linkCurvature(x.linkCurvature)
          .linkCurveRotation(x.linkCurveRotation)
          .linkDirectionalArrowLength(x.linkDirectionalArrowLength)
          .linkDirectionalArrowColor(x.linkDirectionalArrowColor)
          .linkDirectionalArrowRelPos(x.linkDirectionalArrowRelPos)
          .linkDirectionalArrowResolution(x.linkDirectionalArrowResolution)
          .linkDirectionalParticles(x.linkDirectionalParticles)
          .linkDirectionalParticleSpeed(x.linkDirectionalParticleSpeed)
          .linkDirectionalParticleWidth(x.linkDirectionalParticleWidth)
          .linkDirectionalParticleColor(x.linkDirectionalParticleColor)
          .linkDirectionalParticleResolution(x.linkDirectionalParticleResolution);

      },

      resize: function(width, height) {

      },

      getGraph: function(){
        return(graph);
      }

    };
  }
});

function get_n3d(id) {

	var htmlWidgetsObj = HTMLWidgets.find("#" + id); // find object

	var s; // define

	if (typeof htmlWidgetsObj != 'undefined') { // get chart if defined
		s = htmlWidgetsObj.getGraph();
	}

	return (s);
}

if(HTMLWidgets.shinyMode){

	Shiny.addCustomMessageHandler('n_update_data_p',
		function (message) {
			var g = get_n3d(message.id);
			if (typeof g != 'undefined') {
        g.graphData(message.data)
			}
		}
  );
  
	Shiny.addCustomMessageHandler('n_append_data_p',
		function (message) {
      var g = get_n3d(message.id);
			if (typeof g != 'undefined') {
        console.log(g.graphData());
        var { nodes, links } = g.graphData(); // Get data
        g.graphData({
          nodes: [...nodes, message.data.nodes ],
          links: [...links, message.data.links ]
        });
			}
		}
	);

}