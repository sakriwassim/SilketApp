import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:posthindi_application/screens/update_screen.dart';


class Gettask extends StatefulWidget {
  const Gettask({Key? key}) : super(key: key);

  @override
  State<Gettask> createState() => _GettaskState();
}

class _GettaskState extends State<Gettask> {


  // this allows us to access the TextField text
 // TextEditingController textFieldController = TextEditingController();





  List tasks = [] ;


   Future getTask () async {

    var url = Uri.parse('http://192.168.1.20:3000/accounts');

    

  //var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});

    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);

    


    
    setState(() {
      tasks.addAll(responsebody);
    });
    print(responsebody);
    print(tasks);
  }

  @override
  void initState() {
    getTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('getcompteur'),
      ),
      body: //const MyStatelessWidget(),

      ListView.builder(
        itemCount: tasks.length,


        itemBuilder: (context , i){
          return  TextButton(
                  child: Text("${tasks[i]['email']}"),
                  onPressed: () {
                  
                 //_sendDataToSecondScreen(context);

                  String textToSend = "${tasks[i]['email']}";
                  // textFieldController.text;
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => UpdateScreen(text: textToSend,),
                  ));



                  }
                );

          
        //  Text("${tasks[i]['email']}");

          
        },
      ),

    );
   }


}







class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}