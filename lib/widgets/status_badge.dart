import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final Widget child;

  const StatusBadge({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.green[500],
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
