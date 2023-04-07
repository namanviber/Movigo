import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        // primarySwatch:Colors.black54,
      ),
      home: ProfileEditPage(),
    );
  }
}

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  // late String _selectedGender;

  final _phoneRegex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title:Text("Account",
            style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_photo.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Sidharth Aggarwal',
              style: TextStyle(
                  fontFamily: 'inter',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 3),
            Text('sidharth@gmail.com',
                style: TextStyle(
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Colors.grey)),
            SizedBox(height: 16,),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your username',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white, width: 1.1)),
              ),
            ),
            SizedBox(height: 18),
            TextFormField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white, width: 1.1)),
              ),
            ),
            SizedBox(height: 18),
            buildTextField('Password', true),
            SizedBox(height: 22),
            TextFormField(
              controller: _phoneController,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white, width: 1.1)),
                prefixIcon: DropdownButton<String>(
                  style: TextStyle(),
                  value: '+91',
                  items: <String>['+91', '+1', '+44', '+81']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {},
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
                  child: Text(value,
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black,
                      )),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  // _selectedGender = value!;
                });
              },
            ),
            SizedBox(height: 17),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    // readOnly: true,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                            BorderSide(color: Colors.white, width: 1.1)),
                        labelText: 'Age',
                        prefixIcon: Icon(Icons.calendar_today),
                        prefixIconColor: Colors.white),
                    onTap: () {
                      _selectDate(context);
                    },
                    controller: TextEditingController(
                      // text: _selectedDate == null
                      //     ? ''
                      // : DateFormat('dd/MM/yyyy').format(_selectedDate),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(

              onPressed: () {},
              child: Text('Save Changes',),

              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF075D7A),
                  fixedSize: Size(150, 50)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String label, bool isPassTextField) {
  return TextField(
    obscureText: isPassTextField ? true : false,
    style: TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.white, width: 1.1)),
        suffixIcon: isPassTextField
            ? IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.white,
            ))
            : null,
        prefixIcon: Icon(
          Icons.lock,
        ),
        prefixIconColor: Colors.white),
  );
}
