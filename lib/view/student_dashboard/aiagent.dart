import 'package:flutter/material.dart';
import 'package:innerxcrm_student/res/colors/app_color.dart';


class AiAgent extends StatefulWidget {
  const AiAgent({super.key});

  @override
  State<AiAgent> createState() => _AiAgentState();
}

class _AiAgentState extends State<AiAgent> {
  final _formKey = GlobalKey<FormState>();
  double corner = 20;
  TextEditingController typeMsg = TextEditingController();
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 90,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text(
              'AI Agent',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.blueAccent.withOpacity(0.05),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: const [
                  Center(
              child: Text(
                              'AI Agent',
                              style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
            ),
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