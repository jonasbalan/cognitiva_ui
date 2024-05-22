import 'package:cognitiva_ui/view/screens/address_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/older/header.dart';
import '../../widgets/older/side_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(),
                  AddressScreen(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  //   child: Row(
                  //     children: [
                  //       const Column(
                  //         children: [
                  //           // OverallPortfolioCard(),
                  //           //  OverviewStatistic(),
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         width: context.width * 0.023,
                  //       ),
                  //       //const StockWidget(),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
