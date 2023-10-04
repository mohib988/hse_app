import 'package:flutter/material.dart';

class SafetyCheckModel {
  Map<String, String> answers = {};
  int numberOfDays = 1;
}

class SafetyCheckForm extends StatefulWidget {
  @override
  _SafetyCheckFormState createState() => _SafetyCheckFormState();
}

class _SafetyCheckFormState extends State<SafetyCheckForm> {
  final _formKey = GlobalKey<FormState>();
  final _model = SafetyCheckModel();

  final List<String> questions = [
    'Are fire extinguishers available and in working order?',
    'Are combustible liquids stored in approved containers and away from ignition sources?',
    'Are gas cylinders secured and stored upright?',
    'Are electrical cords and equipment in good condition and free of damage?',
    'Are flammable materials kept to a minimum and disposed of properly?',
    'Are hazardous substances labeled and stored correctly?',
    'Are spill kits and first aid kits available and accessible?',
    'Are emergency exits and routes clear of obstructions?',
    'Are workers trained and competent to perform the task safely?',
    'Have workers been informed of the potential hazards and risks involved in the task?',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Check Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Part 1: Safety Check',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: questions.map((question) {
                    return buildRadioGroup(
                        question, _model.answers[question] ?? '');
                  }).toList(),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth >= 600 ? 200 : double.infinity,
                  child: DropdownButtonFormField<int>(
                    value: _model.numberOfDays,
                    items: List.generate(7, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text('${index + 1} days'),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        _model.numberOfDays = value ?? 1;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Number of Days',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // You can access the form data using _model.
                      // For example: _model.answers['Question 1'], _model.answers['Question 2'], etc.
                      // _model.numberOfDays contains the selected number of days.
                      // Here, you can perform actions like saving to a database.
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioGroup(String question, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question),
        Row(
          children: [
            ...['Does not apply', 'Yes', 'No'].map((choice) {
              return Row(
                children: [
                  Radio(
                    value: choice,
                    groupValue: value,
                    onChanged: (val) {
                      setState(() {
                        _model.answers[question] = val!;
                      });
                    },
                  ),
                  Text(choice),
                ],
              );
            }).toList(),
          ],
        ),
      ],
    );
  }
}
