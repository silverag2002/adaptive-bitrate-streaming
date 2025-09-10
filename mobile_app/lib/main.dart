import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter HLS Player',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late BetterPlayerController _betterPlayerController;
  final String hlsUrl =
      "https://d3jxjbmcxkannb.cloudfront.net/1L2b4g-0AG_8Q0hS0l3REqm4h-Npt-Udh/master.m3u8"; // Your HLS stream URL

  @override
  void initState() {
    super.initState();

    // 1. Set up the data source for the player
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      hlsUrl,
      liveStream: false, // Set to true if it's a live stream
    );

    // 2. Configure the player controller
    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
        autoPlay: true,
        // The controls configuration enables the quality selection menu
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enableQualities: true,
        ),
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HLS Video with Quality Control')),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          // 3. Add the BetterPlayer widget to your layout
          child: BetterPlayer(controller: _betterPlayerController),
        ),
      ),
    );
  }
}
