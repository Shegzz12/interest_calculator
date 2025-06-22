// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogicAdded extends StatefulWidget {
  const LogicAdded({super.key});

  @override
  State<LogicAdded> createState() => _LogicAddedState();
}

class _LogicAddedState extends State<LogicAdded> {
  // ignore: no_leading_underscores_for_local_identifiers
  final _currencies = ["Dollar", "Rupees", "Pound"];
  var _currentSelectedItem = "Rupees";
  var displayResult = "";
  final _formKey = GlobalKey<FormState>();

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Interest Calculator')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset("images/samson.png", width: 300),
              SizedBox(height: 30),
              Text("Welcome"),
              TextFormField(
                controller: principalController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a principal amount";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Principal Amount",
                  hintText: "Enter a principal amount e.g. 15000",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a principal amount";
                  }
                  return null;
                },
                controller: roiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Rate of Interest",
                  hintText: "Enter in percentage",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: termController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a principal amount";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Terms",
                        hintText: "Terms in years e.g 10",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Currency",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      items: _currencies.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newSelectedValue) {
                        setState(() {
                          _currentSelectedItem = newSelectedValue!;
                        });
                      },
                      value: _currentSelectedItem,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          displayResult = calculateResult();
                        }
                      });
                    },
                    child: Text("Calculate"),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        resetFields();
                      });
                    },
                    child: Text("Reset"),
                  ),
                ],
              ),
              Center(
                child: Text(
                  "Result: $displayResult",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: 500),
            ],
          ),
        ),
      ),
    );
  }

  String calculateResult() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalPayable = principal + (principal * roi * term) / 100;
    String result =
        "After $term years, your investment will be worth of $totalPayable in $_currentSelectedItem";
    return result;
  }

  void resetFields() {
    principalController.text = "";
    roiController.text = "";
    termController.text = "";
    _currentSelectedItem = _currencies[0];
    displayResult = "";
  }
}
