import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_drawer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const CustomDrawer(),
      // body: MerchandiseGrid(),
    );
  }

}
