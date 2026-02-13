import 'dart:async';

import 'package:cari_atap/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  const HomeScreen({super.key, this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find();
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    homeController.fetchHome("");
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      homeController.fetchHome(query.trim());
    });
  }

  void _onSearchSubmitted(String query) {
    _debounce?.cancel();
    homeController.fetchHome(query.trim());
  }

  void _clearSearch() {
    searchController.clear();
    _debounce?.cancel();
    homeController.fetchHome("");
  }

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
                  _buildTopSection(widget.name ?? 'UserAccount'),
                  const Gap(24),
                  _buildSearchBar(homeController, searchController),
                  const Gap(24),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Popular Now',
                  //       style: GoogleFonts.poppins(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black87,
                  //       ),
                  //     ),
                  //     Text(
                  //       'See More >',
                  //       style: GoogleFonts.poppins(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w500,
                  //         color: Color(0xDF736256),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Gap(12),
                  // _buildListCard(),
                  // const Gap(20),
                  _buildCategorySection(),
                  const Gap(24),
                  _buildPropertyListings(),
                  // _buildPopularNowSection(),
                  // const Gap(24),
                  // _buildPropertyListings(),
                  // const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // GetBuilder<HomeController> _buildListCard() {
  //   return GetBuilder<HomeController>(
  //     builder: (controller) {
  //       if (controller.loading.value) {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //       if ((controller.homeModel?.data?.length ?? 0) == 0) {
  //         return const Center(
  //           child: Padding(
  //             padding: EdgeInsets.all(32.0),
  //             child: Text(
  //               'Data tidak ditemukan',
  //               style: TextStyle(fontSize: 16, color: Colors.grey),
  //             ),
  //           ),
  //         );
  //       }
  //       return GridView.builder(
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           childAspectRatio: 0.65,
  //           crossAxisSpacing: 16,
  //           mainAxisSpacing: 16,
  //         ),
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         itemCount: controller.homeModel!.data!.length > 4 ? 6 : 2,
  //         itemBuilder: (context, index) {
  //           final data = controller.homeModel?.data?[index];
  //           return Container(
  //             width: 180,
  //             // height: 120,
  //             margin: const EdgeInsets.only(bottom: 12),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(12),
  //               color: Colors.white,
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black.withValues(alpha: 0.1),
  //                   blurRadius: 8,
  //                   offset: const Offset(0, 2),
  //                 ),
  //               ],
  //             ),
  //             child: _buildPropertyCard(
  //               title: data?.name ?? '',
  //               location: data?.address ?? '',
  //               price: data?.price?.toString() ?? '',
  //               imageUrl: data?.images?[0] ?? '',
  //               rating: data?.rating?.toString() ?? '',
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  Widget _buildTopSection(String name) {
    return Row(
      children: [
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${name.isEmpty ? 'UserAccount' : name}",
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
        GestureDetector(
          onTap: () {
            debugPrint("Clicked");
          },
          child: Container(
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
        ),
      ],
    );
  }

  Widget _buildSearchBar(
    HomeController homeController,
    TextEditingController searchController,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: TextFormField(
              controller: searchController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onChanged: _onSearchChanged,
              onFieldSubmitted: _onSearchSubmitted,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: searchController,
                  builder: (context, value, child) {
                    if (value.text.isNotEmpty) {
                      return IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: _clearSearch,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                hintText: "Pencarian ...",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
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

  // Widget _buildPopularNowSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           const Text(
  //             'Popular Now',
  //             style: TextStyle(
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.black87,
  //             ),
  //           ),
  //           TextButton(
  //             onPressed: () {},
  //             child: const Text(
  //               'see more >',
  //               style: TextStyle(fontSize: 14, color: Colors.blue),
  //             ),
  //           ),
  //         ],
  //       ),
  //       const Gap(12),
  //       SizedBox(
  //         height: 220,
  //         child: ListView(
  //           scrollDirection: Axis.horizontal,
  //           children: [
  //             _buildPropertyCard(
  //               title: 'Sunter Appartment',
  //               location: 'Sunter, Jakarta Utara',
  //               price: 'Rp. 1.500.000',
  //               imageUrl:
  //                   'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
  //             ),
  //             const Gap(16),
  //             _buildPropertyCard(
  //               title: 'Kelapa Gading House',
  //               location: 'Kelapa Gading, Jakarta Utara',
  //               price: 'Rp. 1.500.000',
  //               imageUrl:
  //                   'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400',
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildPropertyCard({
    required property,
    // required String title,
    // required String location,
    // required String price,
    // required String imageUrl,
    // required String rating,
    // required String label,
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
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  property['imageUrl'],
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 120,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    property['label'],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xDF736256),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  property['title'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Gap(8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const Gap(4),
                    Expanded(
                      child: Text(
                        property['location'] as String,
                        style: GoogleFonts.poppins(
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    property['type'],
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xDF736256),
                    ),
                  ),
                ),
                Gap(8),
                Text(
                  'Rp${NumberFormat.decimalPattern('id_ID').format(int.parse(property['price']))}',
                  style: GoogleFonts.poppins(
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
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Container(
              margin: EdgeInsets.only(
                right: index < categories.length - 1 ? 20 : 0,
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
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
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
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            final properties = [
              {
                'title': 'Rumah Minimalis',
                'location': 'Jakarta Timur, Jakarta',
                'price': 1500000.toString(),
                'imageUrl':
                    'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
                'rating': '4.8',
                'label': 'elite',
                'type': 'Wifi, Ac, Lemari, Kasur',
              },
              {
                'title': 'Rumah Modern',
                'location': 'Jakarta Timur, Jakarta',
                'price': 1500000.toString(),
                'imageUrl':
                    'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400',
                'rating': '4.5',
                'label': 'luxury',
                'type': 'Wifi, Ac, Lemari, Kasur',
              },
              {
                'title': 'Sunter Appartment',
                'location': 'Sunter, Jakarta Utara',
                'price': 1500000.toString(),
                'imageUrl':
                    'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
                'rating': '4.8',
                'label': 'elite',
                'type': 'Wifi, Ac, Lemari, Kasur',
              },
              {
                'title': 'Kelapa Gading House',
                'location': 'Kelapa Gading, Jakarta Utara',
                'price': 1500000.toString(),
                'imageUrl':
                    'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400',
                'rating': '4.5',
                'label': 'luxury',
                'type': 'Wifi, Ac, Lemari, Kasur',
              },
              {
                'title': 'Sunter Appartment',
                'location': 'Sunter, Jakarta Utara',
                'price': 1500000.toString(),
                'imageUrl':
                    'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
                'rating': '4.5',
                'label': 'elite',
                'type': 'Wifi, Ac, Lemari, Kasur',
              },
              {
                'title': 'Kelapa Gading House',
                'location': 'Kelapa Gading, Jakarta Utara',
                'price': 15000000.toString(),
                'imageUrl':
                    'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400',
                'rating': '4.5',
                'label': 'luxury',
                'type': 'Wifi, Ac, Lemari, Kasur',
              },
            ];
            final property = properties[index % properties.length];
            return _buildPropertyCard(
              property: property,
              // type: property['type']!,
              // title: property['title']!,
              // location: property['location']!,
              // price: property['price']!,
              // imageUrl: property['imageUrl']!,
              // rating: property['rating']!,
              // label: property['label']!,
            );
          },
        ),
      ],
    );
  }
}
