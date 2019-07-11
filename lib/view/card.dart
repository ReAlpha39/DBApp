import 'package:coffee_journey/models/data.dart';
//import 'package:coffee_journey/models/listData.dart';
import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final String judul;
  final String journal;
  final int rating;
  final String tanggal;
  final Image img;

  const Card1({this.judul, this.journal, this.rating, this.tanggal, this.img});
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  child: Deskripsi(judul: judul, journal: journal, rating: rating, tanggal: tanggal,),
                  constraints: BoxConstraints(minHeight: 180),
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
                              child: img
                            ),
                          ),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: icon(rating)
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
    );
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

class IconRating1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.favorite, color: Colors.brown, size: 20),
      ],
    );
  }
}

class IconRating2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
      ],
    );
  }
}

class IconRating3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
      ],
    );
  }
}

class IconRating4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
      ],
    );
  }
}

class IconRating5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
        Icon(Icons.favorite, color: Colors.brown, size: 20),
      ],
    );
  }
}

class Deskripsi extends StatelessWidget {
  final String judul;
  final String journal;
  final int rating;
  final String tanggal;

  const Deskripsi({this.judul, this.journal, this.rating, this.tanggal});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.local_cafe,
                  size: 15,
                  color: Colors.brown[800],
                ),
              ),
              Text(
                judul,
                style: TextStyle(
                    color: Colors.brown[800],
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Container(
              height: 1,
              color: Colors.brown[800],
              width: double.infinity,
            )),
        Padding(
          padding: EdgeInsets.only(right: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.brown[800],
                  size: 12,
                ),
              ),
              Text(
                tanggal,
                style: TextStyle(color: Colors.brown[800], fontSize: 12),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 7, right: 5, bottom: 5),
          child: Container(
              width: double.infinity,
              child: Text(
                journal,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 11),
              )),
        )
      ],
    );
  }
}
