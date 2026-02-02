import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
        body: SafeArea(child: Column(children: [_cardList()])),
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
          Text("Sunter Appartment", style: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.bold),),
          Text("Sunter, Jakarta Utara", style: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w500),)

        ],
      ),
    );
  }
}
