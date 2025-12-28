import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const List<_MenuItem> _quickActions = [
    _MenuItem(icon: Icons.people, label: 'Friends'),
    _MenuItem(icon: Icons.save_alt, label: 'Saved'),
    _MenuItem(icon: Icons.flag, label: 'Pages'),
    _MenuItem(icon: Icons.history, label: 'Memories'),
    _MenuItem(icon: Icons.event, label: 'Events'),
    _MenuItem(icon: Icons.settings, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const Text(
          'Shortcuts',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _quickActions
              .map((item) => _ShortcutCard(item: item))
              .toList(),
        ),
        const SizedBox(height: 16),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF1877F2),
              child: Icon(Icons.help_outline, color: Colors.white),
            ),
            title: const Text('Help & support'),
            subtitle: const Text('Get help, visit support center'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF4CAF50),
              child: Icon(Icons.privacy_tip_outlined, color: Colors.white),
            ),
            title: const Text('Privacy shortcuts'),
            subtitle: const Text('Review privacy and security'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1877F2),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Log out',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _ShortcutCard extends StatelessWidget {
  final _MenuItem item;
  const _ShortcutCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(item.icon, color: Colors.black87),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              item.label,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  const _MenuItem({required this.icon, required this.label});
}
