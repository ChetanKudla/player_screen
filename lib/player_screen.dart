import 'package:flutter/material.dart';
import 'package:untitled1/third_screen.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  int _duelCommandment = 0;

  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final Color customBg = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: customBg,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const PremiumArtWorkCard(),
                  const SizedBox(height: 24),
                  SizedBox(
                      width: double.infinity,
                      child: TrackInfoText(
                    title: "HipHop",
                    subtitle: "XXXTentacion",
                  )),
                  const SizedBox(height: 16),
                  MySlider(
                    currentProgress: _duelCommandment.toDouble(),
                    onProgressChanged: (double newValue) {
                      setState(() {
                        _duelCommandment = newValue.round();
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: AudioProgressBar(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.skip_previous,
                          color: Color(0xffD4AF37),
                          size: 36,
                        ),
                        onPressed: () {
                        },
                      ),
                      const SizedBox(width: 32),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPlaying = !_isPlaying;
                          });
                        },
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.white,
                          child: Icon(
                            size: 35,
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 32),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_next,
                          color: Color(0xffD4AF37),
                          size: 36,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder:
                          (context) =>  ThirdScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TrackInfoText extends StatelessWidget {

  final String title;
  final String subtitle;

  const TrackInfoText({super.key,
    required this.title,
    required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('01:23', style: TextStyle(color: Colors.white38, fontSize: 12)),
        Text('15:00', style: TextStyle(color: Colors.white38, fontSize: 12)),
      ],
    );
  }
}

class PremiumArtWorkCard extends StatefulWidget {
  const PremiumArtWorkCard({super.key});

  @override
  State<PremiumArtWorkCard> createState() => _PremiumArtWorkCardState();
}

class _PremiumArtWorkCardState extends State<PremiumArtWorkCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 350),
              decoration: BoxDecoration(
                color: Colors.white10,
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?q=80&w=1000&auto=format&fit=crop',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isFavorited = !_isFavorited;
                  });
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black54,
                  child: Icon(
                    _isFavorited ? Icons.favorite : Icons.favorite_border,
                    size: 26,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySlider extends StatelessWidget {
  final double currentProgress;
  final ValueChanged<double> onProgressChanged;

  const MySlider({
    super.key,
    required this.currentProgress,
    required this.onProgressChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 15.0,
        activeTrackColor: const Color(0xffD4AF37),
        inactiveTrackColor: Colors.white10,
        allowedInteraction: SliderInteraction.tapAndSlide,
        thumbColor: const Color(0xff000000),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
      ),
      child: Slider(
        value: currentProgress,
        min: 0.0,
        max: 500.0,
        onChanged: onProgressChanged,
      ),
    );
  }
}
