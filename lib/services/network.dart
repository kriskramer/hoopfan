import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:xml2json/xml2json.dart';
import 'package:hoop/config.dart';

class Network {
  /*
   * Class is responsible for sending our get request to the NBA-API
   * each method of the class sends a get request for a particular data-endpoint for properties of the app
   * 1. get latest standings for bothe Eastern and Western Conference
   * 2. get scores of NBA games played
   * 3. get player statics such as ppg, apg, rpg, FG%, 
   */

  // make request to get Json file
  static Future<dynamic> getJson(String url,
      {Map<String, String> requestHeaders,
      FileType fileFormat = FileType.json}) async {
    // make request to get Json file
    // pass empty map for no request headers
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri, headers: requestHeaders);
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var data = fileFormat == FileType.json
              ? convert.jsonDecode(response.body)
              : response.body;
          // check if requested format is either json or xml to return appropriate formatting
          return data;
        }
      }
    } catch (e) {
      //TODO: Handle this exception
      print(e);
    }
  }

  static Future<dynamic> getJsonFromXml(String url) async {
    // make request to get Json file
    final x2j = Xml2Json();
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var xml = response.body;
          x2j.parse(xml);
          var json = x2j.toBadgerfish();
          return json;
        }
      }
    } catch (e) {
      //TODO: Handle this exception
      print(e);
    }
  }

  static Future<void> launchSite(String url) async {
    print(url);
    //if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}
