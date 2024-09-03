import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/LogoApp.png", scale: 1.5,)
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Đổi mật khẩu",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue
                ),
              )
            ],
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("Mật khẩu", style: TextStyle(color: Colors.blue),),
                    prefixIcon: Icon(Icons.lock, color: Colors.blue,),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility, color: Colors.blue,),
                      onPressed: () {
                        setState(() {
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.withOpacity(.5)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("Xác nhận mật khẩu", style: TextStyle(color: Colors.blue),),
                    prefixIcon: Icon(Icons.lock, color: Colors.blue,),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility, color: Colors.blue,),
                      onPressed: () {
                        setState(() {
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),

          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all(Colors.blue),
                    foregroundColor:  MaterialStateProperty.all(Colors.black87),
                  ),
                  onPressed: () {  },
                  child: Text(
                      "Xác nhận"
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
