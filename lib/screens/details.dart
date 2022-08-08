import 'package:flutter/material.dart';





class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('details'),
      ),
      body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        //Image.asset


Padding(  
                  padding: EdgeInsets.all(15),  
                  child:
         CircleAvatar(
                radius: 100,
                
                backgroundImage:AssetImage('assets/images/image1.jpg'),
              ),
),



        
          /*
              Image.asset(
                'assets/images/image1.jpg',
                height: 400,
                width: 400,
              ),
          */
          Padding(  
                  padding: EdgeInsets.all(15),  
                  child:
              Text("title "),
          ),

          Padding(  
                  padding: EdgeInsets.all(15),  
                  child:
               Text("Case read they must it of cold that. Speaking trifling an to unpacked moderate debating learning. An particular contrasted he excellence favourable on. Nay preference dispatched difficulty continuing joy one. Songs it be if ought hoped of. Too carriage attended him entrance desirous the saw. Twenty sister hearts garden limits put gay has. We hill lady will both sang room by"),
          ),

          Padding(  
                  padding: EdgeInsets.all(15),  
                  child:
          ElevatedButton(
          onPressed: (){},
         // postData,
          child: const Text('requests the service'),
          ),),


          

        ],


      ),

    );
    
  }
}
