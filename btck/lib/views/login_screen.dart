import 'package:btck/views/otp_verification_screen.dart';
import 'package:btck/widgets/green_intro_widget.dart';
import 'package:btck/widgets/loginWidget.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final countryPicker = const FlCountryCodePicker();

  CountryCode countryCode =
      const CountryCode(name: 'VietNam', code: 'VN', dialCode: '+84');

  onSubmit(String? input) {
    Get.to(() => OtpVerificationScreen(input!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  greenIntroWidget(),
                  const SizedBox(
                    height: 50,
                  ),
                  loginWidget(countryCode, () async {
                    // Show the country code picker when tapped.
                    final code =
                        await countryPicker.showPicker(context: context);
                    // Null check
                    if (code != null) countryCode == code;
                    setState(() {});
                  }, onSubmit),
                ],
              ),
            )));
  }
}
