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

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});