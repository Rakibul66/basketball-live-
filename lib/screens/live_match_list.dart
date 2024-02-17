import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg package
import '../constants/colors.dart';
import '../widget/LiveMatchListView.dart';

class LiveMatchList extends StatelessWidget {
  // Sample list of SVG asset paths for the carousel slider
  final List<String> svgAssetPaths = [
    'assets/images/b.svg',
    'assets/images/c.svg',
    'assets/images/d.svg',
    'assets/images/b.svg',
    'assets/images/c.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BG,
      body: Column(
        children: [
          // Add the carousel slider at the top with parallax effect
          SafeArea(child: ParallaxCarouselSlider(svgAssetPaths: svgAssetPaths)),
          Expanded(
            // Live match list below the carousel slider
            child: LiveMatchListView(),
          ),
        ],
      ),
    );
  }
}

class ParallaxCarouselSlider extends StatefulWidget {
  final List<String> svgAssetPaths;

  const ParallaxCarouselSlider({Key? key, required this.svgAssetPaths}) : super(key: key);

  @override
  _ParallaxCarouselSliderState createState() => _ParallaxCarouselSliderState();
}

class _ParallaxCarouselSliderState extends State<ParallaxCarouselSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Carousel Slider
        CarouselSlider(
          items: widget.svgAssetPaths.map((svgAssetPath) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: SvgPicture.asset(
                      svgAssetPath,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 200.0, // Adjust the height as needed
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
            onPageChanged: (index, _) {
              _currentPage = index.toDouble();
            },
          ),
        ),
        // Parallax Effect Container
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.4, 0.8],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
