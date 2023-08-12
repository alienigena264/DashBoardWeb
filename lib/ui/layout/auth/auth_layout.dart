import 'package:admin_dashboard/ui/layout/auth/widgets/custom_background.dart';
import 'package:admin_dashboard/ui/layout/auth/widgets/custom_tittle.dart';
import 'package:admin_dashboard/ui/layout/auth/widgets/links_bar.dart';

import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Scrollbar(
          child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
          (size.width > 1000)
              ? _DesktopBody(child: child)
              : _Mobilebody(child: child),
          //linkbar
          const LinksBar(),
              ],
            ),
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
      height: size.height * 0.92,
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

class _Mobilebody extends StatelessWidget {
  const _Mobilebody({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomTittle(),
            SizedBox(
              width: double.infinity,
              height: 420,
              child: child,),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.black,
                child: const CustomBackground(),
              )
          ],
        ));
  }
}
