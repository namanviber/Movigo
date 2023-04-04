// import 'package:flutter/material.dart';
//
// class ForgetPassword extends StatefulWidget {
//   const ForgetPassword({Key? key}) : super(key: key);
//
//   @override
//   State<ForgetPassword> createState() => _ForgetPasswordState();
// }
//
// class _ForgetPasswordState extends State<ForgetPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/images/background_login.png'),
//             fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Container(
//               height: 200,
//             ),
//             Container(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                   TextFormField(
//                   controller: _email,
//                   decoration: InputDecoration(
//                     hintText: "Enter email address",
//                     labelText: "Email",
//                   ),
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (value) {
//                     if (value!.isEmpty && !EmailValidator.validate(value)) {
//                       return "Enter valid email";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),]
//             ),
//                 ]
//           ),
//         ),
//       ),
//     );
//   }
// }
