import 'package:flutter/material.dart';

class SafetyMeasuresModel {
  Map<String, String> equipmentStatus = {
    'Face Mask/Respirator': 'Yes',
    'Welding Shield': 'Yes',
    'Goggles': 'Yes',
    'Safety Shoes': 'Yes',
    'Full Body Harness': 'No',
    'Face Shield': 'No',
    'Safety Helmet': 'Yes',
    'Ear Plugs': 'Yes',
    'Gloves': 'Yes',
  };
}

class SafetyMeasuresForm extends StatefulWidget {
  @override
  _SafetyMeasuresFormState createState() => _SafetyMeasuresFormState();
}

class _SafetyMeasuresFormState extends State<SafetyMeasuresForm> {
  final _model = SafetyMeasuresModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Part 3: Safety Measures & Personal Protective Equipment Required',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DataTable(
                  columns: [
                    DataColumn(label: Text('Equipment')),
                    DataColumn(label: Text('Yes')),
                    DataColumn(label: Text('No')),
                  ],
                  rows: _model.equipmentStatus.keys.map((equipment) {
                    return DataRow(
                      cells: [
                        DataCell(Text(equipment)),
                        DataCell(Radio(
                          value: 'Yes',
                          groupValue: _model.equipmentStatus[equipment],
                          onChanged: (value) {
                            setState(() {
                              _model.equipmentStatus[equipment] = value!;
                            });
                          },
                        )),
                        DataCell(Radio(
                          value: 'No',
                          groupValue: _model.equipmentStatus[equipment],
                          onChanged: (value) {
                            setState(() {
                              _model.equipmentStatus[equipment] = value!;
                            });
                          },
                        )),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
