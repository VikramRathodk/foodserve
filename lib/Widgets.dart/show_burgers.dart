// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:foodserve/models/caterogyData.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';

// import '../pages/details.dart';

// class ShowBurgers extends StatelessWidget {
//   const ShowBurgers({super.key});

//   @override
//   Widget build(BuildContext context) {
   
//     return StreamBuilder(
//       stream: 
//           FirebaseFirestore.instance.collection("food").snapshots()
//           ,
//       builder: (context, snapshot) {
//         return Container(
//           margin: EdgeInsets.symmetric(horizontal: 12.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.0),
//             color: Colors.grey.shade100,
//           ),
//           height: 226,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) {
//                       return DetailsPage(
//                         id: index.toString(),
//                         subName: snapshot.data!.docs[index]['subName'],
//                         name: snapshot.data!.docs[index]['name'],price: snapshot.data!.docs[index]['price'],
//                       );
//                     },
//                   ));
//                 },
//                 child: Container(
//                   width: 150,
//                   margin: EdgeInsets.all(10.0),
//                   padding: EdgeInsets.symmetric(horizontal: 10.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SizedBox(
//                         height: 85,
//                         child: Lottie.network(
//                             categoryList[index].animatioImageurl,
//                             fit: BoxFit.contain),
//                       ),
//                       Text(
//                         snapshot.data!.docs[index]['name'],
//                         // foodDataList[index].name,
//                         style: GoogleFonts.breeSerif(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       Text(
//                         snapshot.data!.docs[index]['subName'],
//                         style: GoogleFonts.aBeeZee(
//                           color: Colors.green.shade400,
//                         ),
//                       ),
//                       Text(
//                         snapshot.data!.docs[index]['price'],
//                         style: GoogleFonts.aBeeZee(
//                             color: Colors.grey.shade900,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
