import 'package:flutter/material.dart';

class Post {
  final String username;
  final String timeAgo;
  final String content;
  final String? avatarUrl;
  final List<String> imageUrls;

  Post({
    required this.username,
    required this.timeAgo,
    required this.content,
    this.avatarUrl,
    this.imageUrls = const [],
  });
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: const Color(0xFFCED4DA),
                  backgroundImage: post.avatarUrl != null
                      ? NetworkImage(post.avatarUrl!)
                      : null,
                  child: post.avatarUrl == null
                      ? Text(post.username.isNotEmpty ? post.username[0] : '?')
                      : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                children: [
                                  TextSpan(
                                    text: post.username,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const TextSpan(text: ' · '),
                                  const TextSpan(
                                    text: 'Follow',
                                    style: TextStyle(
                                      color: Color(0xFF1877F2),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz, size: 20),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.close, size: 20),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            post.timeAgo,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.public,
                            size: 12,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(post.content, style: const TextStyle(fontSize: 15)),
            if (post.imageUrls.isNotEmpty) ...[
              const SizedBox(height: 10),
              _ImageGrid(imageUrls: post.imageUrls),
            ],
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.thumb_up_alt,
                  size: 16,
                  color: Color(0xFF1877F2),
                ),
                const SizedBox(width: 4),
                Text(
                  'Like',
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
                const Spacer(),
                Text(
                  'Comment',
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
                const SizedBox(width: 12),
                Text(
                  'Share',
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
              ],
            ),
            const Divider(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _PostButton(icon: Icons.thumb_up_off_alt, label: 'Like'),
                _PostButton(
                  icon: Icons.mode_comment_outlined,
                  label: 'Comment',
                ),
                _PostButton(icon: Icons.share_outlined, label: 'Share'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PostButton({Key? key, required this.icon, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.grey[700]),
      label: Text(label, style: TextStyle(color: Colors.grey[800])),
    );
  }
}

class _ImageGrid extends StatelessWidget {
  final List<String> imageUrls;

  const _ImageGrid({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSingle = imageUrls.length == 1;
    return LayoutBuilder(
      builder: (context, constraints) {
        final baseWidth = constraints.maxWidth;
        final tileWidth = isSingle ? baseWidth : (baseWidth - 4) / 2;

        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            children: imageUrls
                .map(
                  (url) => SizedBox(
                    width: tileWidth,
                    height: isSingle ? 240 : 140,
                    child: Image.network(url, fit: BoxFit.cover),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
