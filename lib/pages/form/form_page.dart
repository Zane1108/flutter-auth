import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'display_page.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedReligion;
  String? _selectedGender;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate != null &&
          _selectedReligion != null &&
          _selectedGender != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayPage(
              name: _nameController.text,
              email: _emailController.text,
              birthDate: _selectedDate!,
              religion: _selectedReligion!,
              gender: _selectedGender!,
            ),
          ),
        );
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(picked);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Select Birth Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await _selectDate(context);
                },
                readOnly: true,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                value: _selectedReligion,
                items: [
                  DropdownMenuItem(
                    value: 'Islam',
                    child: Text('Islam'),
                  ),
                  DropdownMenuItem(
                    value: 'Christian',
                    child: Text('Christian'),
                  ),
                  DropdownMenuItem(
                    value: 'Hindu',
                    child: Text('Hindu'),
                  ),
                  DropdownMenuItem(
                    value: 'Buddhist',
                    child: Text('Buddhist'),
                  ),
                ].map<DropdownMenuItem<String>>(
                    (DropdownMenuItem<String> item) {
                  return DropdownMenuItem<String>(
                    value: item.value,
                    child: item.child,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedReligion = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select your religion';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Column(
                children: [
                 ListTile(
                        title: const Text('Male'),
                        leading: Radio<String>(
                          value: 'Male',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Female'),
                        leading: Radio<String>(
                          value: 'Female',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
