import 'package:flutter/material.dart';


import 'dart:ffi';
import 'dart:io';

//import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


//import 'package:fluttermultipart/upload_page.dart';

class Customerdetails extends StatefulWidget {
  const Customerdetails({Key? key}) : super(key: key);

  @override
  State<Customerdetails> createState() => _CustomerdetailsState();
}

class _CustomerdetailsState extends State<Customerdetails> {

   TextEditingController nameController = TextEditingController(); 



/**le pick up image  */

PickedFile? imageFile=null;
   Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
        child: ListBody(
          children: [
            Divider(height: 1,color: Colors.blue,),
            ListTile(
              onTap: (){
                _openGallery(context);
              },
            title: Text("Gallery"),
              leading: Icon(Icons.account_box,color: Colors.blue,),
        ),

            Divider(height: 1,color: Colors.blue,),
            ListTile(
              onTap: (){
                _openCamera(context);
              },
              title: Text("Camera"),
              leading: Icon(Icons.camera,color: Colors.blue,),
            ),
          ],
        ),
      ),);
    });
  }





/**fin code pick up image  */






  @override
  Widget build(BuildContext context) {


       return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Custom'),
         
          Padding(  
                  padding: EdgeInsets.all(15),  
                  child:
          TextField(
                controller: nameController,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'remarque',  
                      hintText: 'Entre une remarque',  
                    ),
            onChanged: (text) {
            print('First text field: $text');
          //  email =  text  ;
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
                      labelText: 'Prenom',  
                      hintText: 'Enter voter Prenom',  
                    ),
            onChanged: (text) {
            print('First text field: $text');
          //  email =  text  ;
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
                      labelText: 'Nombre de telephone',  
                      hintText: 'Enter votre Nbr de telephone',  
                    ),
            onChanged: (text) {
           // print('First text field: $text');
          //  email =  text  ;
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
            onChanged: (text) {
            print('First text field: $text');
          //  email =  text  ;
           },
          ),
          ),



          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child:( imageFile==null)?Text("Choose Image"): 
                  Image.file( File(  imageFile!.path ),height: 200,
                  ),
                  
                ),
                //height : 100,
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.pink,
                  onPressed: (){
                    _showChoiceDialog(context);
                  },
                  child: Text("Select Image"),

                )
              ],
            ),
          ),












           


            ElevatedButton(
          onPressed: (){},
          //postData,
          child: const Text('**save**'),
          ),
          



        ],
        
      ),

    );

    
  }





  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context)  async{
      final pickedFile = await ImagePicker().getImage(
            source: ImageSource.camera ,
            );
            setState(() {
            imageFile = pickedFile!;
      });
      Navigator.pop(context);
  }
}












