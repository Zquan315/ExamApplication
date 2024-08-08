import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: historyTest().length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(historyTest()[index]),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 1,
                color: Colors.blueGrey,
                indent: 10,
                endIndent: 10,
              );
            },
          ),
        ),
      ],
    );
  }
}

List<String> historyTest() {
  List<String> letters = List.generate(60, (index) => String.fromCharCode(65 + index));
  return letters;
}

