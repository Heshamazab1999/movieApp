import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie/constant.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;

  LoadingWidget({this.size = 80, this.color = K.secondColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: color,
        size: size,
      ),
    );
  }
}
