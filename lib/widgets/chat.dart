import 'package:flutter/material.dart';
import "package:flutter_application_1/models/chat.dart";

class ChatWidget extends StatelessWidget {
  final List<ChatMessage> messages;
  final ScrollController? scrollController;
  final Color? myMessageColor;
  final Color? otherMessageColor;
  final Color? myTextColor;
  final Color? otherTextColor;
  final bool showTimestamp;
  final bool showSenderName;

  const ChatWidget({
    Key? key,
    required this.messages,
    this.scrollController,
    this.myMessageColor,
    this.otherMessageColor,
    this.myTextColor,
    this.otherTextColor,
    this.showTimestamp = false,
    this.showSenderName = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[messages.length - 1 - index];
        final myMsgColor = myMessageColor ?? theme.colorScheme.primary;
        final otherMsgColor =
            otherMessageColor ?? theme.colorScheme.surfaceContainerHighest;
        final myTxtColor = myTextColor ?? Colors.white;
        final otherTxtColor = otherTextColor ?? theme.colorScheme.onSurface;

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: message.isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!message.isMe) ...[
                CircleAvatar(
                  radius: 16,
                  backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                  child: Text(
                    message.senderName?.substring(0, 1).toUpperCase() ?? 'U',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Column(
                  crossAxisAlignment: message.isMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    if (showSenderName &&
                        !message.isMe &&
                        message.senderName != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 4),
                        child: Text(
                          message.senderName!,
                          style: TextStyle(
                            fontSize: 12,
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: message.isMe ? myMsgColor : otherMsgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(18),
                          topRight: const Radius.circular(18),
                          bottomLeft: Radius.circular(message.isMe ? 18 : 4),
                          bottomRight: Radius.circular(message.isMe ? 4 : 18),
                        ),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: message.isMe ? myTxtColor : otherTxtColor,
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                    ),
                    if (showTimestamp)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 12,
                          right: 12,
                        ),
                        child: Text(
                          _formatTimestamp(message.timestamp),
                          style: TextStyle(
                            fontSize: 11,
                            color: theme.colorScheme.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (message.isMe) ...[
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: myMsgColor,
                  child: Icon(Icons.person, color: myTxtColor, size: 18),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inMinutes < 1) {
      return 'Just now';
    } else if (diff.inHours < 1) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inDays < 1) {
      return '${diff.inHours}h ago';
    } else {
      return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
    }
  }
}
