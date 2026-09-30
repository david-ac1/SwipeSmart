import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwipeSmart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF176B5B),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7F6),
        useMaterial3: true,
      ),
      home: const InboxPage(),
    );
  }
}

class InboxMessage {
  const InboxMessage({
    required this.id,
    required this.sender,
    required this.subject,
    required this.preview,
    required this.time,
    required this.category,
  });

  final String id;
  final String sender;
  final String subject;
  final String preview;
  final String time;
  final String category;
}

const inboxMessages = [
  InboxMessage(
    id: 'invoice',
    sender: 'Finance team',
    subject: 'Invoice approval needed',
    preview: 'The vendor invoice is ready for your review.',
    time: '9:42 AM',
    category: 'Work',
  ),
  InboxMessage(
    id: 'meeting',
    sender: 'Project Atlas',
    subject: 'Team meeting moved to 2:00 PM',
    preview: 'The calendar invite has been updated with the new time.',
    time: '8:15 AM',
    category: 'Calendar',
  ),
  InboxMessage(
    id: 'statement',
    sender: 'Northstar Bank',
    subject: 'Your monthly statement is ready',
    preview: 'Your September statement is available to view securely.',
    time: 'Yesterday',
    category: 'Finance',
  ),
  InboxMessage(
    id: 'design',
    sender: 'Maya Chen',
    subject: 'Design review feedback',
    preview: 'I added comments to the latest dashboard mockups.',
    time: 'Yesterday',
    category: 'Review',
  ),
];

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SwipeSmart'),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Search inbox',
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            tooltip: 'More options',
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        children: [
          Text(
            'Your inbox',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            '${inboxMessages.length} messages waiting for your attention',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
          ),
          const SizedBox(height: 20),
          const _SwipeHint(),
          const SizedBox(height: 16),
          for (final message in inboxMessages) ...[
            _MessageCard(message: message),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _SwipeHint extends StatelessWidget {
  const _SwipeHint();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2EE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.swipe, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Swipe messages to archive or delete them',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageCard extends StatelessWidget {
  const _MessageCard({required this.message});

  final InboxMessage message;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFD8ECE7),
              child: Text(
                message.sender.substring(0, 1),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          message.sender,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        message.time,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    message.subject,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message.preview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade700, height: 1.3),
                  ),
                  const SizedBox(height: 10),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F3F2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      child: Text(
                        message.category,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
