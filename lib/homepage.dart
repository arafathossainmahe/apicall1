import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'widget/custom_buttom.dart';
import 'widget/hexa_color_converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = "no data";

  bool? isLoading = false;

  getData() async {
    setState(() {
      isLoading = true;
    });

    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    setState(() {
      data = response.body;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Data Call"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                isLoading: false,
                title: "Send me",
                onClick: () {
                  setState(() {
                    isLoading = !isLoading!;
                  });
                }),
            Container(
              color: HexaColor("3cb371"),
              height: 200, width: 100,
              // child: Text(data,style:const TextStyle(fontSize: 30),),
            ),
          ],
        ),
      ),
    );
  }
}
