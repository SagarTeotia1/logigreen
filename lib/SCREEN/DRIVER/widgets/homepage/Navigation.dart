import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logigreen/SCREEN/DRIVER/HomeScreen/Driver_Home_Screen.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/SpeedoMeterWidget.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/carbon_emmisions.dart';
import 'package:video_player/video_player.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/videoplayback.mp4') // Replace with your video path
      ..setLooping(true);  // Set looping to true

    // Initialize the video controller and set the future to the initialization result
    _initializeVideoPlayerFuture = _controller.initialize();

    // Play the video immediately after it is initialized
    _initializeVideoPlayerFuture.then((_) {
      _controller.play();  // Start playing the video automatically
      setState(() {}); // Rebuild to reflect the video initialization
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose the controller to release resources
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: homeBg,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: homeBg,
              expandedHeight: 180,
              floating: false,
              pinned: true,
              leading: IconButton(onPressed: (){
                Get.off(()=>DriverHomeScreen());
              }, icon: Icon(Icons.arrow_back)), // This removes the back arrow
              flexibleSpace: FlexibleSpaceBar(
                background: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpeedometerWidget(),
                    // Add the speedometer widget
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
