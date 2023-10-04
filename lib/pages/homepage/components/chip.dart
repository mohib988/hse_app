import 'package:flutter/material.dart';

class PermitChip extends StatelessWidget {
  final IconData icon;
  final String label;

  PermitChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.sizeOf(context).width / 2.5,
        height: MediaQuery.sizeOf(context).height / 6,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black, blurRadius: 20, spreadRadius: 2)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(80.0),
            bottomRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            topLeft: Radius.circular(5.0),
          ),
        ),
        padding: EdgeInsets.all(15),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 60,
                color: Color.fromRGBO(157, 215, 219, 1),
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
        ]),
      ),
    );
  }
}
