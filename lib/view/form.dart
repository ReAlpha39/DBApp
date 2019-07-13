import 'dart:async';
import 'dart:convert';
import 'package:coffee_journey/models/data.dart';
import 'package:coffee_journey/repository/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FormList extends StatefulWidget {

	final Data dataUpdate;

	FormList(this.dataUpdate);

	@override
  _FormListState createState() => _FormListState();
}

class _FormListState extends State<FormList> {
  //final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	//DatabaseHelper helper = DatabaseHelper();
	//Data data;
  
  TextEditingController judulC = TextEditingController();
  TextEditingController journalC = TextEditingController();
  TextEditingController ratingC = TextEditingController();
  TextEditingController tanggalC = TextEditingController();

	//FormListState(this.data);
  String imgString;
  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    List<int> imgInt = await image.readAsBytes();
    imgString = base64Encode(imgInt);
    setState(() {
      
    });
  }
  String _judul;
  String _journal;
  //String _tanggal;
  int _rating;
  @override
  Widget build(BuildContext context) {
    var tes = widget.dataUpdate;
    print(tes);
    //if(widget.data.id != null){
    //  judulC.text = widget.data.judul;
    //  journalC.text = widget.data.jurnal;
    //  ratingC.text = widget.data.rating.toString();
    //}

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
                          //_judul = value;
                          updateInput();
                        },
                        autocorrect: false,
                        validator: (i) {
                          if (i == '') {
                            return "Judul harus diisi!";
                          }else{
                            return null;
                          }
                        },
                        controller: judulC,
                      ),
                      TextFormField(
                        maxLines: 7,
                        minLines: 1,
                        decoration: InputDecoration(labelText: "Journal"),
                        onSaved: (value) {
                          _journal = value;
                        },
                        controller: journalC,
                        autocorrect: false,
                        validator: (i) {
                          if (i == '') {
                            return "Journal harus diisi!";
                          }else{
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Rating"),
                        onSaved: (value) {
                          //_rating = int.parse(value);
                          updateRating();
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
                          }else{
                            return null;
                          }
                        },
                        controller: ratingC,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: imgString == null
                              ? Text('Tidak ada Gambar dipilih')
                              : Image.memory(base64Decode(imgString)),
                        ),
                      ),
                      RaisedButton(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Center(child: imgString != null
                              ? Text('Change Image')
                              : Text('Add Image')),
                          ),
                          onPressed: getImageFromGallery
                        ),
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
                          if (widget.dataUpdate.id != null){
                            judulC.text = widget.dataUpdate.judul;
                            journalC.text = widget.dataUpdate.jurnal;
                            ratingC.text = widget.dataUpdate.rating.toString();
                            imgString = widget.dataUpdate.image;
                          }else{
                            judulC.clear();
                            journalC.clear();
                            ratingC.clear();
                            imgString = null;
                          }
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

    void initState() {
    if(widget.dataUpdate.id != null){
      judulC.text = widget.dataUpdate.judul;
      journalC.text = widget.dataUpdate.jurnal;
      ratingC.text = widget.dataUpdate.rating.toString();
      imgString = widget.dataUpdate.image;
      super.initState();
    }
  }

  void updateInput(){
    _judul = judulC.text;
  }

  void updateRating(){
    _rating = int.parse(ratingC.text);
    print(_rating);
  }

  void moveToLastScreen() {
		Navigator.pop(context);
  }
	// Save data to database
	void _save() async {
    moveToLastScreen();
    String _tanggal = DateFormat.yMMMd().format(DateTime.now());
    Data data = Data(id: widget.dataUpdate.id, judul: _judul, jurnal: _journal, rating: _rating, tanggal: _tanggal, image: imgString);
    print('id sebelah = ' + widget.dataUpdate.id.toString());
    print('id sekarang = ' + data.id.toString());
    var hasil;
    if(widget.dataUpdate.id == null){
      hasil = await DatabaseProvider().insertData(data);
    }else{
      hasil = await DatabaseProvider().updateData(data);
    }
    
    //data.juduls = judul;
    //data.journals = journal;
    //data.ratings = rating;
		//data.tanggals = DateFormat.yMMMd().format(DateTime.now());
		//await helper.insertData(data);

  }

}










