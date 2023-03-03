import 'package:flutter/material.dart';

Widget MyTextFormField({
  required String labelText,
  required IconData prefixicon,
  required double padding,
  required TextInputType keyboardType,
  IconData? suffixIcon,
  bool obscureText = false,
}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: labelText,
        prefixIcon: Icon(prefixicon),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  suffixIcon,
                ))
            : null,
      ),
    ),
  );
}

Future MyNavigator({
  required BuildContext context,
  required Widget widget,
}) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return widget;
    }),
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 1.25);
    path.cubicTo(
      size.width / 2 * 0.6,
      size.height * 0.5,
      size.width,
      size.height * 1.4,
      size.width * 1.2,
      size.height / 1.5,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
