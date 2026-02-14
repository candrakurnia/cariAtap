import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Gap(16),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 64,
                  backgroundImage: AssetImage('assets/ic_logo_app.png'),
                ),
              ),
              Gap(16),
              Text(
                'User Account',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(8),
              Text(
                'user123@gmail.com',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Gap(16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text('Help & Support'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
