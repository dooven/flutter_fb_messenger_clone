import 'package:flutter/material.dart';

class ChatMessageInput extends StatefulWidget {
  final Function(String message) handleSubmitted;
  final FocusNode focusNode;
  final TextEditingController textController;

  const ChatMessageInput({
    Key key,
    this.handleSubmitted,
    this.focusNode,
    this.textController,
  }) : super(key: key);

  @override
  _ChatMessageInputState createState() => _ChatMessageInputState();
}

class _ChatMessageInputState extends State<ChatMessageInput>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    final curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(curve);

    widget.focusNode.addListener(() {
      final focusNode = widget.focusNode;
      if (focusNode.hasFocus) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        color: Colors.black,
        child: Row(
          children: [
            Container(
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: _animation,
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.camera_alt),
                    SizedBox(width: 8),
                    Icon(Icons.insert_photo),
                    SizedBox(width: 8),
                    Icon(Icons.mic),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: TextField(
                  onTap: () => _animationController.forward(),
                  controller: widget.textController,
                  onSubmitted: widget.handleSubmitted,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    filled: true,
                    hintText: 'Type a message...',
                  ),
                  focusNode: widget.focusNode,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: const Icon(Icons.send),
                onPressed: () => widget.handleSubmitted(
                  widget.textController.text,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
