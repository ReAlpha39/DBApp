import 'dart:async';
import 'package:coffee_journey/view/card.dart';
import 'package:coffee_journey/view/form.dart';
import 'package:coffee_journey/view/idCard.dart';
import 'package:coffee_journey/models/data.dart';
import 'package:coffee_journey/repository/database_provider.dart';
import 'package:coffee_journey/view/timeline.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


class Home extends StatefulWidget {

	@override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	//DatabaseHelper databaseHelper = DatabaseHelper();
	//List<Data> dataList;
	//int count = 0;

	@override
  Widget build(BuildContext context) {

		//if (dataList == null) {
		//	dataList = List<Data>();
		//	updateListView();
		//}

    return Scaffold(

	    appBar: AppBar(
		    actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Icon(Icons.settings, size: 35,),
          )
        ],
        backgroundColor: Colors.brown,
        leading: Icon(Icons.local_cafe, size: 35, color: Colors.black),
        title: Text('Coffee Journey', style: TextStyle(fontSize: 25),),
	    ),

	    body:  Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/coffeeHeader.jpg'),
                    ),
                  )
                ),
                
                Container(
                  alignment: Alignment(-1, 0),
                  padding: EdgeInsets.only(left: 10, top: 30),
                  child: IdCard(),
                )
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: FutureBuilder<List<Data>>(
                future: DatabaseProvider().getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) {
                    return Center(child: CircularProgressIndicator());
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return Stack(
                          children: <Widget>[
                            Line(), 
                            Timeline(), 
                            Card1(
                              judul: snapshot.data[i].judul,
                              journal: snapshot.data[i].jurnal,
                              rating: snapshot.data[i].rating,
                              tanggal: snapshot.data[i].tanggal,
                              img: //listInput[reverse(listInput.length, i)].img == null
                              Image.asset('assets/coffeeHeader.jpg', fit: BoxFit.cover,) //?
                              //: Image.file(listInput[reverse(listInput.length, i)].img, fit: BoxFit.cover),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
              )
            ),
            flex: 4,
          )
        ],
      ),

	    floatingActionButton: FloatingActionButton(
		    onPressed: () {
		      navigateToDetail();
		    },
        backgroundColor: Colors.brown,
		    child: Icon(Icons.add),

	    ),
    );
  }
  
  int reverse(int index, int rev){
    var balik = index - rev -1;
    return balik;
  }

  void navigateToDetail() async {
	  var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => FormList()));
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 15,
      child: Container(
        height: double.infinity,
        width: 2,
        color: Colors.brown[800],
      ),
    );
  }
}