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
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );
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
            Flexible(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: TextField(
                  controller: widget.textController,
                  onSubmitted: widget.handleSubmitted,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    filled: true,
                    hintText: 'Type a message...',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                    ),
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
