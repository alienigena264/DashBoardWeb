import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.1,
        width: double.infinity,
        color: Colors.black,
        child: Wrap(
          children: [
            LinkBottom(
              text: 'About',
              function: () {},
            ),
            LinkBottom(
              text: 'Help Center',
              function: () {},
            ),
            LinkBottom(
              text: 'Terms Of service',
              function: () {},
            ),
            LinkBottom(
              text: 'Privacy Policy',
              function: () {},
            ),
            LinkBottom(
              text: 'Cookie Policy',
              function: () {},
            ),
            LinkBottom(
              text: 'Ads info',
              function: () {},
            ),
            LinkBottom(
              text: 'Blog',
              function: () {},
            ),
            LinkBottom(
              text: 'Status',
              function: () {},
            ),
            LinkBottom(
              text: 'Carreers',
              function: () {},
            ),
            LinkBottom(
              text: 'Brand Resourses',
              function: () {},
            ),
            LinkBottom(
              text: 'Marketing',
              function: () {},
            ),
          ],
        ));
  }
}

class LinkBottom extends StatefulWidget {
  const LinkBottom({Key? key, required this.text, required this.function})
      : super(key: key);

  final String text;
  final VoidCallback function;

  @override
  LinkBottomState createState() => LinkBottomState();
}

class LinkBottomState extends State<LinkBottom> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: widget.function,
        child: Text(
          widget.text,
          style: GoogleFonts.roboto(
            color: _isHovered ? Colors.white : Colors.grey,
            decoration:
                _isHovered ? TextDecoration.underline : TextDecoration.none,
            decorationThickness: 2.0,
          ),
        ),
      ),
    );
  }
}
