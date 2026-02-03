import 'package:cari_atap/common/state_enum.dart';
import 'package:cari_atap/controllers/confirmation_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmScreen extends StatefulWidget {
  final String confirmationId;
  const ConfirmScreen({super.key, required this.confirmationId});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final TextEditingController confirmationIdController =
      TextEditingController();
  final ConfirmationController confirmationController = Get.find();
  @override
  void dispose() {
    confirmationIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/ic_logo_app.png'),
                width: 200,
                height: 200,
              ),
            ),
            Text(
              'Please confirm your confirmation code',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: confirmationIdController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: widget.confirmationId,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Gap(16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xDF736256)),
              ),
              onPressed: () async {
                await confirmationController.confirm(
                  widget.confirmationId,
                );
                if (confirmationController.requestState ==
                    RequestState.success) {
                  Get.offAllNamed("/login");
                } else {
                  Get.snackbar(
                    "Error",
                    confirmationController.message ?? "Terjadi kesalahan",
                  );
                }
              },
              child: Text(
                'Confirm My Account',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
