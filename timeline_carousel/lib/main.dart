import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Timeline Carousel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_buildCarousel()],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }

  Widget _buildCarousel() {
    var carouselData = _buildCarouselData(1, 20, 2);
    var initialPosition = carouselData.length / 2.round();

    return CarouselSlider(
      options: CarouselOptions(
          height: 60.0,
          initialPage: initialPosition.toInt(),
          enlargeCenterPage: true,
          autoPlay: false,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          viewportFraction: 0.4,
          enableInfiniteScroll: false),
      items: carouselData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.amber),
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    '£$i',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }

  List<int> _buildCarouselData(int rangeStart, int rangeEnd, int increment) {
    List<int> data = [];

    for (var i = rangeStart; i <= rangeEnd;) {
      data.add(i);
      i += increment;
    }

    return data;
  }
}
