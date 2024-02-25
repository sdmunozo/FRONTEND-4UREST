import 'package:dasha/ui/layouts/auth/widgets/background_4urest.dart';
import 'package:dasha/ui/layouts/auth/widgets/custom_tittle.dart';
import 'package:dasha/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {

  final Widget child;

  const AuthLayout(
    {
      Key? key, 
      required this.child
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            
            (size.width > 1000)
            ? _DesktopBody( child: child )
            : _MobileBody( child: child ),
            // LinksBar
            LinksBar(),
          ],
        ),
      )
    ); 
  }
}

class _MobileBody extends StatelessWidget {

  final Widget child;

  const _MobileBody({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox( height: 20 ),

          CustomTitle(),
          
          Container(
            width: double.infinity,
            height: 646,
            child: child,
          ),

          Container(
            width: double.infinity,
            height: 400,
            child: Background4urest(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {

  final Widget child;

  const _DesktopBody({
    Key? key, 
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.black,
      child: Row(
        children: [
          // 4uRest Background
          Expanded(child: Background4urest()),

            //View Container
            Container(
              width: 600,
              height: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(height: 0,),
                  CustomTitle(),
                  SizedBox(height: 0,),
                  Expanded(child: child)
                ],),
            )
        ],
      ),
    );
  }
}