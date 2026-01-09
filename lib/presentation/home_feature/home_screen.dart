import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_app.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  // Top Section: Profile, Location, Notification
                  _buildTopSection(),
                  const Gap(24),
                  // Search and Filter Bar
                  _buildSearchBar(),
                  const Gap(24),
                  // Popular Now Section
                  _buildPopularNowSection(),
                  const Gap(24),
                  // Property Categories
                  _buildCategorySection(),
                  const Gap(24),
                  // Main Property Listings
                  _buildPropertyListings(),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Row(
      children: [
        // Profile Picture
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.asset(
              'assets/ic_logo_app.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.person, color: Colors.grey);
              },
            ),
          ),
        ),
        const Gap(12),
        // Greeting and Location
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi, Candra Kurnia',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Gap(4),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                  const Gap(4),
                  const Text(
                    'Jakarta Timur, Jakarta',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const Gap(4),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
        // Notification Icon
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.notifications_outlined,
            color: Colors.black87,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey, size: 20),
                Gap(12),
                Text(
                  'Pencarian ...',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        const Gap(12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.tune, color: Colors.black87, size: 24),
        ),
      ],
    );
  }

  Widget _buildPopularNowSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Popular Now',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'see more >',
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
            ),
          ],
        ),
        const Gap(12),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPropertyCard(
                title: 'Sunter Appartment',
                location: 'Sunter, Jakarta Utara',
                price: 'Rp. 1.500.000',
                imageUrl:
                    'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
              ),
              const Gap(16),
              _buildPropertyCard(
                title: 'Kelapa Gading House',
                location: 'Kelapa Gading, Jakarta Utara',
                price: 'Rp. 1.500.000',
                imageUrl:
                    'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyCard({
    required String title,
    required String location,
    required String price,
    required String imageUrl,
  }) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              width: 180,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 180,
                  height: 120,
                  color: Colors.grey[300],
                  child: const Icon(Icons.home, size: 50, color: Colors.grey),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Gap(4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const Gap(4),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = [
      {'icon': Icons.apartment, 'label': 'Apartment', 'color': Colors.blue},
      {'icon': Icons.home, 'label': 'Perumahan', 'color': Colors.brown},
      {'icon': Icons.hotel, 'label': 'Kostan', 'color': Colors.red},
      {'icon': Icons.store, 'label': 'Ruko', 'color': Colors.purple},
    ];

    return SizedBox(
      height: 100,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Container(
              margin: EdgeInsets.only(
                right: index < categories.length - 1 ? 16 : 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      category['icon'] as IconData,
                      color: category['color'] as Color,
                      size: 32,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    category['label'] as String,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPropertyListings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Semua Properti',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Gap(16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            final properties = [
              {
                'title': 'Sunter Appartment',
                'location': 'Sunter, Jakarta Utara',
                'price': 'Rp. 1.500.000',
                'imageUrl':
                    'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
              },
              {
                'title': 'Kelapa Gading House',
                'location': 'Kelapa Gading, Jakarta Utara',
                'price': 'Rp. 1.500.000',
                'imageUrl':
                    'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400',
              },
              {
                'title': 'Sunter Appartment',
                'location': 'Sunter, Jakarta Utara',
                'price': 'Rp. 1.500.000',
                'imageUrl':
                    'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
              },
              {
                'title': 'Kelapa Gading House',
                'location': 'Kelapa Gading, Jakarta Utara',
                'price': 'Rp. 1.500.000',
                'imageUrl':
                    'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400',
              },
            ];
            final property = properties[index % properties.length];
            return _buildPropertyCard(
              title: property['title']!,
              location: property['location']!,
              price: property['price']!,
              imageUrl: property['imageUrl']!,
            );
          },
        ),
      ],
    );
  }
}
