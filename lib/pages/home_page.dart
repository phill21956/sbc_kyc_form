import 'package:flutter/material.dart';
import 'package:sbc_kyc_form/widget/custom_app_bar.dart';

import '../components/form_text_widget.dart';
import '../widget/footer_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/SLogo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double screenWidth = constraints.maxWidth;
                  if (screenWidth >= 600) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(150, 30, 150, 20),
                        child: FormTextWidget());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                      child: FormTextWidget(),
                    );
                  }
                }),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const FooterWidget(),
    );
  }
}

     //FormDetailsWidget(),