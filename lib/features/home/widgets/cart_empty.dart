import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your shopping category is empty",
            style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            "Item will be added soon..!",
            style: GoogleFonts.lato(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
