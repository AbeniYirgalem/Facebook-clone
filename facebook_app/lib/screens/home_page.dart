import 'package:flutter/material.dart';

import '../widgets/post_widget.dart';
import 'settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  int _currentTab = 0;

  final List<Post> _posts = [
    Post(
      username: 'Muhd Bandu Jr',
      timeAgo: '2d',
      content:
          'Ronaldo entering Fast and Furious 11 the film 🎥 coming in 2026 ✌️',
      avatarUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=60',
      imageUrls: [
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1520256862855-398228c41684?auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=600&q=60',
      ],
    ),
    Post(
      username: 'Sarah Kim',
      timeAgo: '5h',
      content: 'Perfect sunset vibes today 🌅',
      avatarUrl:
          'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=200&q=60',
      imageUrls: [
        'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=600&q=60',
      ],
    ),
  ];

  final List<_Story> _stories = [
    const _Story(
      title: 'Create story',
      isCreate: true,
      image:
          'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?auto=format&fit=crop&w=400&q=40',
    ),
    const _Story(
      title: 'John',
      image:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=40',
    ),
    const _Story(
      title: 'Amelia',
      image:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=400&q=40',
    ),
    const _Story(
      title: 'Chris',
      image:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=400&q=40',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addPost() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _posts.insert(
        0,
        Post(
          username: 'You',
          timeAgo: 'Just now',
          content: text,
          avatarUrl:
              'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=60',
        ),
      );
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F2F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        titleSpacing: 12,
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          _roundIcon(Icons.add),
          _roundIcon(Icons.search),
          _roundIcon(Icons.message_outlined),
          _roundIcon(
            Icons.settings,
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SettingsScreen()));
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFE4E6EB), width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _navTab(icon: Icons.home_filled, index: 0),
                _navTab(icon: Icons.ondemand_video, index: 1),
                _navTab(icon: Icons.groups_rounded, index: 2),
                _navTab(icon: Icons.storefront, index: 3),
                _navTab(icon: Icons.notifications_none, index: 4),
                _navTab(icon: Icons.menu, index: 5),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _composerCard(),
          _quickActions(),
          const SizedBox(height: 6),
          _storiesRow(),
          _friendsReminderCard(),
          const SizedBox(height: 4),
          ..._posts.map((post) => PostWidget(post: post)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _navTab({required IconData icon, required int index}) {
    final isSelected = _currentTab == index;
    return InkWell(
      onTap: () => setState(() => _currentTab = index),
      child: SizedBox(
        width: 54,
        height: 44,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF1877F2) : Colors.black87,
            ),
            const SizedBox(height: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 3,
              width: 36,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF1877F2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundIcon(IconData icon, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFFF0F2F5),
          child: Icon(icon, color: Colors.black87, size: 20),
        ),
      ),
    );
  }

  Widget _composerCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFFCED4DA),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F2F5),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _controller,
                      maxLines: 1,
                      decoration: const InputDecoration.collapsed(
                        hintText: "What's on your mind?",
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _addPost,
                  icon: const Icon(
                    Icons.image_outlined,
                    color: Color(0xFF45BD62),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickActions() {
    Widget action(IconData icon, String label, Color color) {
      return Expanded(
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 22),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          action(Icons.videocam, 'Live', Colors.red),
          Container(height: 28, width: 1, color: Colors.grey[300]),
          action(Icons.photo_library, 'Photo', const Color(0xFF45BD62)),
          Container(height: 28, width: 1, color: Colors.grey[300]),
          action(Icons.video_call, 'Room', Colors.purple),
        ],
      ),
    );
  }

  Widget _storiesRow() {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final story = _stories[index];
          return _StoryCard(story: story);
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: _stories.length,
      ),
    );
  }

  Widget _friendsReminderCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.people_alt, color: Color(0xFF1877F2)),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Facebook is better with friends\nSee stories from friends by adding people you know from your contacts.',
              style: TextStyle(fontSize: 14),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFE7F3FF),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Find friends',
              style: TextStyle(
                color: Color(0xFF1877F2),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Story {
  final String title;
  final String image;
  final bool isCreate;

  const _Story({
    required this.title,
    required this.image,
    this.isCreate = false,
  });
}

class _StoryCard extends StatelessWidget {
  final _Story story;

  const _StoryCard({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: NetworkImage(story.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.05), Colors.black54],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: story.isCreate
                ? CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add, color: Colors.blue[700]),
                  )
                : const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Text(
              story.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                shadows: [Shadow(blurRadius: 4, color: Colors.black45)],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
