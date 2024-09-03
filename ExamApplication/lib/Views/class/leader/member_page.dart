import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
                hintText: "Số điện thoại",
                controller: null,
                padding: MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 10.0)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.lightBlue,
          ),
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: const ListTile(
            title: Text("Tên"),
            subtitle: Text("SĐT"),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.delete),
          ),
        ),
      ]),
    );
  }
}
