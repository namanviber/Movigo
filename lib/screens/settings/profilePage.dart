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
  void initState() {
    var content = MongoDatabase.getUserData();
    super.initState();
  }

  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  var _gender;
  final TextEditingController _region = TextEditingController();
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Account",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Theme.of(context).textTheme.titleLarge!.color)),
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
              backgroundColor: Theme.of(context).primaryColor,
              radius: 70,
              child: Text(
                "N",
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "namanviber@gmail.com",
              style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: TextStyle(color: Theme.of(context).textTheme.titleSmall!.color),
              cursorColor: Colors.white,
              controller: _name,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your username',
                prefixIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).iconTheme.color,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white, width: 1.1),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: TextStyle(color: Theme.of(context).textTheme.titleSmall!.color),
              cursorColor: Colors.white,
              controller: _age,
              decoration: InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your Age',
                prefixIcon: Icon(
                  Icons.person_pin_sharp,
                  color: Theme.of(context).iconTheme.color,
                ), // Set the desired background color
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white, width: 1.1),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              style: TextStyle(color: Theme.of(context).textTheme.titleSmall!.color),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Theme.of(context).textTheme.titleSmall!.color),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white, width: 1.1)),
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
                    style: TextStyle(color: Theme.of(context).textTheme.titleSmall!.color),

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
              style: TextStyle(color: Theme.of(context).textTheme.titleSmall!.color),
              cursorColor: Theme.of(context).textTheme.titleSmall!.color,
              controller: _region,
              decoration: InputDecoration(
                labelText: 'Region',
                labelStyle: TextStyle(color: Theme.of(context).textTheme.titleSmall!.color),
                hintText: 'Enter your Country',
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Theme.of(context).iconTheme.color,
                ), // Set the desired background color
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Theme.of(context).textTheme.titleSmall!.color!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Theme.of(context).textTheme.titleSmall!.color!, width: 1.1),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                MongoDatabase.updateUserData(_name.text.trim(), int.parse(_age.text.trim()), _gender, _region.text.trim());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF075D7A), fixedSize: Size(150, 50)),
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
