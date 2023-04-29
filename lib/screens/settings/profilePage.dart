import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/getUserDetails.dart';
import 'package:project2/service/mongoDbCall.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  getUserDetails? content;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    content = await MongoDatabase.getUserData();
    print(content); // You can use the content variable here
    // setState(() {}); // Call setState to update the state of the widget
  }



  final TextEditingController _name = TextEditingController(text:'gh');
  final TextEditingController _age = TextEditingController();
  var _gender;
  final TextEditingController _region = TextEditingController();
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Account",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              radius: 70,
              child: Text(
                "N",
                style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).textTheme.titleSmall!.color),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "namanviber@gmail.com",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleSmall!.color),
            ),
            SizedBox(height: 20),
            // TextEditingController _name = TextEditingController(text: 'John Doe'); // replace with value fetched from database

            TextFormField(
              style: TextStyle(
                color: Theme.of(context).textTheme.titleSmall!.color,
              ),
              cursorColor: Colors.white,
              controller: _name,
              decoration: InputDecoration(
                labelText: 'Name',
                floatingLabelBehavior:
                    FloatingLabelBehavior.always, // make label stay at top
                labelStyle: TextStyle(
                  color: Theme.of(context).textTheme.titleSmall!.color,
                ),
                hintText: 'Enter your username',
                prefixIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).iconTheme.color,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: Theme.of(context).iconTheme.color!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: Theme.of(context).iconTheme.color!,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: TextStyle(
                  color: Theme.of(context).textTheme.titleSmall!.color),
              cursorColor: Colors.white,
              controller: _age,
              decoration: InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall!.color),
                hintText: 'Enter your Age',
                prefixIcon: Icon(
                  Icons.person_pin_sharp,
                  color: Theme.of(context).iconTheme.color,
                ), // Set the desired background color
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      BorderSide(color: Theme.of(context).iconTheme.color!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              style: TextStyle(
                  color: Theme.of(context).textTheme.titleSmall!.color),
              decoration: InputDecoration(
                labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall!.color),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      BorderSide(color: Theme.of(context).iconTheme.color!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!, width: 2),
                ),
                labelText: 'Gender',
                prefixIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              items: _genderOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color:
                    // Theme.of(context).indicatorColor
                    Theme.of(context).cardColor
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              style: TextStyle(
                  color: Theme.of(context).textTheme.titleSmall!.color),
              cursorColor: Theme.of(context).textTheme.titleSmall!.color,
              controller: _region,
              decoration: InputDecoration(
                labelText: 'Region',
                labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall!.color),
                hintText: 'Enter your Country',
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Theme.of(context).iconTheme.color,
                ), // Set the desired background color
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      BorderSide(color: Theme.of(context).iconTheme.color!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                MongoDatabase.updateUserData(_name.text.trim(),
                    int.parse(_age.text.trim()), _gender, _region.text.trim());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                  fixedSize: Size(150, 50)),
              child: Text(
                'Save Changes',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
