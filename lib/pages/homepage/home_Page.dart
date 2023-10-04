import 'package:flutter/material.dart';

import 'components/chip.dart';
import 'components/permit_class.dart';

class HomePage extends StatelessWidget {
  final String greeting;
  final String heading;
  final List<PermitItem> permitItems;

  HomePage(
      {this.greeting = 'Hello, Dear!',
      this.heading = 'Choose the Work Permit',
      this.permitItems = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 150, 157, 1),
      appBar: AppBar(
        title: Text('Permits App'),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  greeting,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  heading,
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
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20.0,
                runSpacing: 20.0,
                children: permitItems
                    .map((item) =>
                        PermitChip(icon: item.icon, label: item.label))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
