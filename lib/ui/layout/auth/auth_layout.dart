import 'package:admin_dashboard/ui/layout/auth/widgets/custom_background.dart';
import 'package:admin_dashboard/ui/layout/auth/widgets/custom_tittle.dart';
import 'package:admin_dashboard/ui/layout/auth/widgets/links_bar.dart';

import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          physics: const ClampingScrollPhysics(),
      children: [
        //deskop
        _DesktopBody(child: child),
        //mobile

        //linkbar
        const LinksBar(),
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({required this.child});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.9,
      color: Colors.black,
      child: Row(children: [
        //photo
        const CustomBackground(),
        //Top
        Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomTittle(),

                const SizedBox(
                  height: 20,
                ),
                Expanded(child: child),
              ],
            ))
      ]),
    );
  }
}
