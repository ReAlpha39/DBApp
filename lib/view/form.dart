import 'dart:async';
import 'package:coffee_journey/models/data.dart';
import 'package:coffee_journey/models/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FormList extends StatefulWidget {

	final Data data;

	FormList(this.data);

	@override
  State<StatefulWidget> createState() {

    return FormListState(this.data);
  }
}

class FormListState extends State<FormList> {
  final _formKey = GlobalKey<FormState>();

	DatabaseHelper helper = DatabaseHelper();
	Data data;

  final TextEditingController judulC = TextEditingController();
  final TextEditingController journalC = TextEditingController();
  final TextEditingController ratingC = TextEditingController();
  final TextEditingController tanggalC = TextEditingController();

	FormListState(this.data);

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      //imageInput.img = image;
    });
  }
  String judul;
  String journal;
  String tanggal;
  int rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("Add Coffee Journal"),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 50),
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: "Judul"),
                        onSaved: (value) {
                          judul = value;
                        },
                        autocorrect: false,
                        validator: (i) {
                          if (i == '') {
                            return "Judul harus diisi!";
                          }
                        },
                        controller: judulC,
                      ),
                      TextFormField(
                        maxLines: 7,
                        minLines: 1,
                        decoration: InputDecoration(labelText: "Journal"),
                        onSaved: (value) {
                          journal = value;
                        },
                        controller: journalC,
                        autocorrect: false,
                        validator: (i) {
                          if (i == '') {
                            return "Journal harus diisi!";
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Rating"),
                        onSaved: (value) {
                          rating = int.parse(value);
                        },
                        autocorrect: false,
                        validator: (i) {
                          if (i == '') {
                            return "Rating harus diisi!";
                          }
                          if (int.tryParse(i) == null) {
                            return "Rating 1 - 5";
                          }
                          if (int.tryParse(i) > 5) {
                            return "Rating 1 - 5";
                          }
                          if (int.tryParse(i) < 1) {
                            return "Rating 1 - 5";
                          }
                        },
                        controller: ratingC,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: Image.asset('assets/coffeeHeader.jpg')//mageInput.img == null
                              //? Text('Tidak ada Gambar dipilih')
                              //: Image.file(imageInput.img),
                        ),
                      ),
                      RaisedButton(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: //Center(child: imageInput.img != null
                             Text('Change Image') //?
                            //: Text('Add Image')),
                          ),
                          onPressed: getImageFromGallery),
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                        child: Text('Reset'),
                        onPressed: () {
                          judulC.clear();
                          journalC.clear();
                          ratingC.clear();
                          setState(() {
                            //imageInput.img = null;
                            });
                        }),
                    RaisedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    RaisedButton(
                      child: Text("Save"),
                      onPressed: () {
                        var form = _formKey.currentState;
                        if (_formKey.currentState.validate()) {
                          form.save();
                          setState((){
                          _save();
                          });
                        }
                        //form.validate();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  void moveToLastScreen() {
		Navigator.pop(context, true);
  }
	// Save data to database
	void _save() async {

		moveToLastScreen();
    data.juduls = judul;
    data.journals = journal;
    data.ratings = rating;
		data.tanggals = DateFormat.yMMMd().format(DateTime.now());
		await helper.insertData(data);
  }

}










