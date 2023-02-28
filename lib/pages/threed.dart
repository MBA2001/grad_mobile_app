import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ThreeDViewer extends StatefulWidget {
  ThreeDViewer({Key? key}) : super(key: key);
  @override
  State<ThreeDViewer> createState() => _ThreeDViewerState();
}

class _ThreeDViewerState extends State<ThreeDViewer> {
  late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        _controller?.runJavascript('toggleAutoRotate();');

      }, child: const Icon(Icons.add)),
        body: BabylonJSViewer(
          controller: (WebViewController controller) {
    _controller = controller;
  },
            functions: '''
function toggleAutoRotate(texture) {
let viewer = BabylonViewer.viewerManager.getViewerById('viewer-id');
viewer.sceneManager.camera.useAutoRotationBehavior = !viewer.sceneManager.camera.useAutoRotationBehavior
}

function addLights(){
  let viewer = BabylonViewer.viewerManager.getViewerById('viewer-id');
}
''',
            src: 'assets/model.glb'));
  }
}
