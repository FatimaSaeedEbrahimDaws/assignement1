import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return
      MaterialApp( //
          debugShowCheckedModeBanner:false ,
          home: Directionality(
            textDirection: TextDirection.ltr,
            child:
            Scaffold(
              appBar: AppBar(
                title: Text('Layouts',style: TextStyle(color: Colors.black87),),
                centerTitle:true ,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black54),
                //brightness: Brightness.light,
                // systemOverlayStyle: SystemUiOverlayStyle.dark,
                leading: IconButton(icon: Icon(Icons.menu),onPressed: (){},),
                actions: <Widget>[
                  IconButton(onPressed: (){}, icon: Icon(Icons.cloud_queue))
                ],


              ),

              body: _buildBody(),
            ),


          )

      );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _buildJournalHeaderImage(),
        SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildJournalEntry(),
                  Divider(),
                  _buildJournalWeather(),
                  Divider(),
                  _buildJournalTags(),
                  Divider(),
                  _buildJournalFooterImages(),
                ],
              ),
            )
        )
      ],
    ),
  );


}

Row _buildJournalWeather() {
  return Row( crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[ Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[ Icon( Icons.wb_sunny, color: Colors.orange, ), ], ),
      SizedBox(width: 16.0,),
      Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[ Row( children: <Widget>[ Text( '81º Clear',
          style: TextStyle(color: Colors.deepOrange), ), ], ),
          Row( children: <Widget>[ Text( '4500 San Alpho Drive, Dallas, TX United States',
            style: TextStyle(color: Colors.grey), ), ], ), ], ), ], ); }

Wrap _buildJournalTags() {
  return Wrap(
    spacing: 8.0, children: List.generate(7, (int index)
  { return Chip( label: Text( 'Gift ${index + 1}',
    style: TextStyle(fontSize: 10.0), ),
    avatar: Icon( Icons.card_giftcard,
      color: Colors.blue.shade300, ),
    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4.0),
      side: BorderSide(color: Colors.grey), ),
    backgroundColor: Colors.grey.shade100, ); }), ); }



Row _buildJournalFooterImages() { return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    CircleAvatar(
      backgroundImage: AssetImage('assests/images/salmon.jpg'), radius: 40.0, ),
    CircleAvatar(
      backgroundImage: AssetImage('assests/images/asparagus.jpg'),
      radius: 40.0, ),
    CircleAvatar(
      backgroundImage: AssetImage('assests/images/strawberries.jpg'),
      radius: 40.0, ),
    SizedBox( width: 100.0, child: Column( crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[ Icon(Icons.cake), Icon(Icons.star_border),
        Icon(Icons.music_note), //Icon(Icons.movie),
      ], ), ), ], ); }


Column _buildJournalEntry() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget> [
      Text('My Birthday',style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold), ),
      Divider(),
      Text('It is going to be a great Brithday. We are going out fo'
          'r dinner at my favorite place, then watch a movie after'
          ' we go the gelateria for ice cream and espresso.',style: TextStyle(color: Colors.black54),),
    ],

  );

}

Image _buildJournalHeaderImage (){
  return Image(image: AssetImage('assests/images/present.jpg'), fit: BoxFit.cover,);
}