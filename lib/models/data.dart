
class DataInput{
  String judul;
  String journal;
  int rating;
  String tanggal;
  //File img;
}

class Data {

	int id;
	String judul;
	String journal;
	String tanggal;
	int rating;

	Data(this.judul, this.tanggal, this.rating, [this.journal]);

	Data.withId(this.id, this.judul, this.tanggal, this.rating, [this.journal]);

	int get ids => id;

	String get juduls => judul;

	String get journals => journal;

	int get ratings => rating;

	String get tanggals => tanggal;

	set juduls(String newTitle) {
		this.judul = newTitle;
	}

	set journals(String newDescription) {
		this.journal = newDescription;
	}

	set ratings(int newPriority) {
		this.rating = newPriority;
	}

	set tanggals(String newDate) {
		this.tanggal = newDate;
	}

	// Convert object menjadi Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (ids != null) {
			map['id'] = id;
		}
		map['judul'] = judul;
		map['journal'] = journal;
		map['rating'] = rating;
		map['tanggal'] = tanggal;

		return map;
	}

	// Extract object dari Map object
	Data.fromMapObject(Map<String, dynamic> map) {
		this.id = map['id'];
		this.judul = map['judul'];
		this.journal = map['journal'];
		this.rating = map['rating'];
		this.tanggal = map['tanggal'];
	}
}