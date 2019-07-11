import 'package:coffee_journey/models/data.dart';
import 'package:coffee_journey/repository/database_provider.dart';
import 'package:coffee_journey/view/form.dart';
//import 'package:coffee_journey/models/listData.dart';
import 'package:flutter/material.dart';

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
