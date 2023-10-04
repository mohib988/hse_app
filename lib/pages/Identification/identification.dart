import 'package:flutter/material.dart';

import 'components/chip.dart';

class Identification extends StatelessWidget {
  const Identification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(14, 150, 157, 1),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Hello, Dear!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 10.0),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Report the Hazard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Flexible(
                flex: 9,
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    PermitChip(
                      icon: Icons.report,
                      label: 'Report',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
