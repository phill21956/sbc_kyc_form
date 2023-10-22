import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>
      const Size.fromHeight(80); // Set the preferred height for the AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffF7F7F7), // Set the background color
      elevation: 1,
      flexibleSpace: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 20, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('images/SBCLogo.png'),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(''),
                  Text(
                    "SBC KYC PORTAL",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1A9B27),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
