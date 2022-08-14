import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posthindi_application/screens/gettask_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  var email;

  var password;

  postData() async {
    try {
      var response = await http
          .post(Uri.parse("http://172.16.30.184:8080/signin"), body: {
        "id": 1.toString(),
        "email": email.toString(),
        "password": password.toString()
      });

      // if(response != null){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Gettask(),
          ));

      // }else{
      //   print("mot de pass est invalid ");
      //}
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('login'),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter Your Name',
              ),
              onChanged: (text) {
                print('First text field: $text');
                email = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter Password',
              ),
              onChanged: (text) {
                password = text;
              },
            ),
          ),
          ElevatedButton(
            onPressed: postData,
            child: const Text('login'),
          ),
        ],
      ),

/**
 * TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  ),
  onPressed: () { },
  child: Text('TextButton'),
)

 */

/*
      floatingActionButton: FloatingActionButton(
        onPressed: postData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
*/
    );
  }
}
