// import 'package:flutter/material.dart';
// import 'package:apitest/api.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final ApiService apiService = ApiService();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('API Data')),
//         body: FutureBuilder<Map<String, dynamic>>(
//           future: apiService.fetchData(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text("Error: ${snapshot.error}"));
//             }

//             return Center(child: Text("Data: ${snapshot.data!['Message']}"));
//           },
//         ),
//       ),
//     );
//   }
// }
