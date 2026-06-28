import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  int _duelCommandment = 0;

  @override
  Widget build(BuildContext context) {
    final Color customBg = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: customBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [

              const SizedBox(height: 16),


              Expanded(
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxHeight: 350,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.all(16),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black54,
                          child: Icon(
                            size: 22,
                            Icons.favorite,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),


              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Deep Focus",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "15 Minutes",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),


              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 15.0,

                  activeTrackColor: const Color(0xffD4AF37),
                  inactiveTrackColor: Colors.white10,
                  allowedInteraction: SliderInteraction.tapAndSlide,
                  thumbColor: const Color(0xff000000),
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 6.0,
                  ),
                ),
                child: Slider(
                  value: _duelCommandment.toDouble(),
                  min: 0.0,
                  max: 500.0,
                  onChanged: (double newValue) {
                    setState(() {
                      _duelCommandment = newValue.round();
                    });
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('01:23', style: TextStyle(color: Colors.white38, fontSize: 12)),
                    Text('15:00', style: TextStyle(color: Colors.white38, fontSize: 12)),
                  ],
                ),
              ),

              const SizedBox(height: 24),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous, color: Color(0xffD4AF37), size: 36),
                    onPressed: () {},
                  ),

                  const SizedBox(width: 32),

                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.play_arrow, color: Colors.black, size: 40),
                  ),

                  const SizedBox(width: 32),

                  IconButton(
                    icon: const Icon(Icons.skip_next, color: Color(0xffD4AF37), size: 36),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
