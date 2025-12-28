import 'package:flutter/material.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  static const List<_GroupItem> _items = [
    _GroupItem(
      name: 'Fc Barcelona news live',
      members: '1.2M members · Sports',
      image:
          'https://images.unsplash.com/photo-1505761671935-60b3a7427bad?auto=format&fit=crop&w=900&q=60',
      cta: 'Join',
    ),
    _GroupItem(
      name: 'Manchester United fans live',
      members: '980k members · Sports',
      image:
          'https://images.unsplash.com/photo-1522778119026-d647f0596c20?auto=format&fit=crop&w=900&q=60',
      cta: 'Join',
    ),
    _GroupItem(
      name: 'Addis Tech Builders',
      members: '42k members · Tech',
      image:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=900&q=60',
      cta: 'Visit',
    ),
    _GroupItem(
      name: 'Photography Ethiopia',
      members: '68k members · Photography',
      image:
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=900&q=60',
      cta: 'Join',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const _Header(title: 'Suggested groups'),
        ..._items.map((g) => _GroupCard(item: g)),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  const _Header({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  final _GroupItem item;
  const _GroupCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              item.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFFF0F2F5),
                child: const Icon(
                  Icons.broken_image_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(item.members),
            trailing: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF1877F2),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Text(item.cta),
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupItem {
  final String name;
  final String members;
  final String image;
  final String cta;

  const _GroupItem({
    required this.name,
    required this.members,
    required this.image,
    required this.cta,
  });
}
