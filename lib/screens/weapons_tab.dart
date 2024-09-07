import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_design/models/weapons_model.dart';
import 'package:flutter/material.dart';

class WeaponsTab extends StatelessWidget {
  final Future<Weapons> weaponsFuture;

  const WeaponsTab({Key? key, required this.weaponsFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weapons>(
      future: weaponsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data?.data == null) {
          return const Center(child: Text('No weapons found.'));
        } else {
          var weapons = snapshot.data?.data ?? [];
          return ListView.builder(
            itemCount: weapons.length,
            itemBuilder: (context, index) {
              var weapon = weapons[index];
              return Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Stack(
                    children: [
                      Card(
                        color: Color(0xff081E34),
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          weapon.displayName ?? '',
                                          style: const TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          weapon.category ?? '',
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
                          ),
                        ),
                      ),
                      Positioned(
                        left: 100,
                        right: 30,
                        child: CachedNetworkImage(
                          imageUrl: weapon.displayIcon ?? '',
                          height: 150.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/monitor-1350918_640.webp',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
