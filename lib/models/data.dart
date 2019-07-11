// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    int id;
    String judul;
    String jurnal;
    int rating;
    String tanggal;
    String image;

    Data({
        this.id,
        this.judul,
        this.jurnal,
        this.rating,
        this.tanggal,
        this.image,
    });

    factory Data.fromJson(Map<String, dynamic> json) => new Data(
        id: json["id"] == null ? null : json["id"],
        judul: json["judul"] == null ? null : json["judul"],
        jurnal: json["jurnal"] == null ? null : json["jurnal"],
        rating: json["rating"] == null ? null : json["rating"],
        tanggal: json["tanggal"] == null ? null : json["tanggal"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "judul": judul == null ? null : judul,
        "jurnal": jurnal == null ? null : jurnal,
        "rating": rating == null ? null : rating,
        "tanggal": tanggal == null ? null : tanggal,
        "image": image == null ? null : image,
    };
}
