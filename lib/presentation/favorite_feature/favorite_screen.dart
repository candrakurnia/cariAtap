import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_app.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Your Favorite",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: GridView.builder(
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
                      return _buildPropertyCard(property: property);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyCard({required property}) {
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

  Widget _cardList() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/sample_house.png',
            width: MediaQuery.of(context).size.width,
            height: 120,
            fit: BoxFit.fill,
          ),
          Text(
            "Sunter Appartment",
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Sunter, Jakarta Utara",
            style: GoogleFonts.poppins(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
