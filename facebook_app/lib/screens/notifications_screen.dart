import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  static const List<_NotificationItem> _items = [
    _NotificationItem(
      title: 'You might like Fc Barcelona news live.',
      time: '1d',
      accent: Color(0xFF1877F2),
      avatarUrl:
          'https://images.unsplash.com/photo-1505761671935-60b3a7427bad?auto=format&fit=crop&w=200&q=60',
      cta: 'Join',
      secondary: 'Remove',
      badgeIcon: Icons.group,
    ),
    _NotificationItem(
      title: 'Watch these reels selected just for you.',
      time: '3d',
      accent: Color(0xFFE53935),
      badgeIcon: Icons.video_collection,
    ),
    _NotificationItem(
      title: 'You might like MANCHESTER UNITED FANS LIVE.',
      time: '3d',
      accent: Color(0xFF1877F2),
      avatarUrl:
          'https://images.unsplash.com/photo-1522778119026-d647f0596c20?auto=format&fit=crop&w=200&q=60',
      cta: 'Join',
      secondary: 'Remove',
      badgeIcon: Icons.group,
    ),
    _NotificationItem(
      title: 'For you: "दूसरों का ...".',
      time: '4d',
      accent: Color(0xFFE53935),
      thumbnailUrl:
          'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=200&q=60',
      badgeIcon: Icons.video_collection,
    ),
    _NotificationItem(
      title: 'You might like Maths teacher.',
      time: '4d',
      accent: Color(0xFF1877F2),
      avatarUrl:
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?auto=format&fit=crop&w=200&q=60',
      cta: 'Join',
      secondary: 'Remove',
      badgeIcon: Icons.group,
    ),
    _NotificationItem(
      title: 'You can check out top reels picked for you.',
      time: '5d',
      accent: Color(0xFFE53935),
      badgeIcon: Icons.video_collection,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      children: [
        const SizedBox(height: 4),
        _sectionHeader('Earlier'),
        const SizedBox(height: 8),
        ..._items.map(_NotificationCard.new),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final _NotificationItem item;

  const _NotificationCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: item.avatarUrl != null
                      ? NetworkImage(item.avatarUrl!)
                      : null,
                  child: item.avatarUrl == null
                      ? const Icon(Icons.person, color: Colors.white)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: item.accent,
                      child: Icon(
                        item.badgeIcon,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.time,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  if (item.cta != null || item.secondary != null) ...[
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        if (item.cta != null)
                          _actionButton(
                            label: item.cta!,
                            filled: true,
                            color: item.accent,
                          ),
                        if (item.secondary != null) ...[
                          const SizedBox(width: 10),
                          _actionButton(label: item.secondary!, filled: false),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
            if (item.thumbnailUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.thumbnailUrl!,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, size: 20),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton({
    required String label,
    required bool filled,
    Color color = const Color(0xFFE0E0E0),
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: filled ? color : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: filled ? color : const Color(0xFFE0E0E0)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: filled ? Colors.white : Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationItem {
  final String title;
  final String time;
  final Color accent;
  final String? avatarUrl;
  final String? thumbnailUrl;
  final String? cta;
  final String? secondary;
  final IconData badgeIcon;

  const _NotificationItem({
    required this.title,
    required this.time,
    required this.accent,
    required this.badgeIcon,
    this.avatarUrl,
    this.thumbnailUrl,
    this.cta,
    this.secondary,
  });
}
