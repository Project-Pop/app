// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

class ZoomableWidget extends StatefulWidget {
  const ZoomableWidget({Key key, this.child, this.onZoom, this.onTapUp})
      : super(key: key);
  final Widget child;
  final Function onZoom;
  final Function onTapUp;

  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  Matrix4 matrix = Matrix4.identity();
  double zoom = 1;
  double prevZoom = 1;
  bool showZoom = false;
  Timer t1;

  bool handleZoom(newZoom) {
    if (newZoom >= 1) {
      if (newZoom > 10) {
        return false;
      }
      setState(() {
        showZoom = true;
        zoom = newZoom;
      });

      if (t1 != null) {
        t1.cancel();
      }

      t1 = Timer(const Duration(milliseconds: 2000), () {
        setState(() {
          showZoom = false;
        });
      });
    }
    widget.onZoom(zoom);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onScaleStart: (scaleDetails) {
          print('scalStart');
          setState(() => prevZoom = zoom);
          //print(scaleDetails);
        },
        onScaleUpdate: (ScaleUpdateDetails scaleDetails) {
          final newZoom = prevZoom * scaleDetails.scale;

          handleZoom(newZoom);
        },
        onScaleEnd: (scaleDetails) {
          print('end');
          //print(scaleDetails);
        },
        onTapUp: (TapUpDetails det) {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final Offset localPoint = box.globalToLocal(det.globalPosition);
          final Offset scaledPoint =
              localPoint.scale(1 / box.size.width, 1 / box.size.height);
        },
        child: Stack(children: [
          Column(
            children: <Widget>[
              Expanded(
                child: widget.child,
              ),
            ],
          ),
          Visibility(
            visible: showZoom, //Default is true,
            child: Positioned.fill(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      valueIndicatorTextStyle: const TextStyle(
                          color: Colors.amber,
                          letterSpacing: 2.0,
                          fontSize: 30),
                      valueIndicatorColor: Colors.blue,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.red,
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: zoom,
                      onChanged: (double newValue) {
                        handleZoom(newValue);
                      },
                      label: '$zoom',
                      min: 1,
                      max: 10,
                    ),
                  ),
                ),
              ],
            )),
          ),
        ]));
  }
}
