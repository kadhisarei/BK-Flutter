import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class History {
  late String nama_bk;
  late String nama_layanan;
  late String jam_mulai;
}

Future<List<History>> getHistory() async {
  List<History> histories = [];

  SharedPreferences sp = await SharedPreferences.getInstance();

  int? id = sp.getInt('user_id') ?? 1;

  print(id);

  String urlLocal = "http://awards-reflected.gl.at.ply.gg:7703/api/history/$id";

  var result = await http.get(Uri.parse(urlLocal));

  if (result.statusCode == 200) {
    var data = json.decode(result.body);

    print(data);

    for (var item in data) {
      History history = History();

      history.nama_bk = item['nama_bk'];
      history.nama_layanan = item['nama_layanan'];
      history.jam_mulai = item['jam_mulai'];

      histories.add(history);
    }
  }

  return histories;
}
