import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _currencies = ["Dollar", "Rupees", "Pound"];
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Interest Calculator')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset("images/samson.png", width: 300),
            SizedBox(height: 30),
            Text("Welcome"),
            TextField(
              decoration: InputDecoration(
                labelText: "Principal Amount",
                hintText: "Enter a principal amount e.g. 15000",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
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
                  child: TextField(
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
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (newSelectedValue) {},
                    value: "Rupees",
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Calculate")),
                SizedBox(width: 10.0),
                ElevatedButton(onPressed: () {}, child: Text("Reset")),
              ],
            ),
            Text("Result:"),
          ],
        ),
      ),
    );
  }
}
