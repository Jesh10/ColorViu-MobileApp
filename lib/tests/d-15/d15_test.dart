import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorviu/models/user.dart';
import 'package:colorviu/models/color.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/services/database.dart';
import 'package:colorviu/tests/d-15/submit_button.dart';
import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class d15 extends StatefulWidget {
  const d15({super.key});

  @override
  State<d15> createState() => _d15State();
}

class _d15State extends State<d15> {
  List colors = [];

  Map<int, String> color = {
    0: 'assets/#3781C1.png',
    1: 'assets/#3583B4.png',
    2: 'assets/#3B84A7.png',
    3: 'assets/#39859C.png',
  };

  // List<Color> colors = [
  //   Color(id: 0, color: 'assets/#3781C1.png'),
  //   Color(id: 1, color: 'assets/#3583B4.png'),
  //   Color(id: 2, color: 'assets/#3B84A7.png'),
  //   Color(id: 3, color: 'assets/#39859C.png'),
  //   Color(id: 4, color: 'assets/#3B8690.png'),
  //   Color(id: 5, color: 'assets/#3F8782.png'),
  //   Color(id: 6, color: 'assets/#588473.png'),
  //   Color(id: 7, color: 'assets/#6C8164.png'),
  //   Color(id: 8, color: 'assets/#837B5D.png'),
  //   Color(id: 9, color: 'assets/#907660.png'),
  //   Color(id: 10, color: 'assets/#9E6E6F.png'),
  //   Color(id: 11, color: 'assets/#9F6D7C.png'),
  //   Color(id: 12, color: 'assets/#9C6D89.png'),
  //   Color(id: 13, color: 'assets/#927099.png'),
  //   Color(id: 14, color: 'assets/#8F6FA4.png'),
  //   Color(id: 15, color: 'assets/#8073B2.png'),
  //   Color(id: 16, color: 'assets/#7567A3.png'),
  // ]..shuffle();

  final CollectionReference questionsCollection =
      FirebaseFirestore.instance.collection('questions');

  // void getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await questionsCollection.get();

  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList()
  //     ..shuffle();

  //   print(allData);
  // }

  void submit() {
    print(color[0]);
  }

  int variableSet = 0;
  ScrollController? _scrollController;
  double? width;
  double? height;

  @override
  void initState() {
    super.initState();
    //getData();
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ColorUser>?>.value(
      value: DatabaseService(uid: '').users,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Color Deficiency Test '),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: [
            ElevatedButton.icon(
                icon: const Icon(Icons.person),
                label: const Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                }),
            // TextButton.icon(
            //   onPressed: () => _showSettingsPanel(),
            //   icon: Icon(Icons.settings),
            //   label: Text('settings'))
          ],
        ),
        body: DragAndDropGridView(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 4,
          ),
          padding: const EdgeInsets.fromLTRB(192, 10, 160, 0),
          itemBuilder: (context, index) => Card(
            elevation: 2,
            child: LayoutBuilder(
              builder: (context, constrains) {
                if (variableSet == 0) {
                  height = constrains.maxHeight;
                  width = constrains.maxWidth;
                  variableSet++;
                }
                return GridTile(
                  child: Image(
                    image: AssetImage(color[index].toString()),
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                );
              },
            ),
          ),
          itemCount: color.length,
          onWillAccept: (oldIndex, newIndex) {
            if (colors[newIndex] == "something") {
              return false;
            }
            return true;
          },
          onReorder: (oldIndex, newIndex) {
            final temp = colors[oldIndex];
            colors[oldIndex] = colors[newIndex];
            colors[newIndex] = temp;
            setState(() {});
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Align(
            alignment: Alignment.centerLeft,
            heightFactor: 3.5,
            child: SizedBox(
              width: 60,
              height: 200,
              child: FloatingActionButton(
                  onPressed: null, child: SubmitButton(submit: submit)),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
