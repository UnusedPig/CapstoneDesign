import 'package:flutter/material.dart';
import 'Image_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Loker'),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                print('account clicked');
              },
            )
          ],
        ),
        body: Builder(
          builder: (context) => GestureDetector(
            onTapDown: (TapDownDetails details) {
              final RenderBox box = context.findRenderObject() as RenderBox;
              final Offset localOffset = box.globalToLocal(details.globalPosition);
              final Size size = box.size;
              final double x = localOffset.dx / size.width;
              final double y = localOffset.dy / size.height;
              if (x >= 0.3 && x <= 0.7 && y >= 0.3 && y <= 0.7) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImageScreen()),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              child: InteractiveViewer(
                child: Image.asset(
                  'assets/images/locker.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.lock),
                const Icon(Icons.place),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton clicked');
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
