import 'package:flutter/material.dart';
import '../widget/change_theme_button_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppAndSearchBar(context),
            titleTextAndChip(),
            horizontalListViewImage(context),
            titleTextAndChip(),
            horizontalListViewImage(context),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  SizedBox customAppAndSearchBar(BuildContext context) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3 - 27,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(36.0),
                bottomRight: Radius.circular(36.0),
              ),
              color: Colors.green[700],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hi Dhruvi!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  ChangeThemeButtonWidget(),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/image.jpeg'),
                    radius: 30.0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 54.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50.0,
                    color: Colors.black.withOpacity(0.23),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: 'Search',
                ),
              ),
            ),
          ),
        ],
      ),
    );

  Padding titleTextAndChip() => Padding(
      padding: const EdgeInsets.only(left: 19.0, right: 16.0, top: 26.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recomended',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: const Offset(-5.0, 10.0),
                  blurRadius: 15.0,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
          ),
          Chip(
            label: const Text('More'),
            backgroundColor: Colors.green[700],
          ),
        ],
      ),
    );

  Container bottomNavigationBar() => Container(
      color: Colors.green[700],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home_outlined,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person_outline,
              size: 30.0,
            ),
          ),
        ],
      ),
    );

  SingleChildScrollView horizontalListViewImage(BuildContext context) => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          plantImageContainer(
              context, 'assets/plant1.jpeg', 'samantha\n', 'Russia', '\$440',
              () {
            Navigator.pushNamed(context, 'detail_screen');
          }),
          plantImageContainer(context, 'assets/plant2.jpg', 'angelica\n',
              'russia', '\$450', () {}),
          plantImageContainer(context, 'assets/plant3.jpeg', 'angelica\n',
              'russia', '\$450', () {}),
          plantImageContainer(context, 'assets/plant4.jpeg', 'angelica\n',
              'russia', '\$450', () {}),
          plantImageContainer(context, 'assets/plant5.jpeg', 'angelica\n',
              'russia', '\$450', () {}),
          plantImageContainer(context, 'assets/plant6.jpeg', 'angelica\n',
              'russia', '\$450', () {}),
        ],
      ),
    );

  Container plantImageContainer(BuildContext context, String img, String title,
      String country, String price, VoidCallback voidCallback) => Container(
      margin: const EdgeInsets.only(
        left: 30.0,
        top: 30.0 / 2,
        bottom: 20.0 * 2.5,
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
            child: GestureDetector(
              onTap: voidCallback,
              child: Image.asset(
                img,
                fit: BoxFit.cover,
                width: 180.0,
                height: 150.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(50.0 / 3),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: title.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: country.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  price,
                  style: TextStyle(color: Colors.green[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
