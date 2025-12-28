import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  static const List<_MarketItem> _items = [
    _MarketItem(
      title: 'Canon M50 15-45mm',
      price: 'Br 9,000',
      location: 'Addis Ababa',
      imageUrl:
          'https://images.unsplash.com/photo-1519181245277-cffeb31da2a5?auto=format&fit=crop&w=800&q=60',
    ),
    _MarketItem(
      title: 'Cross necklace tee',
      price: 'Br 900',
      location: 'Addis Ababa',
      imageUrl:
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=800&q=60',
    ),
    _MarketItem(
      title: 'Canon 5D Mark IV',
      price: 'Br 27,000',
      location: 'Addis Ababa',
      imageUrl:
          'https://images.unsplash.com/photo-1489515217757-5fd1be406fef?auto=format&fit=crop&w=800&q=60',
    ),
    _MarketItem(
      title: 'iPhone 14 Pro Max',
      price: 'Br 17,000',
      oldPrice: 'Br 19,000',
      location: 'Addis Ababa',
      imageUrl:
          'https://images.unsplash.com/photo-1616348436168-de43ad0db179?auto=format&fit=crop&w=800&q=60',
    ),
    _MarketItem(
      title: 'iPhone 13',
      price: 'Br 15,500',
      location: 'Addis Ababa',
      imageUrl:
          'https://images.unsplash.com/photo-1580915411954-1c0e37ed5af8?auto=format&fit=crop&w=800&q=60',
    ),
    _MarketItem(
      title: 'Nike sneakers bundle',
      price: 'Br 3,000',
      location: 'Addis Ababa',
      imageUrl:
          'https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=800&q=60',
    ),
    _MarketItem(
      title: 'Vintage Canon AE-1',
      price: 'Br 8,500',
      location: 'Addis Ababa',
      imageUrl:
          'https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&w=800&q=60',
    ),
    _MarketItem(
      title: 'Graphic tee pack',
      price: 'Br 1,200',
      location: 'Addis Ababa',
      imageUrl:
          'https://images.unsplash.com/photo-1542293787938-4d4f7e0bcdde?auto=format&fit=crop&w=800&q=60',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _pillAction(
                        icon: Icons.store_mall_directory,
                        label: 'Sell',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _pillAction(
                        icon: Icons.view_list_outlined,
                        label: 'Categories',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: const [
                    Text(
                      "Today's picks",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Color(0xFF1877F2),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Addis Ababa',
                      style: TextStyle(
                        color: Color(0xFF1877F2),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'A curated mix of gadgets, clothes, and deals near you.',
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.66,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = _items[index];
              return _ListingCard(item: item);
            }, childCount: _items.length),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
      ],
    );
  }

  static Widget _pillAction({required IconData icon, required String label}) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F2F5),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black87, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListingCard extends StatelessWidget {
  final _MarketItem item;

  const _ListingCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                item.imageUrl,
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 2),
            child: Row(
              children: [
                Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (item.oldPrice != null) ...[
                  const SizedBox(width: 6),
                  Text(
                    item.oldPrice!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    item.location,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MarketItem {
  final String title;
  final String price;
  final String? oldPrice;
  final String location;
  final String imageUrl;

  const _MarketItem({
    required this.title,
    required this.price,
    required this.location,
    required this.imageUrl,
    this.oldPrice,
  });
}
