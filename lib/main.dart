import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Validation'),
        ),
        body: MyCustomForm(),
      ),
    );
  }

}

class MyCustomForm extends StatefulWidget {
  @override
  State<MyCustomForm> createState() => _MyCustomFormState() ;



}

class _MyCustomFormState extends State<MyCustomForm> {
  @override

 final fromkey= GlobalKey<FormState>();
  Widget build(BuildContext context) {

    return Form(

        child: Column(
          key: fromkey,
          children: [
            Text('Click'),
            Padding(
              padding:EdgeInsets.all(20) ,
              child: TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please Enter Value";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Sign Up'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Sign In'
                ),
                validator: (value){
                  if(value== null || value.isEmpty) {
                    return "Enter The DAta";
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(onPressed: (){
              if(fromkey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Prossing Data")));

              }
            }, child: Text("submit"))

          ],
        ) );
  }


}

