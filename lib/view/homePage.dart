import 'dart:convert';
import 'package:coffee_journey/view/card.dart';
import 'package:coffee_journey/view/form.dart';
import 'package:coffee_journey/view/idCard.dart';
import 'package:coffee_journey/models/data.dart';
import 'package:coffee_journey/repository/database_provider.dart';
import 'package:coffee_journey/view/timeline.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

	@override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	@override
  Widget build(BuildContext context) {
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
                    if (snapshot.data.length == 0){
                      return Center(child: Text('Belum ada data'),);
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return Stack(
                            children: <Widget>[
                              Line(), 
                              Timeline(), 
                              Padding(
                                padding: const EdgeInsets.only(left: 50, top: 15),
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.brown[100],
                                        spreadRadius: -3,
                                        offset: Offset(-3, 3),
                                        blurRadius: 5)
                                  ]),
                                  child: Card(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: Deskripsi(judul: snapshot.data[i].judul, journal: snapshot.data[i].jurnal, rating: snapshot.data[i].rating, tanggal: snapshot.data[i].tanggal,),
                                            constraints: BoxConstraints(minHeight: 200),
                                          ),
                                          flex: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                right: 7, left: 5, top: 7, bottom: 7),
                                            height: MediaQuery.of(context).size.height / 4,
                                            child: Column(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.brown,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(7),
                                                      child: Container(
                                                        constraints: BoxConstraints(maxHeight: 50, minHeight: 50),
                                                        child: snapshot.data[i].image == null
                                                          ? Image.asset('assets/noimage.png', fit: BoxFit.cover,)
                                                          : Image.memory(base64Decode(snapshot.data[i].image))
                                                      ),
                                                    ),
                                                  ),
                                                  flex: 3,
                                                ),
                                                Expanded(
                                                  child: icon(snapshot.data[i].rating)
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: <Widget>[
                                                      IconButton(
                                                        icon: Icon(Icons.edit),
                                                        onPressed: () async {
                                                          var tes = snapshot.data[i];
                                                          print(tes);
                                                          await Navigator.push(context, MaterialPageRoute(builder: (context) => FormList(snapshot.data[i], 'Edit Journal')));
                                                          setState(() {
                                                            
                                                          });
                                                        },
                                                      ),
                                                      IconButton(
                                                        icon: Icon(Icons.delete),
                                                        onPressed: () async {
                                                          await DatabaseProvider().deleteData(snapshot.data[i].id);
                                                          setState(() {
                                                            
                                                          });
                                                        }
                                                        
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          flex: 3,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }
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

  void navigateToDetail() async {
	  await Navigator.push(context, MaterialPageRoute(builder: (context) => FormList(Data(), 'Add Journal')));
  }

    Widget icon(int index){
    Widget iconRating;
    if(index == 1){
      iconRating = IconRating1();
    }else if (index == 2){
     iconRating = IconRating2();
    }else if(index == 3){
      iconRating = IconRating3();
    }else if(index == 4){
      iconRating = IconRating4();
    }else if (index == 5){
      iconRating = IconRating5();
    }
    return iconRating;
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