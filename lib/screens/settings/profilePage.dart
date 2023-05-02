import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/models/getUserDetails.dart';
import 'package:project2/service/mongoDbCall.dart';

class Profilepage extends StatefulWidget {
  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _age = TextEditingController();

  TextEditingController _genderController = TextEditingController();

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
        child: FutureBuilder(
          future: MongoDatabase.getUserData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var content = getUserDetails.fromJson(snapshot.data);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).cardColor,
                    radius: 70,
                    child: Text(
                      content.emailId[0].toUpperCase(),
                      style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).textTheme.titleSmall!.color),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    content.emailId,
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
                    cursorColor: Theme.of(context).iconTheme.color,
                    controller: TextEditingController(text: content.name),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      floatingLabelBehavior: FloatingLabelBehavior
                          .always, // make label stay at top
                      labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.titleSmall!.color,
                      ),
                      // hintText: content.name ?? "Enter Your Name",
                      hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.titleSmall!.color,
                      ),
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
                    cursorColor: Theme.of(context).iconTheme.color,
                    controller:
                        TextEditingController(text: content.age.toString()),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Age',
                      labelStyle: TextStyle(
                          color: Theme.of(context).textTheme.titleSmall!.color),
                      // hintText: (content.age ?? "Enter Your Age").toString(),
                      hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.titleSmall!.color,
                      ),
                      prefixIcon: Icon(
                        Icons.person_pin_sharp,
                        color: Theme.of(context).iconTheme.color,
                      ), // Set the desired background color
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
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  DropdownButtonFormField<String>(
                    // controller: _genderController,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.titleSmall!.color),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                          color: Theme.of(context).textTheme.titleSmall!.color),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color!,
                            width: 2),
                      ),
                      labelText: 'Gender',
                      // controller: _genderController,
                      // hintText: content.gender ?? "Select your gender",
                      hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.titleSmall!.color,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    value: _gender,
                    items: _genderOptions.map((String value) {
                      return DropdownMenuItem<String>(

                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color:
                                  // Theme.of(context).indicatorColor
                                  Theme.of(context).cardColor),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    // controller: _genderController,
                  ),

                  SizedBox(height: 20),
                  TextFormField(

                    style: TextStyle(
                        color: Theme.of(context).textTheme.titleSmall!.color),
                    cursorColor: Theme.of(context).iconTheme.color,
                    controller: TextEditingController(text: content.region),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Region',
                      hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.titleSmall!.color,
                      ),
                      labelStyle: TextStyle(
                          color: Theme.of(context).textTheme.titleSmall!.color),
                      // hintText: content.region ?? 'Enter your Country',

                      prefixIcon: Icon(
                        Icons.location_city,
                        color: Theme.of(context).iconTheme.color,
                      ), // Set the desired background color
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color!,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(

                    onPressed: () {
                      MongoDatabase.updateUserData(
                          _name.text.trim(),
                          int.parse(_age.text.trim()),
                          _gender,
                          _region.text.trim()
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).iconTheme.color,
                        fixedSize: Size(150, 50)),
                    child: Text(
                      'Save Changes',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall!.color),
                    ),
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
