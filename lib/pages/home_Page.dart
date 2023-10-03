import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(14, 150, 157,1),
        appBar: AppBar(
          title: Text('Permits App'),
        ),
        body: Center(
          child: Flex(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Hello, Moze!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'I wish you a happy life!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              // Expanded(child: SizedBox()),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: [
                  PermitChip(
                    icon: Icons.fireplace,
                    label: 'Fire',
                  ),
                  PermitChip(
                    icon: Icons.flash_on,
                    label: 'Electricity',
                  ),
                  PermitChip(
                    icon: Icons.eco,
                    label: 'Plant',
                  ),
                  PermitChip(
                    icon: Icons.build,
                    label: 'ToolKit',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PermitChip extends StatelessWidget {
  final IconData icon;
  final String label;


  PermitChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width/2.5,
      height: MediaQuery.sizeOf(context).height/7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          bottomRight: Radius.circular(5.0),
          bottomLeft: Radius.circular(5.0),
          topLeft: Radius.circular(5.0),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
            color: Color.fromRGBO(157, 215, 219,1),

          ),
          SizedBox(height: 10.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
