import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:xml2json/xml2json.dart';

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

  static Future<dynamic> getJsonFromXml(String url) async {
    // make request to get Json file
    final x2j = Xml2Json();
    try {
      var response = await http.get(url);
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

  static Future<dynamic> getXml(String url) async {
    // make request to get Json file
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var xml = response.body;
          return xml;
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

  static Future<dynamic> getJsonFromNbaStats(String url) async {
    // Use this request for calls to stats.nba.com urls
    try {
      var response = await http.get(url, headers: {
        'Host': 'stats.nba.com',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'en-US,en;q=0.5',
        'Accept-Encoding': 'gzip, deflate, br',
        'x-nba-stats-origin': 'stats',
        'x-nba-stats-token': 'true',
        'Connection': 'keep-alive',
        'Referer': 'https://stats.nba.com/',
        'Pragma': 'no-cache',
        'Cache-Control': 'no-cache',
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
}
