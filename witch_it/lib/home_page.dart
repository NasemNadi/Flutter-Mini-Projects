import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'ids.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: const Text("YouTube",
          style: TextStyle(
            fontWeight: FontWeight.bold,color: Colors.red
          ),

        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined)),
        ],
      ),
      body: ListView.builder(
        itemCount: id.length,
        itemBuilder: (context, index) {
          return YoutubePlayerScaffold(
            controller: YoutubePlayerController.fromVideoId(
              videoId: id[index]['id'],
              params: const YoutubePlayerParams(showControls: true),
            ),
            builder: (context, player) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  player,
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      id[index]['titel'],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }}