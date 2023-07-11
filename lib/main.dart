
import 'package:app/sliders_and_drawer/drawer_menu_pages/chatdoner.dart';
import 'package:app/sliders_and_drawer/splash.dart';
import 'package:flutter/material.dart';


// final dbHelper = DatabaseHelper();

// Future<void> main() async {
//   await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );

// Future<void>main()async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await dbHelper.init();

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}


// class DataBase extends StatefulWidget {
//   const DataBase({super.key});

//   @override
//   State<DataBase> createState() => _DataBaseState();
// }

// class _DataBaseState extends State<DataBase> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(height: 20,),
//           ElevatedButton(onPressed: _insert, child: const Text("insert",style: TextStyle(fontSize: 20),)),
//           const SizedBox(height: 20,),
//           ElevatedButton(onPressed: _query, child: const Text("query",style: TextStyle(fontSize: 20),)),
//           const SizedBox(height: 20,),
//           ElevatedButton(onPressed: _update, child: const Text("update",style: TextStyle(fontSize: 20),)),
//           const SizedBox(height: 20,),
//           ElevatedButton(onPressed: _delete, child: const Text("delete",style: TextStyle(fontSize: 20),)),
//           const SizedBox(height: 20,),
//           ElevatedButton(onPressed: (){}, child: const Text("insert",style: TextStyle(fontSize: 20),)),
//         ],
//       )),
//     );
//   }
//   // button onpressed methods
//   void _insert()async{
//     // row to insert
//     Map<String,dynamic> row={
//       DatabaseHelper.columnName:'Bob',
//       DatabaseHelper.columnAge:23,
//     };
//     final id=await dbHelper.insert(row);
//     debugPrint('inserted row id : $id');
//   }
//   void _query() async {
//     final allRows = await dbHelper.queryAllRows();
//     debugPrint('query all rows:');
//     for (final row in allRows) {
//       debugPrint(row.toString());
//     }
//   }

//   void _update() async {
//     // row to update
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnId: 1,
//       DatabaseHelper.columnName: 'Mary',
//       DatabaseHelper.columnAge: 32
//     };
//     final rowsAffected = await dbHelper.update(row);
//     debugPrint('updated $rowsAffected row(s)');
//   }

//   void _delete() async {
//     // Assuming that the number of rows is the id for the last row.
//     final id = await dbHelper.queryRowCount();
//     final rowsDeleted = await dbHelper.delete(id);
//     debugPrint('deleted $rowsDeleted row(s): row $id');
//   }
// }