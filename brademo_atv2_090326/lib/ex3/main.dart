import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 30.0),
        Text(label, style: TextStyle(fontSize: 15, color: color)),
      ],
    );
  }
}

class Square extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final double width;
  final double height;

  const Square({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: width,
      height: height,
      color: color,
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Text(text, style: TextStyle(fontSize: 10, color: Colors.white)),
          Icon(icon, color: Colors.pink.shade600, size: 30),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 100,
              child: Container(
                width: 400,
                height: 400,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Square(
                      color: Colors.amber.shade600,
                      text: 'Âmbar',
                      icon: Icons.air,
                      width: 200,
                      height: 200,
                    ),
                    Positioned(
                      top: 50,
                      left: 50,
                      child: Square(
                        color: Colors.green.shade600,
                        text: 'Verde',
                        icon: Icons.eco,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 100,
                      child: Square(
                        color: Colors.purple.shade600,
                        text: 'Roxo',
                        icon: Icons.star,
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NavItem(icon: Icons.call, label: 'Call', color: Colors.pink),
              NavItem(
                icon: Icons.alt_route_sharp,
                label: 'Route',
                color: Colors.green,
              ),
              NavItem(
                icon: Icons.ios_share,
                label: 'Share',
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
