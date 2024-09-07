import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_design/models/agent_model.dart';
import 'package:first_design/screens/person_screen.dart';
import 'package:flutter/material.dart';

class AgentsTab extends StatelessWidget {
  final Future<AgentModel> agentsFuture;

  const AgentsTab({Key? key, required this.agentsFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AgentModel>(
      future: agentsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data?.data == null) {
          return const Center(child: Text('No agents found.'));
        } else {
          var agents = snapshot.data!.data!;
          return SizedBox(
            height: double.infinity,
            child: CarouselSlider.builder(
              itemCount: agents.length,
              itemBuilder: (context, index, realIndex) {
                final agent = agents[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonScreen(agentModel: agent),
                      ),
                    );
                  },
                  child: buildPerson(
                    colors: agent.backgroundGradientColors ??
                        ['66376C', 'B1414C'], // استدعاء الألوان من الـ model
                    image: agent.fullPortrait ?? '',
                    text: agent.displayName ?? '',
                    context: context,
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 14,
                enlargeCenterPage: true,
                viewportFraction: 0.3,
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildPerson({
    required List<String> colors, // استقبال قائمة الألوان
    required String image,
    required String text,
    required BuildContext context,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          height: 430,
          width: 230,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(int.parse('0xFF${colors[0].replaceAll('#', '')}')),
                Color(int.parse('0xFF${colors[1].replaceAll('#', '')}')),
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(103),
              bottomLeft: Radius.circular(59),
              bottomRight: Radius.circular(22),
            ),
          ),
        ),
        Positioned(
          top: -100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CachedNetworkImage(
                imageUrl: image,
                width: 278,
                height: 482,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.image, size: 100, color: Colors.white),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 30.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
