import 'package:flutter/material.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        final Animation<double> animation = _controller.drive(
          CurveTween(curve: Curves.linear),
        );
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, -0.5),
              end: Alignment(1.0, 0.5),
              colors: [
             Colors.white,
             Colors.black.withOpacity(0.1),
             Colors.white
              ],
              stops: [
                0.0,
                animation.value,
                1.0,
              ],
            ),
          ),
        );
      },
    );
  }
}
