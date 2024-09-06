import 'package:first_design/models/agent_model.dart';
import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  final Data agentModel;
  PersonScreen({required this.agentModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            agentModel.displayName ?? "",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    child: Positioned(
                      left: 0.0,
                      child: Image(
                        image: NetworkImage(agentModel.background ?? ""),
                      ),
                    ),
                  ),
                  Image(
                    image: NetworkImage(agentModel.fullPortrait ?? ""),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
            Text(
              agentModel.description ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(agentModel.displayName ?? ""),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: const Image(
                      image: AssetImage('assets/images/Group 6 (3).png'),
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const Image(
                      image: AssetImage('assets/images/Group 7 (1).png'),
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const Image(
                      image: AssetImage('assets/images/Group 8.png'),
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const Image(
                      image: AssetImage('assets/images/Group 9.png'),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
