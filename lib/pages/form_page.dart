import 'package:flutter/material.dart';
import 'package:sbc_kyc_form/components/form_details.dart';
import 'package:sbc_kyc_form/model/get_cust_local_info.dart';
import 'package:sbc_kyc_form/pages/form_mobile.dart';
import 'package:sbc_kyc_form/widget/custom_app_bar.dart';

import '../widget/footer_widget.dart';

class FormPage extends StatelessWidget {
  FormPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if (screenWidth >= 800) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(150, 30, 150, 20),
                        child: FormDetailsWidget());
                  } else {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: FormMobileWidget());
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
