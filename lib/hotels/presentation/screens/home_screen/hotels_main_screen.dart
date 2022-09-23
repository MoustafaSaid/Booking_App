
import 'package:booking_app/hotels/presentation/screens/home_screen/Widget/Hotal_Card.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/Widget/Sliver_App_Bar.dart';import 'package:booking_app/hotels/presentation/screens/home_screen/Widget/Sliver_To_Box_Adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> images = [
    const Image(
      image: AssetImage('assets/images/21.PNG'),
      fit: BoxFit.cover,
    ),
    const Image(
      image: AssetImage('assets/images/22.PNG'),
      fit: BoxFit.cover,
    ),
    const Image(
      image: AssetImage(
          'assets/images/wallpapersden.com_programming-coding-language_wxl.jpg'),
      fit: BoxFit.cover,
    ),
  ];
//
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            Sliver_App_Bar(images: images),
            Sliver_To_Box_Adapter(),
            Hotal_Card(),
            //
          ],
        ),
      );
}
