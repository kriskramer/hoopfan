import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Network {
  /*
   * Class is responsible for sending our get request to the NBA-API
   * each method of the class sends a get request for a particular data-endpoint for properties of the app
   * 1. get latest standings for bothe Eastern and Western Conference
   * 2. get scores of NBA games played
   * 3. get player statics such as ppg, apg, rpg, FG%, 
   */

  // make request to get Json file
  static Future<dynamic> getJson(String url) async {
    // make request to get Json file
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var json = convert.jsonDecode(response.body);
          return json;
        }
      }
    } catch (e) {
      //TODO: Handle this exception
      print(e);
    }
  }

  static Future<dynamic> getJsonWithBingHeader(String url) async {
    // make request to get Json file
    try {
      var response = await http.get(url, headers: {
        'Ocp-Apim-Subscription-Key': "235ced56b4ba4206a1e59e1785657176"
      });
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var json = convert.jsonDecode(response.body);
          return json;
        }
      }
    } catch (e) {
      //TODO: Handle this exception
      print(e);
    }
  }

  static Future<dynamic> getTwitterStream() async {
    String url = "https://api.twitter.com/2/tweets/search/stream?";
    // make request to get Json file
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            "Bearer AAAAAAAAAAAAAAAAAAAAAIr4KgEAAAAAAeA5QVwDwCoTwQTtUcLBEWkQkBU%3DuY8dkZF6DUxj63dxoszJwBlc4Awaud863H4xPeznECZvSoxTsm"
      });
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var json = convert.jsonDecode(response.body);
          //Network.twitterStream.add(json);
          return json;
        }
      } else {
        print(response.body);
      }
    } catch (e) {
      //TODO: Handle this exception
      print(e);
    }
  }

  static Future<void> launchSite(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
