import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  static const String id = 'detail_screen';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.white70,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * 0.5,
                child: imageAndIconRow(context, size),
              ),
              detailText(),
            ],
          ),
          customButton(size),
        ],
      ),
    );
  }

  Row imageAndIconRow(BuildContext context, Size size) => Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 10.0,
                        color: Colors.black45,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 10.0,
                        color: Colors.black45,
                      )
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.device_thermostat,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 10.0,
                        color: Colors.black45,
                      )
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.water_drop_sharp,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 10.0,
                        color: Colors.black45,
                      )
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.air,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: size.height * 0.5,
            width: size.width * 0.70,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3.0),
                  blurRadius: 10.0,
                  color: Colors.black45,
                )
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(30.0),
              ),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/plant2.jpg',
                ),
              ),
            ),
          ),
        )
      ],
    );

  Padding detailText() => Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Angelica\n'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700]),
                ),
                TextSpan(
                  text: 'Russia'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            '\$450',
            style: TextStyle(fontSize: 20.0, color: Colors.green[700]),
          )
        ],
      ),
    );

  Positioned customButton(Size size) => Positioned(
      bottom: 0,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
              ),
              color: _pressed ? Colors.green[700] : Colors.white,
            ),
            height: 84.0,
            width: size.width / 2,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _pressed = !_pressed;
                });
              },
              child: const Text(
                'Buy now',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                ),
                color: _pressed ? Colors.white : Colors.green[700]),
            height: 84.0,
            width: size.width / 2,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Description',
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ],
      ),
    );
}
