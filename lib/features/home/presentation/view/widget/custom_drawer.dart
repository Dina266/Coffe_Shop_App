import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: const Icon(Icons.close),
              title: Text(
                "Close Menu",
                style: AppStyle.bold16.copyWith(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const ListTile(
                    title: Row(
                      children: [
                        Text('My Rewards', style: AppStyle.medium20),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(Icons.star, color: Colors.amber),
                        Text('1300', style: TextStyle(color: Colors.amber)),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_border),
                    title: const Text('My Favorite Items',
                        style: AppStyle.medium20),
                    onTap: () {
                      // Navigate to favorite items page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.store_mall_directory),
                    title:
                        const Text('My Saved Stores', style: AppStyle.medium20),
                    onTap: () {
                      // Navigate to saved stores page
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/scan.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: const Text('Scan / Pay', style: AppStyle.medium20),
                    onTap: () {
                      // Navigate to scan/pay page
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/order.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: const Text('Order', style: AppStyle.medium20),
                    onTap: () {
                      // Navigate to order page
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/account.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: const Text('My Account', style: AppStyle.medium20),
                    onTap: () {
                      // Navigate to account page
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
