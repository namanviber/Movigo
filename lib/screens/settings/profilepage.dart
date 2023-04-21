import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // late String _selectedGender;

  final _phoneRegex = RegExp(r'(^(?:[+0]9)?\d{10,12}$)');

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
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              child: Text("N"),
            ),
            SizedBox(height: 20),
            Text(
              "Naman Jain",
              style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "namanviber@gmail.com",
              style: GoogleFonts.montserrat(
                  fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),


            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your username',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                filled: true, // Set filled to true
                fillColor: Colors.grey, // Set the desired background color
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

            SizedBox(height: 18),
            // buildTextField('Password', true),
            // SizedBox(height: 22),


            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your Age',
                prefixIcon: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                filled: true, // Set filled to true
                fillColor: Colors.grey, // Set the desired background color
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

SizedBox(
  height: 18,
),
            TextFormField(

              controller: _phoneController,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true, // Set filled to true
                fillColor: Colors.grey,
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white, width: 1.1)),
                // prefixIcon: DropdownButton<String>(
                //   style: TextStyle(),
                //   value: '+91',
                //   items: <String>['+91', '+1', '+44', '+81']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(
                //         value,
                //         style: TextStyle(
                //           color: Colors.white,
                //           backgroundColor: Colors.black,
                //         ),
                //       ),
                //     );
                //   }).toList(),
                //   onChanged: (value) {},
                // ),

                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (!_phoneRegex.hasMatch(value!)) {
                  return 'Enter a valid phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 19),




            DropdownButtonFormField<String>(
              style: TextStyle(color: Colors.white),

              // value: _selectedGender,
              decoration: InputDecoration(

                filled: true, // Set filled to true
                fillColor: Colors.grey,
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white, width: 1.1)),
                labelText: 'Gender',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              items: _genderOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      value,

                      style: TextStyle(

                        color: Colors.black, // Set the font color to white
                      ),
                    ),
                  ),
                );

              }).toList(),
              onChanged: (value) {
                setState(() {
                  // _selectedGender = value!;
                });
              },
            ),




            SizedBox(height: 17),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Region',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your Country',
                prefixIcon: Icon(
                  Icons.map_outlined,
                  color: Colors.white,
                ),
                filled: true, // Set filled to true
                fillColor: Colors.grey, // Set the desired background color
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
            ElevatedButton(
              onPressed: () {},
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
