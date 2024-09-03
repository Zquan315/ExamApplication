import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          const Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 40,
                child: SearchBar(
                  leading: Icon(Icons.search),
                  hintText: "ID Lớp",
                  controller: null,
                  padding: MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 10.0)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          listClass(15, "1111", 56, "quan123")
        ]);
  }
}

Widget createFAB(String id, String mem, String teacher) {
  return Padding(
      padding: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            FloatingActionButton.extended(
              onPressed: null,
              backgroundColor: Colors.teal,
              label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ID: $id",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Thành viên: $mem",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Giáo viên: $teacher",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ));
}

Widget listClass(int amount, String id, int mem, String teacher) {
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Số cột
        mainAxisSpacing: 0.0, // Khoảng cách giữa các hàng
        crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
        childAspectRatio: 2, // Tỷ lệ giữa chiều rộng và chiều cao
      ),
      itemCount: amount,
      itemBuilder: (BuildContext context, int index) {
        return createFAB(id, '$mem', teacher);
      },
    ),
  );
}
