import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});

  // This is the array (List) of data we will feed into the UI
  final List<Map<String, String>> upNextTracks = [
    {"title": "HipHop", "artist": "XXXTentacion", "duration": "03:45"},
    {"title": "Ocean Waves", "artist": "Nature Sounds", "duration": "10:00"},
    {"title": "Deep Sleep", "artist": "Mano Shanti", "duration": "45:00"},
    {"title": "Morning Focus", "artist": "Daily Zen", "duration": "05:00"},
    {"title": "Anxiety Release", "artist": "Mano Shanti", "duration": "20:00"},
    // You could have 50 or 500 items here, ListView.builder handles it perfectly.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Your Playlist",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450), // Keeping it web-responsive
          child: Padding(
            padding: const EdgeInsets.all(16.0),

            // This is the core engine for rendering dynamic lists
            child: ListView.builder(
              itemCount: upNextTracks.length,
              reverse: false,
              itemBuilder: (context, index) {

                final track = upNextTracks[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xff1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            track["title"]!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            track["artist"]!,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        track["duration"]!,
                        style: const TextStyle(
                            color:  Color(0xffD4AF37), fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}