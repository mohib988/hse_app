import 'package:flutter/material.dart';

import '../../../globalFunction/date_function.dart';

class WorkPermitFormModel {
  String requester = '';
  String phone = '';
  String email = '';
  String areaOfWork = '';
  bool isNewProject = false;
  bool isReplace = false;
  bool isBreakdown = false;
  String typeOfWork = '';
  List<String> toolsAndEquipment = [];
  DateTime startDateAndTime = DateTime.now();
  DateTime endDateAndTime = DateTime.now();
}

class RequestorInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Work Permit Form'),
        ),
        body: WorkPermitForm(),
      ),
    );
  }
}

class WorkPermitForm extends StatefulWidget {
  @override
  _WorkPermitFormState createState() => _WorkPermitFormState();
}

class _WorkPermitFormState extends State<WorkPermitForm> {
  final _formKey = GlobalKey<FormState>();
  final _model = WorkPermitFormModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Part A - Work Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Requester'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter requester';
                  }
                  return null;
                },
                onSaved: (value) {
                  _model.requester = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone';
                  }
                  return null;
                },
                onSaved: (value) {
                  _model.phone = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _model.email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Area of Work'),
                onSaved: (value) {
                  _model.areaOfWork = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Select one:'),
              ),
              Row(
                children: [
                  Text('New Project'),
                  Padding(
                      padding: EdgeInsets.only(left: 10), child: Text('Yes')),
                  Radio(
                    value: true,
                    groupValue: _model.isNewProject,
                    onChanged: (value) {
                      setState(() {
                        _model.isNewProject = value!;
                      });
                    },
                  ),
                  Text('No'),
                  Radio(
                    value: false,
                    groupValue: _model.isNewProject,
                    onChanged: (value) {
                      setState(() {
                        _model.isNewProject = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Replace'),
                  Radio(
                    value: true,
                    groupValue: _model.isReplace,
                    onChanged: (value) {
                      setState(() {
                        _model.isReplace = value!;
                      });
                    },
                  ),
                  Text('No'),
                  Radio(
                    value: false,
                    groupValue: _model.isReplace,
                    onChanged: (value) {
                      setState(() {
                        _model.isReplace = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Breakdown'),
                  Radio(
                    value: true,
                    groupValue: _model.isBreakdown,
                    onChanged: (value) {
                      setState(() {
                        _model.isBreakdown = value!;
                      });
                    },
                  ),
                  Text('No'),
                  Radio(
                    value: false,
                    groupValue: _model.isBreakdown,
                    onChanged: (value) {
                      setState(() {
                        _model.isBreakdown = value!;
                      });
                    },
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type of Work'),
                onSaved: (value) {
                  _model.typeOfWork = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Tools and Equipment:'),
              ),
              CheckboxListTile(
                title: Text('Screwdriver'),
                value: _model.toolsAndEquipment.contains('Screwdriver'),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      _model.toolsAndEquipment.add('Screwdriver');
                    } else {
                      _model.toolsAndEquipment.remove('Screwdriver');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Pliers'),
                value: _model.toolsAndEquipment.contains('Pliers'),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      _model.toolsAndEquipment.add('Pliers');
                    } else {
                      _model.toolsAndEquipment.remove('Pliers');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Multimeter'),
                value: _model.toolsAndEquipment.contains('Multimeter'),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      _model.toolsAndEquipment.add('Multimeter');
                    } else {
                      _model.toolsAndEquipment.remove('Multimeter');
                    }
                  });
                },
              ),
              Row(
                children: [
                  Text(" Start Date"),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      selectDateFunction(context, _model.startDateAndTime);
                    },
                    child: Icon(Icons.calendar_month),
                  ),
                  SizedBox(width: 10),
                  Text("  End Date"),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      selectDateFunction(context, _model.endDateAndTime);
                    },
                    child: Icon(Icons.calendar_month),
                  )
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
