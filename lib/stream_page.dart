// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:http/retry.dart';

// import 'const/key.dart';

// class StreamPage extends StatefulWidget {
//   const StreamPage({super.key});

//   @override
//   State<StreamPage> createState() => _StreamPageState();
// }

// class _StreamPageState extends State<StreamPage> {
//   final StreamController<String> _streamController = StreamController<String>();
//   String? data;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> _fetchData() async {
//     var time1 = DateTime.now();
//     final Response<ResponseBody> response = await Dio().post(
//         '${SKey.qahoUrl}/qaho',
//         data: jsonEncode({
//           "question": "Rama",
//           "session_id": "130",
//           "collection_name": "rama13"
//         }),
//         options: Options(
//             responseType: ResponseType.stream,
//             contentType: Headers.jsonContentType));

//     if (response.statusCode == 200) {
//       response.data?.stream.listen(
//         (chunk) {

//         },

//       );
//     } else {
//       _streamController.add('Uint8List(8)');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             FilledButton(onPressed: _fetchData, child: Text('fech')),
//             StreamBuilder<String>(
//               stream: _streamController.stream,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (snapshot.hasData) {
//                   return Center(child: Text(snapshot.data ?? 'No data'));
//                 } else {
//                   return Center(child: Text('No data'));
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _streamController.close();
//     super.dispose();
//   }
// }
