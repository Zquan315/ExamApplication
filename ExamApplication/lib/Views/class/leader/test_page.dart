import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
                  hintText: "ID test",
                  controller: null,
                  padding: MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 10.0)),
                ),
              ),
              FloatingActionButton(
                onPressed: null,
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          listTest(15, "1111", 56)
        ]);
  }
}

Widget fabTest(String id, String time) {
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
                        "Members: $time",
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

Widget listTest(int amount, String id, int time) {
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
        return fabTest(
          id,
          '$time',
        );
      },
    ),
  );
}
