import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class UpdateScreen extends StatefulWidget {
  
   final String text;
//const Foo({Key? key}): super(key: key);
  // receive data from the FirstScreen as a parameter
  const UpdateScreen({Key? key, required this.text}) : super(key: key);

  
  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {


  //get text => text;
  var scoreavatar1;
  var scoreavatar2;

  //print(text)
//  const UpdateScreen({Key? key, required this.text}) : super(key: key);

   //var text = text ;
  //var useremail;




    updateData() async {
    //patch('/updateaccount/:email'
    //updateaccount/:email
    /**
    * 
    * String a = 'a';
    String b = 'b';
    var c1 = a + b;
    var c2 = '$a$b';
    */


    String useremail = widget.text;
    String link = 'http://172.16.30.184:3000/updateaccount/';
  try{
  var response = await http.patch(
    Uri.parse(link+useremail),
    body: {"scoreavatar1":scoreavatar1.toString() , "scoreavatar2":scoreavatar2.toString()
    
    }
    );
    print(response.body);}catch(e){
      print(e);
      print("silketapp");

    }

}


  TextEditingController nameController = TextEditingController();  


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Update'),
      ),

       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          

              Text(widget.text),

                   


 Padding(   padding: EdgeInsets.all(15),  
            child:



          TextField(
            controller: nameController,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'User Name',  
                      hintText: 'Enter Your Name',  
                    ),

            onChanged: (text) {
            scoreavatar1 =  text  ;
           },
          ),
 ),


  Padding(  
                  padding: EdgeInsets.all(15),  
                  child:
           TextField(
              controller: nameController,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'User Name',  
                      hintText: 'Enter Your Name',  
                    ),


            onChanged: (text)  {
              scoreavatar2 = text ;
            },
          ),
  ),
          
          ElevatedButton(
          onPressed: updateData,
          child: const Text('save'),
          ),
          




        ],
        
      ),



    );
    
  }
}

