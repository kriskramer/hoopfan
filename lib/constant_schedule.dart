class ScheduleHelper {
  static List<dynamic> getFullSchedule(String teamId) {
    //var sched = current_season_schedule["league"]["standard"];

    // for (var g in sched) {
    //   //print(g);
    // }

    return null;
  }

  static List<dynamic> getUpcomingSchedule() {
    DateTime today = new DateTime.now();
    String year = today.year.toString();
    String month = today.month.toString();
    String day = today.day.toString();
    String todayString = "${year + month + day}";

    var sched = current_season_schedule["league"]["standard"];
    List<dynamic> upcomingGames = new List<dynamic>();

    for (var g in sched) {
      print(g);
      if (int.parse(todayString) < int.parse(g["startDateEastern"])) {
        upcomingGames.add(g);
      }
    }

    return upcomingGames;
  }
}

// 2020 schedule - all teams
// from http://data.nba.net/prod/v2/2020/schedule.json
dynamic current_season_schedule = {
  "_internal": {
    "pubDateTime": "2020-12-04 16:36:02.087 EST",
    "igorPath":
        "domUpdater,1607117677547,1607117689768|feedProducer,1607117761125,1607117766905",
    "xslt": "NBA/xsl/league/schedule/marty_schedule.xsl",
    "xsltForceRecompile": "true",
    "xsltInCache": "false",
    "xsltCompileTimeMillis": "375",
    "xsltTransformTimeMillis": "2188",
    "consolidatedDomKey":
        "prod__transform__marty_schedule_season__2056669060424",
    "endToEndTimeMillis": "89358"
  },
  "league": {
    "standard": [
      {
        "gameId": "0012000001",
        "seasonStageId": 1,
        "gameUrlCode": "20201211/ORLATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-12T00:00:00.000Z",
        "startDateEastern": "20201211",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "atlr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000002",
        "seasonStageId": 1,
        "gameUrlCode": "20201211/NYKDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-12T00:00:00.000Z",
        "startDateEastern": "20201211",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "detr_nykr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000003",
        "seasonStageId": 1,
        "gameUrlCode": "20201211/HOUCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-12T01:00:00.000Z",
        "startDateEastern": "20201211",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "chir",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000004",
        "seasonStageId": 1,
        "gameUrlCode": "20201211/LACLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-12T03:00:00.000Z",
        "startDateEastern": "20201211",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "lalr_lacr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000005",
        "seasonStageId": 1,
        "gameUrlCode": "20201211/SACPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-12T03:30:00.000Z",
        "startDateEastern": "20201211",
        "isNeutralVenue": false,
        "startTimeEastern": "10:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "porr",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000006",
        "seasonStageId": 1,
        "gameUrlCode": "20201212/TORCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-13T00:00:00.000Z",
        "startDateEastern": "20201212",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "char_torr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [
                {"shortName": "SN", "longName": "Sportsnet"}
              ],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000007",
        "seasonStageId": 1,
        "gameUrlCode": "20201212/INDCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-13T00:00:00.000Z",
        "startDateEastern": "20201212",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "cler_indr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000008",
        "seasonStageId": 1,
        "gameUrlCode": "20201212/OKCSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-13T00:00:00.000Z",
        "startDateEastern": "20201212",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000009",
        "seasonStageId": 1,
        "gameUrlCode": "20201212/DALMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-13T01:00:00.000Z",
        "startDateEastern": "20201212",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000010",
        "seasonStageId": 1,
        "gameUrlCode": "20201212/MEMMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-13T01:00:00.000Z",
        "startDateEastern": "20201212",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000011",
        "seasonStageId": 1,
        "gameUrlCode": "20201212/DENGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-13T01:30:00.000Z",
        "startDateEastern": "20201212",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "denr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000012",
        "seasonStageId": 1,
        "gameUrlCode": "20201212/PHXUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-13T02:00:00.000Z",
        "startDateEastern": "20201212",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000013",
        "seasonStageId": 1,
        "gameUrlCode": "20201213/ORLATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-13T22:00:00.000Z",
        "startDateEastern": "20201213",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "atlr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000014",
        "seasonStageId": 1,
        "gameUrlCode": "20201213/WASBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-13T23:00:00.000Z",
        "startDateEastern": "20201213",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "bknr_wasr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000015",
        "seasonStageId": 1,
        "gameUrlCode": "20201213/NYKDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-14T00:00:00.000Z",
        "startDateEastern": "20201213",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "detr_nykr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000016",
        "seasonStageId": 1,
        "gameUrlCode": "20201213/HOUCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-14T01:00:00.000Z",
        "startDateEastern": "20201213",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "chir",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000018",
        "seasonStageId": 1,
        "gameUrlCode": "20201213/LACLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-14T01:30:00.000Z",
        "startDateEastern": "20201213",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "lalr_lacr",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000017",
        "seasonStageId": 1,
        "gameUrlCode": "20201213/SACPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-14T02:00:00.000Z",
        "startDateEastern": "20201213",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "porr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000019",
        "seasonStageId": 1,
        "gameUrlCode": "20201214/INDCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-14T23:00:00.000Z",
        "startDateEastern": "20201214",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "cler",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000020",
        "seasonStageId": 1,
        "gameUrlCode": "20201214/TORCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-15T00:00:00.000Z",
        "startDateEastern": "20201214",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "char_torr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [
                {"shortName": "SN", "longName": "Sportsnet"}
              ],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000021",
        "seasonStageId": 1,
        "gameUrlCode": "20201214/NOPMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-15T00:00:00.000Z",
        "startDateEastern": "20201214",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "miar_nopr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000022",
        "seasonStageId": 1,
        "gameUrlCode": "20201214/DALMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-15T01:00:00.000Z",
        "startDateEastern": "20201214",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000023",
        "seasonStageId": 1,
        "gameUrlCode": "20201214/MEMMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-15T01:00:00.000Z",
        "startDateEastern": "20201214",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000024",
        "seasonStageId": 1,
        "gameUrlCode": "20201214/PHXUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-15T02:00:00.000Z",
        "startDateEastern": "20201214",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000025",
        "seasonStageId": 1,
        "gameUrlCode": "20201215/BOSPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-16T00:30:00.000Z",
        "startDateEastern": "20201215",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000026",
        "seasonStageId": 1,
        "gameUrlCode": "20201215/SASHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-16T01:00:00.000Z",
        "startDateEastern": "20201215",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000027",
        "seasonStageId": 1,
        "gameUrlCode": "20201215/GSWSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-16T03:00:00.000Z",
        "startDateEastern": "20201215",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000028",
        "seasonStageId": 1,
        "gameUrlCode": "20201216/CLENYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-17T00:30:00.000Z",
        "startDateEastern": "20201216",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "nykr_cler",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000029",
        "seasonStageId": 1,
        "gameUrlCode": "20201216/CHIOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-17T01:00:00.000Z",
        "startDateEastern": "20201216",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "okcr_chir",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000030",
        "seasonStageId": 1,
        "gameUrlCode": "20201216/PORDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-17T02:00:00.000Z",
        "startDateEastern": "20201216",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "denr_porr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000031",
        "seasonStageId": 1,
        "gameUrlCode": "20201216/LALPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-17T02:00:00.000Z",
        "startDateEastern": "20201216",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "lalr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000032",
        "seasonStageId": 1,
        "gameUrlCode": "20201217/CHAORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-18T00:00:00.000Z",
        "startDateEastern": "20201217",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "orlr_char",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000033",
        "seasonStageId": 1,
        "gameUrlCode": "20201217/DETWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-18T00:00:00.000Z",
        "startDateEastern": "20201217",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "wasr_detr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000034",
        "seasonStageId": 1,
        "gameUrlCode": "20201217/SASHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-18T01:00:00.000Z",
        "startDateEastern": "20201217",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000035",
        "seasonStageId": 1,
        "gameUrlCode": "20201217/ATLMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-18T01:00:00.000Z",
        "startDateEastern": "20201217",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "atlr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000036",
        "seasonStageId": 1,
        "gameUrlCode": "20201217/MINDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-18T01:30:00.000Z",
        "startDateEastern": "20201217",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000038",
        "seasonStageId": 1,
        "gameUrlCode": "20201217/GSWSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-18T02:00:00.000Z",
        "startDateEastern": "20201217",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000037",
        "seasonStageId": 1,
        "gameUrlCode": "20201217/UTALAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-18T03:00:00.000Z",
        "startDateEastern": "20201217",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "lacr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000039",
        "seasonStageId": 1,
        "gameUrlCode": "20201218/PHIIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-18T23:00:00.000Z",
        "startDateEastern": "20201218",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "indr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000040",
        "seasonStageId": 1,
        "gameUrlCode": "20201218/MIATOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-19T00:00:00.000Z",
        "startDateEastern": "20201218",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "torr_miar",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [
                {"shortName": "TSN", "longName": "TSN"}
              ],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000042",
        "seasonStageId": 1,
        "gameUrlCode": "20201218/CLENYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-19T00:30:00.000Z",
        "startDateEastern": "20201218",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "nykr_cler",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000041",
        "seasonStageId": 1,
        "gameUrlCode": "20201218/BKNBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-19T01:00:00.000Z",
        "startDateEastern": "20201218",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "bknr",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN2", "longName": "ESPN2"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000043",
        "seasonStageId": 1,
        "gameUrlCode": "20201218/MILNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-19T01:00:00.000Z",
        "startDateEastern": "20201218",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "nopr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000044",
        "seasonStageId": 1,
        "gameUrlCode": "20201218/CHIOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-19T01:00:00.000Z",
        "startDateEastern": "20201218",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "okcr_chir",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000045",
        "seasonStageId": 1,
        "gameUrlCode": "20201218/PORDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-19T02:00:00.000Z",
        "startDateEastern": "20201218",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "denr_porr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000046",
        "seasonStageId": 1,
        "gameUrlCode": "20201218/LALPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-19T03:30:00.000Z",
        "startDateEastern": "20201218",
        "isNeutralVenue": false,
        "startTimeEastern": "10:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "lalr",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000047",
        "seasonStageId": 1,
        "gameUrlCode": "20201219/CHAORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-20T00:00:00.000Z",
        "startDateEastern": "20201219",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "orlr_char",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000048",
        "seasonStageId": 1,
        "gameUrlCode": "20201219/DETWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-20T00:00:00.000Z",
        "startDateEastern": "20201219",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "wasr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0012000049",
        "seasonStageId": 1,
        "gameUrlCode": "20201219/ATLMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-20T01:00:00.000Z",
        "startDateEastern": "20201219",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "atlr",
              "isLeaguePass": true,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000001",
        "seasonStageId": 2,
        "gameUrlCode": "20201222/GSWBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-23T00:00:00.000Z",
        "startDateEastern": "20201222",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000002",
        "seasonStageId": 2,
        "gameUrlCode": "20201222/LACLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-23T03:00:00.000Z",
        "startDateEastern": "20201222",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000010",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/CHACLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T00:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000011",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/NYKIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T00:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000012",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/MIAORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T00:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000013",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/WASPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T00:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000003",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/MILBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T00:30:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000014",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/NOPTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T00:30:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000015",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/ATLCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T01:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000016",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/OKCHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T01:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000017",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/SASMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T01:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000018",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/DETMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T01:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000019",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/SACDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T02:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000020",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/UTAPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T03:00:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000004",
        "seasonStageId": 2,
        "gameUrlCode": "20201223/DALPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-24T03:30:00.000Z",
        "startDateEastern": "20201223",
        "isNeutralVenue": false,
        "startTimeEastern": "10:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000005",
        "seasonStageId": 2,
        "gameUrlCode": "20201225/NOPMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-25T17:00:00.000Z",
        "startDateEastern": "20201225",
        "isNeutralVenue": false,
        "startTimeEastern": "12:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000006",
        "seasonStageId": 2,
        "gameUrlCode": "20201225/GSWMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-25T19:30:00.000Z",
        "startDateEastern": "20201225",
        "isNeutralVenue": false,
        "startTimeEastern": "2:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000007",
        "seasonStageId": 2,
        "gameUrlCode": "20201225/BKNBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-25T22:00:00.000Z",
        "startDateEastern": "20201225",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000008",
        "seasonStageId": 2,
        "gameUrlCode": "20201225/DALLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-26T01:00:00.000Z",
        "startDateEastern": "20201225",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000009",
        "seasonStageId": 2,
        "gameUrlCode": "20201225/LACDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-26T03:30:00.000Z",
        "startDateEastern": "20201225",
        "isNeutralVenue": false,
        "startTimeEastern": "10:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000021",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/ATLMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-26T22:00:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000022",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/OKCCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T00:00:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000023",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/CLEDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T00:00:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000024",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/ORLWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T00:00:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000025",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/PHINYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T00:30:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000026",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/INDCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T01:00:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000027",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/TORSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T01:30:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000028",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/MINUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T02:00:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000029",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/HOUPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T03:00:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000030",
        "seasonStageId": 2,
        "gameUrlCode": "20201226/PHXSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T03:00:00.000Z",
        "startDateEastern": "20201226",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000031",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/DALLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-27T20:30:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "3:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000032",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/BKNCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-28T00:00:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000033",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/ORLWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-28T00:00:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000034",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/SASNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-28T00:00:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000035",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/PHICLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-28T00:30:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000036",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/MILNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-28T00:30:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000037",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/BOSIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-28T01:00:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000038",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/GSWCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-28T01:00:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000039",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/PHXSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-28T02:00:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000040",
        "seasonStageId": 2,
        "gameUrlCode": "20201227/MINLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-28T03:00:00.000Z",
        "startDateEastern": "20201227",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000041",
        "seasonStageId": 2,
        "gameUrlCode": "20201228/DETATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-29T00:30:00.000Z",
        "startDateEastern": "20201228",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000042",
        "seasonStageId": 2,
        "gameUrlCode": "20201228/MEMBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-29T00:30:00.000Z",
        "startDateEastern": "20201228",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000043",
        "seasonStageId": 2,
        "gameUrlCode": "20201228/UTAOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-29T01:00:00.000Z",
        "startDateEastern": "20201228",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000044",
        "seasonStageId": 2,
        "gameUrlCode": "20201228/HOUDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-29T02:00:00.000Z",
        "startDateEastern": "20201228",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000045",
        "seasonStageId": 2,
        "gameUrlCode": "20201228/PORLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-29T03:00:00.000Z",
        "startDateEastern": "20201228",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000046",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/NYKCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T00:00:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000047",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/GSWDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T00:00:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000048",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/BOSIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T00:00:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000049",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/TORPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T00:00:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000050",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/CHIWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T00:00:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000051",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/MILMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T00:30:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000052",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/ORLOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T01:00:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000053",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/NOPPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T03:00:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000054",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/MINLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T03:00:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000055",
        "seasonStageId": 2,
        "gameUrlCode": "20201229/DENSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-30T03:00:00.000Z",
        "startDateEastern": "20201229",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000056",
        "seasonStageId": 2,
        "gameUrlCode": "20201230/MEMBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-31T00:30:00.000Z",
        "startDateEastern": "20201230",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000057",
        "seasonStageId": 2,
        "gameUrlCode": "20201230/ATLBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-31T00:30:00.000Z",
        "startDateEastern": "20201230",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000058",
        "seasonStageId": 2,
        "gameUrlCode": "20201230/MILMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-31T00:30:00.000Z",
        "startDateEastern": "20201230",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000059",
        "seasonStageId": 2,
        "gameUrlCode": "20201230/CHADAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-31T01:30:00.000Z",
        "startDateEastern": "20201230",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000060",
        "seasonStageId": 2,
        "gameUrlCode": "20201230/LALSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-31T01:30:00.000Z",
        "startDateEastern": "20201230",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000061",
        "seasonStageId": 2,
        "gameUrlCode": "20201230/PORLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-31T03:00:00.000Z",
        "startDateEastern": "20201230",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000062",
        "seasonStageId": 2,
        "gameUrlCode": "20201231/CLEIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-31T20:00:00.000Z",
        "startDateEastern": "20201231",
        "isNeutralVenue": false,
        "startTimeEastern": "3:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000063",
        "seasonStageId": 2,
        "gameUrlCode": "20201231/CHIWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-31T22:00:00.000Z",
        "startDateEastern": "20201231",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000064",
        "seasonStageId": 2,
        "gameUrlCode": "20201231/PHIORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2020-12-31T23:30:00.000Z",
        "startDateEastern": "20201231",
        "isNeutralVenue": false,
        "startTimeEastern": "6:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000065",
        "seasonStageId": 2,
        "gameUrlCode": "20201231/SACHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-01T00:00:00.000Z",
        "startDateEastern": "20201231",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000066",
        "seasonStageId": 2,
        "gameUrlCode": "20201231/NYKTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-01T00:30:00.000Z",
        "startDateEastern": "20201231",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000067",
        "seasonStageId": 2,
        "gameUrlCode": "20201231/NOPOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-01T01:00:00.000Z",
        "startDateEastern": "20201231",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000068",
        "seasonStageId": 2,
        "gameUrlCode": "20201231/PHXUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-01T02:00:00.000Z",
        "startDateEastern": "20201231",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000069",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/MEMCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T00:00:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000070",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/BOSDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T00:00:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000071",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/MIADAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T00:00:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000072",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/ATLBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T00:30:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000073",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/CHIMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T01:00:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000074",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/WASMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T01:00:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000075",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/LALSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T01:00:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000076",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/PHXDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T02:00:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000077",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/LACUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T02:00:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000078",
        "seasonStageId": 2,
        "gameUrlCode": "20210101/PORGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T03:30:00.000Z",
        "startDateEastern": "20210101",
        "isNeutralVenue": false,
        "startTimeEastern": "10:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000079",
        "seasonStageId": 2,
        "gameUrlCode": "20210102/SACHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-02T22:00:00.000Z",
        "startDateEastern": "20210102",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000080",
        "seasonStageId": 2,
        "gameUrlCode": "20210102/NYKIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-03T00:00:00.000Z",
        "startDateEastern": "20210102",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000081",
        "seasonStageId": 2,
        "gameUrlCode": "20210102/OKCORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-03T00:00:00.000Z",
        "startDateEastern": "20210102",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000082",
        "seasonStageId": 2,
        "gameUrlCode": "20210102/CHAPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-03T00:00:00.000Z",
        "startDateEastern": "20210102",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000083",
        "seasonStageId": 2,
        "gameUrlCode": "20210102/CLEATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-03T00:30:00.000Z",
        "startDateEastern": "20210102",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000084",
        "seasonStageId": 2,
        "gameUrlCode": "20210102/TORNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-03T00:30:00.000Z",
        "startDateEastern": "20210102",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000085",
        "seasonStageId": 2,
        "gameUrlCode": "20210103/BOSDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-03T20:00:00.000Z",
        "startDateEastern": "20210103",
        "isNeutralVenue": false,
        "startTimeEastern": "3:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000086",
        "seasonStageId": 2,
        "gameUrlCode": "20210103/WASBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-03T23:00:00.000Z",
        "startDateEastern": "20210103",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000087",
        "seasonStageId": 2,
        "gameUrlCode": "20210103/LALMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-03T23:00:00.000Z",
        "startDateEastern": "20210103",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000088",
        "seasonStageId": 2,
        "gameUrlCode": "20210103/DENMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-04T00:00:00.000Z",
        "startDateEastern": "20210103",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000089",
        "seasonStageId": 2,
        "gameUrlCode": "20210103/UTASAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-04T00:00:00.000Z",
        "startDateEastern": "20210103",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000090",
        "seasonStageId": 2,
        "gameUrlCode": "20210103/DALCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-04T01:00:00.000Z",
        "startDateEastern": "20210103",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000091",
        "seasonStageId": 2,
        "gameUrlCode": "20210103/LACPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-04T01:00:00.000Z",
        "startDateEastern": "20210103",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000092",
        "seasonStageId": 2,
        "gameUrlCode": "20210103/PORGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-04T01:30:00.000Z",
        "startDateEastern": "20210103",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000093",
        "seasonStageId": 2,
        "gameUrlCode": "20210104/CLEORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-05T00:00:00.000Z",
        "startDateEastern": "20210104",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000094",
        "seasonStageId": 2,
        "gameUrlCode": "20210104/CHAPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-05T00:00:00.000Z",
        "startDateEastern": "20210104",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000095",
        "seasonStageId": 2,
        "gameUrlCode": "20210104/NYKATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-05T00:30:00.000Z",
        "startDateEastern": "20210104",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000096",
        "seasonStageId": 2,
        "gameUrlCode": "20210104/OKCMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-05T00:30:00.000Z",
        "startDateEastern": "20210104",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000097",
        "seasonStageId": 2,
        "gameUrlCode": "20210104/BOSTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-05T00:30:00.000Z",
        "startDateEastern": "20210104",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000098",
        "seasonStageId": 2,
        "gameUrlCode": "20210104/DALHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-05T01:00:00.000Z",
        "startDateEastern": "20210104",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000099",
        "seasonStageId": 2,
        "gameUrlCode": "20210104/DETMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-05T01:00:00.000Z",
        "startDateEastern": "20210104",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000100",
        "seasonStageId": 2,
        "gameUrlCode": "20210104/INDNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-05T01:00:00.000Z",
        "startDateEastern": "20210104",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000101",
        "seasonStageId": 2,
        "gameUrlCode": "20210104/SACGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-05T03:00:00.000Z",
        "startDateEastern": "20210104",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000102",
        "seasonStageId": 2,
        "gameUrlCode": "20210105/UTABKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-06T00:30:00.000Z",
        "startDateEastern": "20210105",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000103",
        "seasonStageId": 2,
        "gameUrlCode": "20210105/LALMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-06T01:00:00.000Z",
        "startDateEastern": "20210105",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000104",
        "seasonStageId": 2,
        "gameUrlCode": "20210105/MINDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-06T02:00:00.000Z",
        "startDateEastern": "20210105",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000105",
        "seasonStageId": 2,
        "gameUrlCode": "20210105/SASLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-06T03:00:00.000Z",
        "startDateEastern": "20210105",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000106",
        "seasonStageId": 2,
        "gameUrlCode": "20210105/CHIPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-06T03:30:00.000Z",
        "startDateEastern": "20210105",
        "isNeutralVenue": false,
        "startTimeEastern": "10:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000107",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/HOUIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T00:00:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000108",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/CLEORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T00:00:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000109",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/WASPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T00:00:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000110",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/CHAATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T00:30:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000111",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/BOSMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T00:30:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000112",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/UTANYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T00:30:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000113",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/DETMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T01:00:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000114",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/OKCNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T01:00:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000115",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/TORPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T02:00:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000116",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/LACGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T03:00:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000117",
        "seasonStageId": 2,
        "gameUrlCode": "20210106/CHISAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-07T03:00:00.000Z",
        "startDateEastern": "20210106",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000118",
        "seasonStageId": 2,
        "gameUrlCode": "20210107/PHIBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-08T00:30:00.000Z",
        "startDateEastern": "20210107",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000119",
        "seasonStageId": 2,
        "gameUrlCode": "20210107/CLEMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-08T01:00:00.000Z",
        "startDateEastern": "20210107",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000120",
        "seasonStageId": 2,
        "gameUrlCode": "20210107/DALDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-08T03:00:00.000Z",
        "startDateEastern": "20210107",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000121",
        "seasonStageId": 2,
        "gameUrlCode": "20210107/SASLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-08T03:00:00.000Z",
        "startDateEastern": "20210107",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000122",
        "seasonStageId": 2,
        "gameUrlCode": "20210107/MINPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-08T03:00:00.000Z",
        "startDateEastern": "20210107",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000123",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/PHXDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T00:00:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000124",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/WASBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T00:30:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000125",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/OKCNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T00:30:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000126",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/CHANOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T00:30:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000127",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/ORLHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T01:00:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000128",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/BKNMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T01:00:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000129",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/UTAMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T01:00:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000130",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/LACGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T03:00:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000131",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/CHILAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T03:00:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000132",
        "seasonStageId": 2,
        "gameUrlCode": "20210108/TORSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T03:00:00.000Z",
        "startDateEastern": "20210108",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000133",
        "seasonStageId": 2,
        "gameUrlCode": "20210109/DENPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-09T20:00:00.000Z",
        "startDateEastern": "20210109",
        "isNeutralVenue": false,
        "startTimeEastern": "3:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000134",
        "seasonStageId": 2,
        "gameUrlCode": "20210109/ATLCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T00:00:00.000Z",
        "startDateEastern": "20210109",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000135",
        "seasonStageId": 2,
        "gameUrlCode": "20210109/PHXIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T00:00:00.000Z",
        "startDateEastern": "20210109",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000136",
        "seasonStageId": 2,
        "gameUrlCode": "20210109/MIAWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T00:00:00.000Z",
        "startDateEastern": "20210109",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000137",
        "seasonStageId": 2,
        "gameUrlCode": "20210109/CLEMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T01:00:00.000Z",
        "startDateEastern": "20210109",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000138",
        "seasonStageId": 2,
        "gameUrlCode": "20210109/SASMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T01:00:00.000Z",
        "startDateEastern": "20210109",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000139",
        "seasonStageId": 2,
        "gameUrlCode": "20210109/ORLDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T01:30:00.000Z",
        "startDateEastern": "20210109",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000140",
        "seasonStageId": 2,
        "gameUrlCode": "20210109/PORSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T03:00:00.000Z",
        "startDateEastern": "20210109",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000141",
        "seasonStageId": 2,
        "gameUrlCode": "20210110/UTADET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T20:00:00.000Z",
        "startDateEastern": "20210110",
        "isNeutralVenue": false,
        "startTimeEastern": "3:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000142",
        "seasonStageId": 2,
        "gameUrlCode": "20210110/CHILAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T21:00:00.000Z",
        "startDateEastern": "20210110",
        "isNeutralVenue": false,
        "startTimeEastern": "4:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000143",
        "seasonStageId": 2,
        "gameUrlCode": "20210110/OKCBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T23:00:00.000Z",
        "startDateEastern": "20210110",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000144",
        "seasonStageId": 2,
        "gameUrlCode": "20210110/DENNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-10T23:00:00.000Z",
        "startDateEastern": "20210110",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000145",
        "seasonStageId": 2,
        "gameUrlCode": "20210110/MIABOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-11T00:00:00.000Z",
        "startDateEastern": "20210110",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000146",
        "seasonStageId": 2,
        "gameUrlCode": "20210110/LALHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-11T00:00:00.000Z",
        "startDateEastern": "20210110",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000147",
        "seasonStageId": 2,
        "gameUrlCode": "20210110/SASMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-11T01:00:00.000Z",
        "startDateEastern": "20210110",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000148",
        "seasonStageId": 2,
        "gameUrlCode": "20210110/TORGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-11T01:30:00.000Z",
        "startDateEastern": "20210110",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000149",
        "seasonStageId": 2,
        "gameUrlCode": "20210111/NYKCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-12T00:00:00.000Z",
        "startDateEastern": "20210111",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000150",
        "seasonStageId": 2,
        "gameUrlCode": "20210111/MEMCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-12T00:00:00.000Z",
        "startDateEastern": "20210111",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000151",
        "seasonStageId": 2,
        "gameUrlCode": "20210111/MILORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-12T00:00:00.000Z",
        "startDateEastern": "20210111",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000152",
        "seasonStageId": 2,
        "gameUrlCode": "20210111/PHXWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-12T00:00:00.000Z",
        "startDateEastern": "20210111",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000153",
        "seasonStageId": 2,
        "gameUrlCode": "20210111/PHIATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-12T00:30:00.000Z",
        "startDateEastern": "20210111",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000154",
        "seasonStageId": 2,
        "gameUrlCode": "20210111/NOPDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-12T01:30:00.000Z",
        "startDateEastern": "20210111",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000155",
        "seasonStageId": 2,
        "gameUrlCode": "20210111/TORPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-12T03:00:00.000Z",
        "startDateEastern": "20210111",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000156",
        "seasonStageId": 2,
        "gameUrlCode": "20210111/INDSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-12T03:00:00.000Z",
        "startDateEastern": "20210111",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000157",
        "seasonStageId": 2,
        "gameUrlCode": "20210112/MIAPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-13T00:00:00.000Z",
        "startDateEastern": "20210112",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000158",
        "seasonStageId": 2,
        "gameUrlCode": "20210112/DENBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-13T00:30:00.000Z",
        "startDateEastern": "20210112",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000159",
        "seasonStageId": 2,
        "gameUrlCode": "20210112/UTACLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-13T00:30:00.000Z",
        "startDateEastern": "20210112",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000160",
        "seasonStageId": 2,
        "gameUrlCode": "20210112/BOSCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-13T01:00:00.000Z",
        "startDateEastern": "20210112",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000161",
        "seasonStageId": 2,
        "gameUrlCode": "20210112/LALHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-13T01:00:00.000Z",
        "startDateEastern": "20210112",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000162",
        "seasonStageId": 2,
        "gameUrlCode": "20210112/SASOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-13T01:00:00.000Z",
        "startDateEastern": "20210112",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000163",
        "seasonStageId": 2,
        "gameUrlCode": "20210112/INDGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-13T03:30:00.000Z",
        "startDateEastern": "20210112",
        "isNeutralVenue": false,
        "startTimeEastern": "10:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000164",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/DALCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T00:00:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000165",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/MILDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T00:00:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000166",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/UTAWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T00:00:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000167",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/ORLBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T00:30:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000168",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/BKNNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T00:30:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000169",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/MEMMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T01:00:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000170",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/LALOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T01:00:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000171",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/ATLPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T02:00:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000172",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/NOPLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T03:00:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000173",
        "seasonStageId": 2,
        "gameUrlCode": "20210113/PORSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-14T03:00:00.000Z",
        "startDateEastern": "20210113",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000174",
        "seasonStageId": 2,
        "gameUrlCode": "20210114/MIAPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-15T00:30:00.000Z",
        "startDateEastern": "20210114",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000175",
        "seasonStageId": 2,
        "gameUrlCode": "20210114/CHATOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-15T00:30:00.000Z",
        "startDateEastern": "20210114",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000176",
        "seasonStageId": 2,
        "gameUrlCode": "20210114/HOUSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-15T01:30:00.000Z",
        "startDateEastern": "20210114",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000177",
        "seasonStageId": 2,
        "gameUrlCode": "20210114/GSWDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-15T03:00:00.000Z",
        "startDateEastern": "20210114",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000178",
        "seasonStageId": 2,
        "gameUrlCode": "20210114/INDPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-15T03:00:00.000Z",
        "startDateEastern": "20210114",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000179",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/WASDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T00:00:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000180",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/ORLBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T00:30:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000181",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/NYKCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T00:30:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000182",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/DALMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T00:30:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000183",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/MEMMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T01:00:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000184",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/CHIOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T01:00:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000185",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/GSWPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T02:00:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000186",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/ATLUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T02:00:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000187",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/NOPLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T03:00:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000188",
        "seasonStageId": 2,
        "gameUrlCode": "20210115/LACSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T03:00:00.000Z",
        "startDateEastern": "20210115",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000189",
        "seasonStageId": 2,
        "gameUrlCode": "20210116/HOUSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T22:00:00.000Z",
        "startDateEastern": "20210116",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000190",
        "seasonStageId": 2,
        "gameUrlCode": "20210116/ORLBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-16T23:00:00.000Z",
        "startDateEastern": "20210116",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000191",
        "seasonStageId": 2,
        "gameUrlCode": "20210116/CHATOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-17T00:30:00.000Z",
        "startDateEastern": "20210116",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000192",
        "seasonStageId": 2,
        "gameUrlCode": "20210116/DETMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-17T01:00:00.000Z",
        "startDateEastern": "20210116",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000193",
        "seasonStageId": 2,
        "gameUrlCode": "20210116/PHIMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-17T01:00:00.000Z",
        "startDateEastern": "20210116",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000194",
        "seasonStageId": 2,
        "gameUrlCode": "20210116/INDPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-17T02:00:00.000Z",
        "startDateEastern": "20210116",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000195",
        "seasonStageId": 2,
        "gameUrlCode": "20210116/ATLPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-17T03:00:00.000Z",
        "startDateEastern": "20210116",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000196",
        "seasonStageId": 2,
        "gameUrlCode": "20210117/NYKBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-17T18:00:00.000Z",
        "startDateEastern": "20210117",
        "isNeutralVenue": false,
        "startTimeEastern": "1:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000197",
        "seasonStageId": 2,
        "gameUrlCode": "20210117/CLEWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-17T19:00:00.000Z",
        "startDateEastern": "20210117",
        "isNeutralVenue": false,
        "startTimeEastern": "2:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000198",
        "seasonStageId": 2,
        "gameUrlCode": "20210117/CHIDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-17T20:00:00.000Z",
        "startDateEastern": "20210117",
        "isNeutralVenue": false,
        "startTimeEastern": "3:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000199",
        "seasonStageId": 2,
        "gameUrlCode": "20210117/PHIOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T00:00:00.000Z",
        "startDateEastern": "20210117",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000200",
        "seasonStageId": 2,
        "gameUrlCode": "20210117/UTADEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T01:00:00.000Z",
        "startDateEastern": "20210117",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000201",
        "seasonStageId": 2,
        "gameUrlCode": "20210117/NOPSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T02:00:00.000Z",
        "startDateEastern": "20210117",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000202",
        "seasonStageId": 2,
        "gameUrlCode": "20210117/INDLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T03:00:00.000Z",
        "startDateEastern": "20210117",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000203",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/ORLNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T17:00:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "12:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000204",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/CLEWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T19:00:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "2:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000205",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/MINATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T19:30:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "2:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000206",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/DETMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T20:00:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "3:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000207",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/SASPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T20:00:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "3:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000208",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/PHXMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-18T22:00:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000209",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/MILBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-19T00:30:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000210",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/DALTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-19T00:30:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000211",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/HOUCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-19T01:00:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000212",
        "seasonStageId": 2,
        "gameUrlCode": "20210118/GSWLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-19T03:00:00.000Z",
        "startDateEastern": "20210118",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000213",
        "seasonStageId": 2,
        "gameUrlCode": "20210119/OKCDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-20T02:00:00.000Z",
        "startDateEastern": "20210119",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000214",
        "seasonStageId": 2,
        "gameUrlCode": "20210119/NOPUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-20T02:00:00.000Z",
        "startDateEastern": "20210119",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000215",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/WASCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T00:00:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000216",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/BKNCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T00:00:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000217",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/DALIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T00:00:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000218",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/BOSPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T00:00:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000219",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/DETATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T00:30:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000220",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/MIATOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T00:30:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000221",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/ORLMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T01:00:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000222",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/PHXHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T02:30:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "9:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000223",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/SASGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T03:00:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000224",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/SACLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T03:00:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000225",
        "seasonStageId": 2,
        "gameUrlCode": "20210120/MEMPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-21T03:00:00.000Z",
        "startDateEastern": "20210120",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000226",
        "seasonStageId": 2,
        "gameUrlCode": "20210121/LALMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-22T00:30:00.000Z",
        "startDateEastern": "20210121",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000227",
        "seasonStageId": 2,
        "gameUrlCode": "20210121/NOPUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-22T03:00:00.000Z",
        "startDateEastern": "20210121",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000228",
        "seasonStageId": 2,
        "gameUrlCode": "20210121/NYKGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-22T03:00:00.000Z",
        "startDateEastern": "20210121",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000229",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/CHICHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T00:00:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000230",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/HOUDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T00:00:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000231",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/ORLIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T00:00:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000232",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/BKNCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T00:30:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000233",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/BOSPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T00:30:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000234",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/MIATOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T00:30:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000235",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/WASMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T01:00:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000236",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/ATLMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T01:00:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000237",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/DALSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T01:30:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000238",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/DENPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T03:00:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000239",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/OKCLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T03:00:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000240",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/MEMPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T03:00:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000241",
        "seasonStageId": 2,
        "gameUrlCode": "20210122/NYKSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T03:00:00.000Z",
        "startDateEastern": "20210122",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000242",
        "seasonStageId": 2,
        "gameUrlCode": "20210123/GSWUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-23T22:00:00.000Z",
        "startDateEastern": "20210123",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000243",
        "seasonStageId": 2,
        "gameUrlCode": "20210123/PHIDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T00:00:00.000Z",
        "startDateEastern": "20210123",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000244",
        "seasonStageId": 2,
        "gameUrlCode": "20210123/MIABKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T00:30:00.000Z",
        "startDateEastern": "20210123",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000245",
        "seasonStageId": 2,
        "gameUrlCode": "20210123/LALCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T01:00:00.000Z",
        "startDateEastern": "20210123",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000246",
        "seasonStageId": 2,
        "gameUrlCode": "20210123/NOPMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T01:00:00.000Z",
        "startDateEastern": "20210123",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000247",
        "seasonStageId": 2,
        "gameUrlCode": "20210123/HOUDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T01:30:00.000Z",
        "startDateEastern": "20210123",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000248",
        "seasonStageId": 2,
        "gameUrlCode": "20210123/DENPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T02:00:00.000Z",
        "startDateEastern": "20210123",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000249",
        "seasonStageId": 2,
        "gameUrlCode": "20210124/TORIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T20:30:00.000Z",
        "startDateEastern": "20210124",
        "isNeutralVenue": false,
        "startTimeEastern": "3:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000250",
        "seasonStageId": 2,
        "gameUrlCode": "20210124/CLEBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T21:00:00.000Z",
        "startDateEastern": "20210124",
        "isNeutralVenue": false,
        "startTimeEastern": "4:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000251",
        "seasonStageId": 2,
        "gameUrlCode": "20210124/OKCLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T21:00:00.000Z",
        "startDateEastern": "20210124",
        "isNeutralVenue": false,
        "startTimeEastern": "4:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000252",
        "seasonStageId": 2,
        "gameUrlCode": "20210124/CHAORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-24T23:00:00.000Z",
        "startDateEastern": "20210124",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000253",
        "seasonStageId": 2,
        "gameUrlCode": "20210124/WASSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-25T00:00:00.000Z",
        "startDateEastern": "20210124",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000254",
        "seasonStageId": 2,
        "gameUrlCode": "20210124/ATLMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-25T00:30:00.000Z",
        "startDateEastern": "20210124",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000255",
        "seasonStageId": 2,
        "gameUrlCode": "20210124/SACMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-25T01:00:00.000Z",
        "startDateEastern": "20210124",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000256",
        "seasonStageId": 2,
        "gameUrlCode": "20210124/NYKPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-25T02:00:00.000Z",
        "startDateEastern": "20210124",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000257",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/PHIDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T00:00:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000258",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/TORIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T00:00:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000259",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/CHAORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T00:00:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000260",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/MIABKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T00:30:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000261",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/LALCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T00:30:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000262",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/BOSCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T01:00:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000263",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/SACMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T01:00:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000264",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/SASNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T01:00:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000265",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/DENDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T01:30:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000266",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/MINGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T03:00:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000267",
        "seasonStageId": 2,
        "gameUrlCode": "20210125/OKCPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-26T03:00:00.000Z",
        "startDateEastern": "20210125",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000268",
        "seasonStageId": 2,
        "gameUrlCode": "20210126/LACATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-27T00:30:00.000Z",
        "startDateEastern": "20210126",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000269",
        "seasonStageId": 2,
        "gameUrlCode": "20210126/WASHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-27T01:00:00.000Z",
        "startDateEastern": "20210126",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000270",
        "seasonStageId": 2,
        "gameUrlCode": "20210126/NYKUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-27T02:00:00.000Z",
        "startDateEastern": "20210126",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000271",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/INDCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T00:00:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000272",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/DETCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T00:00:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000273",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/SACORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T00:00:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000274",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/BKNATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T00:30:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000275",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/DENMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T00:30:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000276",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/LALPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T00:30:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000277",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/MILTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T00:30:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000278",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/CHIMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T01:00:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000279",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/WASNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T01:00:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000280",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/BOSSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T01:30:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000281",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/OKCPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T02:00:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000282",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/DALUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T02:00:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000283",
        "seasonStageId": 2,
        "gameUrlCode": "20210127/MINGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-28T03:00:00.000Z",
        "startDateEastern": "20210127",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000284",
        "seasonStageId": 2,
        "gameUrlCode": "20210128/LALDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-29T00:00:00.000Z",
        "startDateEastern": "20210128",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000285",
        "seasonStageId": 2,
        "gameUrlCode": "20210128/LACMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-29T00:00:00.000Z",
        "startDateEastern": "20210128",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000286",
        "seasonStageId": 2,
        "gameUrlCode": "20210128/GSWPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-29T02:00:00.000Z",
        "startDateEastern": "20210128",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000287",
        "seasonStageId": 2,
        "gameUrlCode": "20210128/PORHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-29T02:30:00.000Z",
        "startDateEastern": "20210128",
        "isNeutralVenue": false,
        "startTimeEastern": "9:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000288",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/INDCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T00:00:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000289",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/LACORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T00:00:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000290",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/ATLWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T00:00:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000291",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/CLENYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T00:30:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000292",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/SACTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T00:30:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000293",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/MILNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T00:30:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000294",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/PHIMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T01:00:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000295",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/BKNOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T01:00:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000296",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/DENSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T01:30:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000297",
        "seasonStageId": 2,
        "gameUrlCode": "20210129/DALUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T03:00:00.000Z",
        "startDateEastern": "20210129",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000298",
        "seasonStageId": 2,
        "gameUrlCode": "20210130/PORCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-30T22:00:00.000Z",
        "startDateEastern": "20210130",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000299",
        "seasonStageId": 2,
        "gameUrlCode": "20210130/MILCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T00:00:00.000Z",
        "startDateEastern": "20210130",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000300",
        "seasonStageId": 2,
        "gameUrlCode": "20210130/HOUNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T00:00:00.000Z",
        "startDateEastern": "20210130",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000301",
        "seasonStageId": 2,
        "gameUrlCode": "20210130/SACMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T01:00:00.000Z",
        "startDateEastern": "20210130",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000302",
        "seasonStageId": 2,
        "gameUrlCode": "20210130/LALBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T01:30:00.000Z",
        "startDateEastern": "20210130",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000303",
        "seasonStageId": 2,
        "gameUrlCode": "20210130/PHXDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T01:30:00.000Z",
        "startDateEastern": "20210130",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000304",
        "seasonStageId": 2,
        "gameUrlCode": "20210130/MEMSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T01:30:00.000Z",
        "startDateEastern": "20210130",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000305",
        "seasonStageId": 2,
        "gameUrlCode": "20210130/DETGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T01:30:00.000Z",
        "startDateEastern": "20210130",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000306",
        "seasonStageId": 2,
        "gameUrlCode": "20210131/UTADEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T20:30:00.000Z",
        "startDateEastern": "20210131",
        "isNeutralVenue": false,
        "startTimeEastern": "3:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000307",
        "seasonStageId": 2,
        "gameUrlCode": "20210131/PHIIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T22:00:00.000Z",
        "startDateEastern": "20210131",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000308",
        "seasonStageId": 2,
        "gameUrlCode": "20210131/LACNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T22:00:00.000Z",
        "startDateEastern": "20210131",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000309",
        "seasonStageId": 2,
        "gameUrlCode": "20210131/ORLTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-01-31T23:00:00.000Z",
        "startDateEastern": "20210131",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000310",
        "seasonStageId": 2,
        "gameUrlCode": "20210131/BKNWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-01T00:00:00.000Z",
        "startDateEastern": "20210131",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000311",
        "seasonStageId": 2,
        "gameUrlCode": "20210131/CLEMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-01T00:30:00.000Z",
        "startDateEastern": "20210131",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000312",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/MINCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T00:00:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000313",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/LALATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T00:30:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000314",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/CHAMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T00:30:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000315",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/NYKCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T01:00:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000316",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/PORMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T01:00:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000317",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/SACNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T01:00:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000318",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/HOUOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T01:00:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000319",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/PHXDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T01:30:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000320",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/MEMSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T01:30:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000321",
        "seasonStageId": 2,
        "gameUrlCode": "20210201/DETDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-02T02:00:00.000Z",
        "startDateEastern": "20210201",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000322",
        "seasonStageId": 2,
        "gameUrlCode": "20210202/MEMIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-03T00:00:00.000Z",
        "startDateEastern": "20210202",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000323",
        "seasonStageId": 2,
        "gameUrlCode": "20210202/TORORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-03T00:00:00.000Z",
        "startDateEastern": "20210202",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000324",
        "seasonStageId": 2,
        "gameUrlCode": "20210202/LACBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-03T00:30:00.000Z",
        "startDateEastern": "20210202",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000325",
        "seasonStageId": 2,
        "gameUrlCode": "20210202/DETUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-03T02:00:00.000Z",
        "startDateEastern": "20210202",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000326",
        "seasonStageId": 2,
        "gameUrlCode": "20210202/BOSGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-03T03:00:00.000Z",
        "startDateEastern": "20210202",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000327",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/PHICHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T00:00:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000328",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/LACCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T00:00:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000329",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/INDMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T00:00:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000330",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/DALATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T00:30:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000331",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/WASMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T00:30:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000332",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/NYKCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T01:00:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000333",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/HOUOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T01:00:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000334",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/MINSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T01:30:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000335",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/PHXNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T02:30:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "9:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000336",
        "seasonStageId": 2,
        "gameUrlCode": "20210203/BOSSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-04T03:00:00.000Z",
        "startDateEastern": "20210203",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000337",
        "seasonStageId": 2,
        "gameUrlCode": "20210204/PORPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-05T00:00:00.000Z",
        "startDateEastern": "20210204",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000338",
        "seasonStageId": 2,
        "gameUrlCode": "20210204/UTAATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-05T00:30:00.000Z",
        "startDateEastern": "20210204",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000339",
        "seasonStageId": 2,
        "gameUrlCode": "20210204/GSWDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-05T00:30:00.000Z",
        "startDateEastern": "20210204",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000340",
        "seasonStageId": 2,
        "gameUrlCode": "20210204/HOUMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-05T01:00:00.000Z",
        "startDateEastern": "20210204",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000341",
        "seasonStageId": 2,
        "gameUrlCode": "20210204/DENLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-05T03:00:00.000Z",
        "startDateEastern": "20210204",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000342",
        "seasonStageId": 2,
        "gameUrlCode": "20210205/UTACHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T00:00:00.000Z",
        "startDateEastern": "20210205",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000343",
        "seasonStageId": 2,
        "gameUrlCode": "20210205/NOPIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T00:00:00.000Z",
        "startDateEastern": "20210205",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000344",
        "seasonStageId": 2,
        "gameUrlCode": "20210205/CHIORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T00:00:00.000Z",
        "startDateEastern": "20210205",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000345",
        "seasonStageId": 2,
        "gameUrlCode": "20210205/TORBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T00:30:00.000Z",
        "startDateEastern": "20210205",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000346",
        "seasonStageId": 2,
        "gameUrlCode": "20210205/MILCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T00:30:00.000Z",
        "startDateEastern": "20210205",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000347",
        "seasonStageId": 2,
        "gameUrlCode": "20210205/WASMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T01:00:00.000Z",
        "startDateEastern": "20210205",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000348",
        "seasonStageId": 2,
        "gameUrlCode": "20210205/MINOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T01:00:00.000Z",
        "startDateEastern": "20210205",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000349",
        "seasonStageId": 2,
        "gameUrlCode": "20210205/DETPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T02:00:00.000Z",
        "startDateEastern": "20210205",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000350",
        "seasonStageId": 2,
        "gameUrlCode": "20210205/BOSLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T03:00:00.000Z",
        "startDateEastern": "20210205",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000351",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/PORNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T18:00:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "1:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000352",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/DENSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-06T22:00:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000353",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/CHIORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T00:00:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000354",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/BKNPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T00:00:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000355",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/MEMNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T00:00:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000356",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/TORATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T00:30:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000357",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/MILCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T01:00:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000358",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/SASHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T01:00:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000359",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/MINOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T01:00:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000360",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/GSWDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T01:30:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000361",
        "seasonStageId": 2,
        "gameUrlCode": "20210206/DETLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T03:00:00.000Z",
        "startDateEastern": "20210206",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000362",
        "seasonStageId": 2,
        "gameUrlCode": "20210207/PORCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T18:00:00.000Z",
        "startDateEastern": "20210207",
        "isNeutralVenue": false,
        "startTimeEastern": "1:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000363",
        "seasonStageId": 2,
        "gameUrlCode": "20210207/UTAIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T18:00:00.000Z",
        "startDateEastern": "20210207",
        "isNeutralVenue": false,
        "startTimeEastern": "1:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000364",
        "seasonStageId": 2,
        "gameUrlCode": "20210207/MIANYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T18:00:00.000Z",
        "startDateEastern": "20210207",
        "isNeutralVenue": false,
        "startTimeEastern": "1:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000365",
        "seasonStageId": 2,
        "gameUrlCode": "20210207/BOSPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T19:00:00.000Z",
        "startDateEastern": "20210207",
        "isNeutralVenue": false,
        "startTimeEastern": "2:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000366",
        "seasonStageId": 2,
        "gameUrlCode": "20210207/SACLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-07T20:00:00.000Z",
        "startDateEastern": "20210207",
        "isNeutralVenue": false,
        "startTimeEastern": "3:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000367",
        "seasonStageId": 2,
        "gameUrlCode": "20210208/HOUCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-09T00:00:00.000Z",
        "startDateEastern": "20210208",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000368",
        "seasonStageId": 2,
        "gameUrlCode": "20210208/WASCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-09T01:00:00.000Z",
        "startDateEastern": "20210208",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000369",
        "seasonStageId": 2,
        "gameUrlCode": "20210208/TORMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-09T01:00:00.000Z",
        "startDateEastern": "20210208",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000370",
        "seasonStageId": 2,
        "gameUrlCode": "20210208/MINDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-09T01:30:00.000Z",
        "startDateEastern": "20210208",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000371",
        "seasonStageId": 2,
        "gameUrlCode": "20210208/GSWSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-09T01:30:00.000Z",
        "startDateEastern": "20210208",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000372",
        "seasonStageId": 2,
        "gameUrlCode": "20210208/CLEPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-09T02:00:00.000Z",
        "startDateEastern": "20210208",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000373",
        "seasonStageId": 2,
        "gameUrlCode": "20210208/MILDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-09T02:30:00.000Z",
        "startDateEastern": "20210208",
        "isNeutralVenue": false,
        "startTimeEastern": "9:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000374",
        "seasonStageId": 2,
        "gameUrlCode": "20210208/OKCLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-09T03:00:00.000Z",
        "startDateEastern": "20210208",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000375",
        "seasonStageId": 2,
        "gameUrlCode": "20210209/BKNDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-10T00:00:00.000Z",
        "startDateEastern": "20210209",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000376",
        "seasonStageId": 2,
        "gameUrlCode": "20210209/NYKMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-10T00:30:00.000Z",
        "startDateEastern": "20210209",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000377",
        "seasonStageId": 2,
        "gameUrlCode": "20210209/HOUNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-10T00:30:00.000Z",
        "startDateEastern": "20210209",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000378",
        "seasonStageId": 2,
        "gameUrlCode": "20210209/GSWSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-10T01:30:00.000Z",
        "startDateEastern": "20210209",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000379",
        "seasonStageId": 2,
        "gameUrlCode": "20210209/BOSUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-10T03:00:00.000Z",
        "startDateEastern": "20210209",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000380",
        "seasonStageId": 2,
        "gameUrlCode": "20210209/ORLPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-10T03:00:00.000Z",
        "startDateEastern": "20210209",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000381",
        "seasonStageId": 2,
        "gameUrlCode": "20210209/PHISAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-10T03:00:00.000Z",
        "startDateEastern": "20210209",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000382",
        "seasonStageId": 2,
        "gameUrlCode": "20210210/TORWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-11T00:00:00.000Z",
        "startDateEastern": "20210210",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000383",
        "seasonStageId": 2,
        "gameUrlCode": "20210210/INDBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-11T00:30:00.000Z",
        "startDateEastern": "20210210",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000384",
        "seasonStageId": 2,
        "gameUrlCode": "20210210/ATLDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-11T00:30:00.000Z",
        "startDateEastern": "20210210",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000385",
        "seasonStageId": 2,
        "gameUrlCode": "20210210/NOPCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-11T01:00:00.000Z",
        "startDateEastern": "20210210",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000386",
        "seasonStageId": 2,
        "gameUrlCode": "20210210/CHAMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-11T01:00:00.000Z",
        "startDateEastern": "20210210",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000387",
        "seasonStageId": 2,
        "gameUrlCode": "20210210/LACMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-11T01:00:00.000Z",
        "startDateEastern": "20210210",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000388",
        "seasonStageId": 2,
        "gameUrlCode": "20210210/CLEDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-11T02:00:00.000Z",
        "startDateEastern": "20210210",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000389",
        "seasonStageId": 2,
        "gameUrlCode": "20210210/MILPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-11T03:00:00.000Z",
        "startDateEastern": "20210210",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000390",
        "seasonStageId": 2,
        "gameUrlCode": "20210210/OKCLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-11T03:00:00.000Z",
        "startDateEastern": "20210210",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000391",
        "seasonStageId": 2,
        "gameUrlCode": "20210211/INDDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-12T00:00:00.000Z",
        "startDateEastern": "20210211",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000392",
        "seasonStageId": 2,
        "gameUrlCode": "20210211/MIAHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-12T00:30:00.000Z",
        "startDateEastern": "20210211",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000393",
        "seasonStageId": 2,
        "gameUrlCode": "20210211/ORLGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-12T03:00:00.000Z",
        "startDateEastern": "20210211",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000394",
        "seasonStageId": 2,
        "gameUrlCode": "20210211/PHIPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-12T03:00:00.000Z",
        "startDateEastern": "20210211",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000395",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/MINCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T00:00:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000396",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/NYKWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T00:00:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000397",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/SASATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T00:30:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000398",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/TORBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T00:30:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000399",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/NOPDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T00:30:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000400",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/LACCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T01:00:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000401",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/OKCDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T02:00:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000402",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/MILUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T02:00:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000403",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/MEMLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T03:00:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000404",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/CLEPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T03:00:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000405",
        "seasonStageId": 2,
        "gameUrlCode": "20210212/ORLSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T03:00:00.000Z",
        "startDateEastern": "20210212",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000406",
        "seasonStageId": 2,
        "gameUrlCode": "20210213/PHIPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-13T22:00:00.000Z",
        "startDateEastern": "20210213",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000407",
        "seasonStageId": 2,
        "gameUrlCode": "20210213/INDATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-14T00:30:00.000Z",
        "startDateEastern": "20210213",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000408",
        "seasonStageId": 2,
        "gameUrlCode": "20210213/HOUNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-14T00:30:00.000Z",
        "startDateEastern": "20210213",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000409",
        "seasonStageId": 2,
        "gameUrlCode": "20210213/BKNGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-14T01:30:00.000Z",
        "startDateEastern": "20210213",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000410",
        "seasonStageId": 2,
        "gameUrlCode": "20210213/MIAUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-14T02:00:00.000Z",
        "startDateEastern": "20210213",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000411",
        "seasonStageId": 2,
        "gameUrlCode": "20210214/PORDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-14T20:30:00.000Z",
        "startDateEastern": "20210214",
        "isNeutralVenue": false,
        "startTimeEastern": "3:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000412",
        "seasonStageId": 2,
        "gameUrlCode": "20210214/DETBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-14T23:00:00.000Z",
        "startDateEastern": "20210214",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000413",
        "seasonStageId": 2,
        "gameUrlCode": "20210214/MINTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-14T23:00:00.000Z",
        "startDateEastern": "20210214",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000414",
        "seasonStageId": 2,
        "gameUrlCode": "20210214/SASCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-15T00:00:00.000Z",
        "startDateEastern": "20210214",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000415",
        "seasonStageId": 2,
        "gameUrlCode": "20210214/MILOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-15T00:00:00.000Z",
        "startDateEastern": "20210214",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000416",
        "seasonStageId": 2,
        "gameUrlCode": "20210214/LALDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-15T00:30:00.000Z",
        "startDateEastern": "20210214",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000417",
        "seasonStageId": 2,
        "gameUrlCode": "20210214/ORLPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-15T01:00:00.000Z",
        "startDateEastern": "20210214",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000418",
        "seasonStageId": 2,
        "gameUrlCode": "20210214/MEMSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-15T02:00:00.000Z",
        "startDateEastern": "20210214",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000419",
        "seasonStageId": 2,
        "gameUrlCode": "20210214/CLELAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-15T03:00:00.000Z",
        "startDateEastern": "20210214",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000420",
        "seasonStageId": 2,
        "gameUrlCode": "20210215/CHIIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-16T00:00:00.000Z",
        "startDateEastern": "20210215",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000421",
        "seasonStageId": 2,
        "gameUrlCode": "20210215/HOUWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-16T00:00:00.000Z",
        "startDateEastern": "20210215",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000422",
        "seasonStageId": 2,
        "gameUrlCode": "20210215/ATLNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-16T00:30:00.000Z",
        "startDateEastern": "20210215",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000423",
        "seasonStageId": 2,
        "gameUrlCode": "20210215/PHIUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-16T02:00:00.000Z",
        "startDateEastern": "20210215",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000424",
        "seasonStageId": 2,
        "gameUrlCode": "20210215/CLEGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-16T03:00:00.000Z",
        "startDateEastern": "20210215",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000425",
        "seasonStageId": 2,
        "gameUrlCode": "20210215/MIALAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-16T03:00:00.000Z",
        "startDateEastern": "20210215",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000426",
        "seasonStageId": 2,
        "gameUrlCode": "20210215/BKNSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-16T03:00:00.000Z",
        "startDateEastern": "20210215",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000427",
        "seasonStageId": 2,
        "gameUrlCode": "20210216/DENBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-17T00:00:00.000Z",
        "startDateEastern": "20210216",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000428",
        "seasonStageId": 2,
        "gameUrlCode": "20210216/SASDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-17T00:00:00.000Z",
        "startDateEastern": "20210216",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000429",
        "seasonStageId": 2,
        "gameUrlCode": "20210216/NOPMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-17T00:30:00.000Z",
        "startDateEastern": "20210216",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000430",
        "seasonStageId": 2,
        "gameUrlCode": "20210216/TORMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-17T01:00:00.000Z",
        "startDateEastern": "20210216",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000431",
        "seasonStageId": 2,
        "gameUrlCode": "20210216/LALMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-17T01:00:00.000Z",
        "startDateEastern": "20210216",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000432",
        "seasonStageId": 2,
        "gameUrlCode": "20210216/POROKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-17T01:00:00.000Z",
        "startDateEastern": "20210216",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000433",
        "seasonStageId": 2,
        "gameUrlCode": "20210216/BKNPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-17T03:00:00.000Z",
        "startDateEastern": "20210216",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000434",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/CHICHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T00:00:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000435",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/SASCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T00:00:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000436",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/NYKORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T00:00:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000437",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/DENWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T00:00:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000438",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/ATLBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T00:30:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000439",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/HOUPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T00:30:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000440",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/INDMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T01:00:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000441",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/PORNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T01:00:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000442",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/DETDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T01:30:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000443",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/MIAGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T03:00:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000444",
        "seasonStageId": 2,
        "gameUrlCode": "20210217/UTALAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-18T03:00:00.000Z",
        "startDateEastern": "20210217",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000445",
        "seasonStageId": 2,
        "gameUrlCode": "20210218/TORMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-19T00:30:00.000Z",
        "startDateEastern": "20210218",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000446",
        "seasonStageId": 2,
        "gameUrlCode": "20210218/BKNLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-19T03:00:00.000Z",
        "startDateEastern": "20210218",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000447",
        "seasonStageId": 2,
        "gameUrlCode": "20210218/MIASAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-19T03:00:00.000Z",
        "startDateEastern": "20210218",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000448",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/DENCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T00:00:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000449",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/GSWORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T00:00:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000450",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/CHIPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T00:00:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000451",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/ATLBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T00:30:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000452",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/DETMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T01:00:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000453",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/OKCMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T01:00:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000454",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/TORMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T01:00:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000455",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/PHXNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T01:00:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000456",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/DALHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T02:30:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "9:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000457",
        "seasonStageId": 2,
        "gameUrlCode": "20210219/UTALAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T03:00:00.000Z",
        "startDateEastern": "20210219",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000458",
        "seasonStageId": 2,
        "gameUrlCode": "20210220/SASNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-20T22:00:00.000Z",
        "startDateEastern": "20210220",
        "isNeutralVenue": false,
        "startTimeEastern": "5:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000459",
        "seasonStageId": 2,
        "gameUrlCode": "20210220/GSWCHA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T00:00:00.000Z",
        "startDateEastern": "20210220",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000460",
        "seasonStageId": 2,
        "gameUrlCode": "20210220/SACCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T01:00:00.000Z",
        "startDateEastern": "20210220",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000461",
        "seasonStageId": 2,
        "gameUrlCode": "20210220/INDHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T01:00:00.000Z",
        "startDateEastern": "20210220",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000462",
        "seasonStageId": 2,
        "gameUrlCode": "20210220/PHXMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T01:00:00.000Z",
        "startDateEastern": "20210220",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000463",
        "seasonStageId": 2,
        "gameUrlCode": "20210220/MIALAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T01:30:00.000Z",
        "startDateEastern": "20210220",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000464",
        "seasonStageId": 2,
        "gameUrlCode": "20210220/WASPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T03:00:00.000Z",
        "startDateEastern": "20210220",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000465",
        "seasonStageId": 2,
        "gameUrlCode": "20210221/BOSNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T20:30:00.000Z",
        "startDateEastern": "20210221",
        "isNeutralVenue": false,
        "startTimeEastern": "3:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000466",
        "seasonStageId": 2,
        "gameUrlCode": "20210221/OKCCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T23:00:00.000Z",
        "startDateEastern": "20210221",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000467",
        "seasonStageId": 2,
        "gameUrlCode": "20210221/DETORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T23:00:00.000Z",
        "startDateEastern": "20210221",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000468",
        "seasonStageId": 2,
        "gameUrlCode": "20210221/PHITOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-21T23:00:00.000Z",
        "startDateEastern": "20210221",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000469",
        "seasonStageId": 2,
        "gameUrlCode": "20210221/MINNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-22T00:00:00.000Z",
        "startDateEastern": "20210221",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000470",
        "seasonStageId": 2,
        "gameUrlCode": "20210221/DENATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-22T00:30:00.000Z",
        "startDateEastern": "20210221",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000471",
        "seasonStageId": 2,
        "gameUrlCode": "20210221/SACMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-22T01:00:00.000Z",
        "startDateEastern": "20210221",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000472",
        "seasonStageId": 2,
        "gameUrlCode": "20210221/BKNLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-22T01:00:00.000Z",
        "startDateEastern": "20210221",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000473",
        "seasonStageId": 2,
        "gameUrlCode": "20210222/SASIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-23T00:00:00.000Z",
        "startDateEastern": "20210222",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000474",
        "seasonStageId": 2,
        "gameUrlCode": "20210222/CHIHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-23T01:00:00.000Z",
        "startDateEastern": "20210222",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000475",
        "seasonStageId": 2,
        "gameUrlCode": "20210222/MIAOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-23T01:00:00.000Z",
        "startDateEastern": "20210222",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000476",
        "seasonStageId": 2,
        "gameUrlCode": "20210222/MEMDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-23T01:30:00.000Z",
        "startDateEastern": "20210222",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000477",
        "seasonStageId": 2,
        "gameUrlCode": "20210222/PORPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-23T02:00:00.000Z",
        "startDateEastern": "20210222",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000478",
        "seasonStageId": 2,
        "gameUrlCode": "20210222/CHAUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-23T02:00:00.000Z",
        "startDateEastern": "20210222",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000479",
        "seasonStageId": 2,
        "gameUrlCode": "20210222/WASLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-23T03:00:00.000Z",
        "startDateEastern": "20210222",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000480",
        "seasonStageId": 2,
        "gameUrlCode": "20210223/ATLCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-24T00:00:00.000Z",
        "startDateEastern": "20210223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000481",
        "seasonStageId": 2,
        "gameUrlCode": "20210223/DETORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-24T00:00:00.000Z",
        "startDateEastern": "20210223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000482",
        "seasonStageId": 2,
        "gameUrlCode": "20210223/SACBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-24T00:30:00.000Z",
        "startDateEastern": "20210223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000483",
        "seasonStageId": 2,
        "gameUrlCode": "20210223/GSWNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-24T00:30:00.000Z",
        "startDateEastern": "20210223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000484",
        "seasonStageId": 2,
        "gameUrlCode": "20210223/PHITOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-24T00:30:00.000Z",
        "startDateEastern": "20210223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000485",
        "seasonStageId": 2,
        "gameUrlCode": "20210223/BOSDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-24T00:30:00.000Z",
        "startDateEastern": "20210223",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000486",
        "seasonStageId": 2,
        "gameUrlCode": "20210223/MINMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-24T01:00:00.000Z",
        "startDateEastern": "20210223",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000487",
        "seasonStageId": 2,
        "gameUrlCode": "20210223/PORDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-24T03:00:00.000Z",
        "startDateEastern": "20210223",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000488",
        "seasonStageId": 2,
        "gameUrlCode": "20210223/WASLAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-24T03:00:00.000Z",
        "startDateEastern": "20210223",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000489",
        "seasonStageId": 2,
        "gameUrlCode": "20210224/GSWIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-25T00:00:00.000Z",
        "startDateEastern": "20210224",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000490",
        "seasonStageId": 2,
        "gameUrlCode": "20210224/BOSATL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-25T00:30:00.000Z",
        "startDateEastern": "20210224",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000491",
        "seasonStageId": 2,
        "gameUrlCode": "20210224/HOUCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-25T00:30:00.000Z",
        "startDateEastern": "20210224",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000492",
        "seasonStageId": 2,
        "gameUrlCode": "20210224/TORMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-25T00:30:00.000Z",
        "startDateEastern": "20210224",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000493",
        "seasonStageId": 2,
        "gameUrlCode": "20210224/MINCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-25T01:00:00.000Z",
        "startDateEastern": "20210224",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000494",
        "seasonStageId": 2,
        "gameUrlCode": "20210224/DETNOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-25T01:00:00.000Z",
        "startDateEastern": "20210224",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000495",
        "seasonStageId": 2,
        "gameUrlCode": "20210224/SASOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-25T01:00:00.000Z",
        "startDateEastern": "20210224",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000496",
        "seasonStageId": 2,
        "gameUrlCode": "20210224/CHAPHX",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-25T02:00:00.000Z",
        "startDateEastern": "20210224",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000497",
        "seasonStageId": 2,
        "gameUrlCode": "20210224/LALUTA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-25T03:00:00.000Z",
        "startDateEastern": "20210224",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000498",
        "seasonStageId": 2,
        "gameUrlCode": "20210225/DALPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-26T00:00:00.000Z",
        "startDateEastern": "20210225",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000499",
        "seasonStageId": 2,
        "gameUrlCode": "20210225/ORLBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-26T00:30:00.000Z",
        "startDateEastern": "20210225",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000500",
        "seasonStageId": 2,
        "gameUrlCode": "20210225/SACNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-26T00:30:00.000Z",
        "startDateEastern": "20210225",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000501",
        "seasonStageId": 2,
        "gameUrlCode": "20210225/LACMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-26T01:00:00.000Z",
        "startDateEastern": "20210225",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000502",
        "seasonStageId": 2,
        "gameUrlCode": "20210225/WASDEN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-26T02:00:00.000Z",
        "startDateEastern": "20210225",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000503",
        "seasonStageId": 2,
        "gameUrlCode": "20210225/NOPMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-26T02:30:00.000Z",
        "startDateEastern": "20210225",
        "isNeutralVenue": false,
        "startTimeEastern": "9:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000504",
        "seasonStageId": 2,
        "gameUrlCode": "20210226/SACDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T00:00:00.000Z",
        "startDateEastern": "20210226",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000505",
        "seasonStageId": 2,
        "gameUrlCode": "20210226/INDBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T00:30:00.000Z",
        "startDateEastern": "20210226",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000506",
        "seasonStageId": 2,
        "gameUrlCode": "20210226/HOUTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T00:30:00.000Z",
        "startDateEastern": "20210226",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000507",
        "seasonStageId": 2,
        "gameUrlCode": "20210226/UTAMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T01:00:00.000Z",
        "startDateEastern": "20210226",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000508",
        "seasonStageId": 2,
        "gameUrlCode": "20210226/PHXCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T01:00:00.000Z",
        "startDateEastern": "20210226",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000509",
        "seasonStageId": 2,
        "gameUrlCode": "20210226/LACMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T01:00:00.000Z",
        "startDateEastern": "20210226",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000510",
        "seasonStageId": 2,
        "gameUrlCode": "20210226/ATLOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T01:00:00.000Z",
        "startDateEastern": "20210226",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000511",
        "seasonStageId": 2,
        "gameUrlCode": "20210226/CHAGSW",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T03:00:00.000Z",
        "startDateEastern": "20210226",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000512",
        "seasonStageId": 2,
        "gameUrlCode": "20210226/PORLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T03:00:00.000Z",
        "startDateEastern": "20210226",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000513",
        "seasonStageId": 2,
        "gameUrlCode": "20210227/CLEPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T20:00:00.000Z",
        "startDateEastern": "20210227",
        "isNeutralVenue": false,
        "startTimeEastern": "3:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000514",
        "seasonStageId": 2,
        "gameUrlCode": "20210227/NOPSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-27T23:00:00.000Z",
        "startDateEastern": "20210227",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000515",
        "seasonStageId": 2,
        "gameUrlCode": "20210227/INDNYK",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-28T00:00:00.000Z",
        "startDateEastern": "20210227",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000516",
        "seasonStageId": 2,
        "gameUrlCode": "20210227/UTAORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-28T00:00:00.000Z",
        "startDateEastern": "20210227",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000517",
        "seasonStageId": 2,
        "gameUrlCode": "20210227/MINWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-28T00:00:00.000Z",
        "startDateEastern": "20210227",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000518",
        "seasonStageId": 2,
        "gameUrlCode": "20210227/DENOKC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-28T01:00:00.000Z",
        "startDateEastern": "20210227",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000519",
        "seasonStageId": 2,
        "gameUrlCode": "20210227/DALBKN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-28T01:30:00.000Z",
        "startDateEastern": "20210227",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000520",
        "seasonStageId": 2,
        "gameUrlCode": "20210228/LACMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-28T20:30:00.000Z",
        "startDateEastern": "20210228",
        "isNeutralVenue": false,
        "startTimeEastern": "3:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ABC", "longName": "ABC"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000521",
        "seasonStageId": 2,
        "gameUrlCode": "20210228/NYKDET",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-28T23:00:00.000Z",
        "startDateEastern": "20210228",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000522",
        "seasonStageId": 2,
        "gameUrlCode": "20210228/ATLMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-28T23:00:00.000Z",
        "startDateEastern": "20210228",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000523",
        "seasonStageId": 2,
        "gameUrlCode": "20210228/CHITOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-02-28T23:00:00.000Z",
        "startDateEastern": "20210228",
        "isNeutralVenue": false,
        "startTimeEastern": "6:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000524",
        "seasonStageId": 2,
        "gameUrlCode": "20210228/WASBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-01T00:00:00.000Z",
        "startDateEastern": "20210228",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000525",
        "seasonStageId": 2,
        "gameUrlCode": "20210228/MEMHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-01T00:00:00.000Z",
        "startDateEastern": "20210228",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000526",
        "seasonStageId": 2,
        "gameUrlCode": "20210228/PHXMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-01T01:00:00.000Z",
        "startDateEastern": "20210228",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000527",
        "seasonStageId": 2,
        "gameUrlCode": "20210228/GSWLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-01T01:00:00.000Z",
        "startDateEastern": "20210228",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000528",
        "seasonStageId": 2,
        "gameUrlCode": "20210228/CHASAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-01T02:00:00.000Z",
        "startDateEastern": "20210228",
        "isNeutralVenue": false,
        "startTimeEastern": "9:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000529",
        "seasonStageId": 2,
        "gameUrlCode": "20210301/DALORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-02T00:00:00.000Z",
        "startDateEastern": "20210301",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000530",
        "seasonStageId": 2,
        "gameUrlCode": "20210301/INDPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-02T00:00:00.000Z",
        "startDateEastern": "20210301",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000531",
        "seasonStageId": 2,
        "gameUrlCode": "20210301/DENCHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-02T01:00:00.000Z",
        "startDateEastern": "20210301",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000532",
        "seasonStageId": 2,
        "gameUrlCode": "20210301/CLEHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-02T01:00:00.000Z",
        "startDateEastern": "20210301",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000533",
        "seasonStageId": 2,
        "gameUrlCode": "20210301/UTANOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-02T01:00:00.000Z",
        "startDateEastern": "20210301",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000534",
        "seasonStageId": 2,
        "gameUrlCode": "20210301/BKNSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-02T01:30:00.000Z",
        "startDateEastern": "20210301",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000535",
        "seasonStageId": 2,
        "gameUrlCode": "20210301/CHAPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-02T03:30:00.000Z",
        "startDateEastern": "20210301",
        "isNeutralVenue": false,
        "startTimeEastern": "10:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "NBA TV", "longName": "NBA TV"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000536",
        "seasonStageId": 2,
        "gameUrlCode": "20210302/MEMWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-03T00:00:00.000Z",
        "startDateEastern": "20210302",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000537",
        "seasonStageId": 2,
        "gameUrlCode": "20210302/LACBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-03T00:30:00.000Z",
        "startDateEastern": "20210302",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000538",
        "seasonStageId": 2,
        "gameUrlCode": "20210302/ATLMIA",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-03T00:30:00.000Z",
        "startDateEastern": "20210302",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000539",
        "seasonStageId": 2,
        "gameUrlCode": "20210302/DETTOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-03T00:30:00.000Z",
        "startDateEastern": "20210302",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612765", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000540",
        "seasonStageId": 2,
        "gameUrlCode": "20210302/DENMIL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-03T01:00:00.000Z",
        "startDateEastern": "20210302",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000541",
        "seasonStageId": 2,
        "gameUrlCode": "20210302/NYKSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-03T01:30:00.000Z",
        "startDateEastern": "20210302",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612752", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000542",
        "seasonStageId": 2,
        "gameUrlCode": "20210302/PHXLAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-03T03:00:00.000Z",
        "startDateEastern": "20210302",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612756", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000543",
        "seasonStageId": 2,
        "gameUrlCode": "20210303/INDCLE",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-04T00:00:00.000Z",
        "startDateEastern": "20210303",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612739", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000544",
        "seasonStageId": 2,
        "gameUrlCode": "20210303/ATLORL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-04T00:00:00.000Z",
        "startDateEastern": "20210303",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612753", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612737", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000545",
        "seasonStageId": 2,
        "gameUrlCode": "20210303/UTAPHI",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-04T00:00:00.000Z",
        "startDateEastern": "20210303",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612755", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612762", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000546",
        "seasonStageId": 2,
        "gameUrlCode": "20210303/BKNHOU",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-04T00:30:00.000Z",
        "startDateEastern": "20210303",
        "isNeutralVenue": false,
        "startTimeEastern": "7:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612745", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612751", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000547",
        "seasonStageId": 2,
        "gameUrlCode": "20210303/CHAMIN",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-04T01:00:00.000Z",
        "startDateEastern": "20210303",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612750", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612766", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000548",
        "seasonStageId": 2,
        "gameUrlCode": "20210303/CHINOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-04T01:00:00.000Z",
        "startDateEastern": "20210303",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612741", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000549",
        "seasonStageId": 2,
        "gameUrlCode": "20210303/OKCDAL",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-04T01:30:00.000Z",
        "startDateEastern": "20210303",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612742", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000550",
        "seasonStageId": 2,
        "gameUrlCode": "20210303/GSWPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-04T03:00:00.000Z",
        "startDateEastern": "20210303",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612744", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "ESPN", "longName": "ESPN"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000551",
        "seasonStageId": 2,
        "gameUrlCode": "20210303/LALSAC",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-04T03:00:00.000Z",
        "startDateEastern": "20210303",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612747", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000552",
        "seasonStageId": 2,
        "gameUrlCode": "20210304/TORBOS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-05T00:00:00.000Z",
        "startDateEastern": "20210304",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612738", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612761", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000553",
        "seasonStageId": 2,
        "gameUrlCode": "20210304/DENIND",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-05T00:00:00.000Z",
        "startDateEastern": "20210304",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612754", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612743", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000554",
        "seasonStageId": 2,
        "gameUrlCode": "20210304/LACWAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-05T00:00:00.000Z",
        "startDateEastern": "20210304",
        "isNeutralVenue": false,
        "startTimeEastern": "7:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612764", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612746", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000555",
        "seasonStageId": 2,
        "gameUrlCode": "20210304/MILMEM",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-05T01:00:00.000Z",
        "startDateEastern": "20210304",
        "isNeutralVenue": false,
        "startTimeEastern": "8:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612763", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612749", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000556",
        "seasonStageId": 2,
        "gameUrlCode": "20210304/OKCSAS",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-05T01:30:00.000Z",
        "startDateEastern": "20210304",
        "isNeutralVenue": false,
        "startTimeEastern": "8:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612759", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612760", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000557",
        "seasonStageId": 2,
        "gameUrlCode": "20210304/MIANOP",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-05T02:30:00.000Z",
        "startDateEastern": "20210304",
        "isNeutralVenue": false,
        "startTimeEastern": "9:30 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612740", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612748", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": true,
              "isNationalBlackout": true,
              "isTNTOT": true,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {
                "broadcasters": [
                  {"shortName": "TNT", "longName": "TNT"}
                ]
              },
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      },
      {
        "gameId": "0022000558",
        "seasonStageId": 2,
        "gameUrlCode": "20210304/SACPOR",
        "statusNum": 1,
        "extendedStatusNum": 0,
        "isStartTimeTBD": false,
        "startTimeUTC": "2021-03-05T03:00:00.000Z",
        "startDateEastern": "20210304",
        "isNeutralVenue": false,
        "startTimeEastern": "10:00 PM ET",
        "isBuzzerBeater": false,
        "period": {"current": 0, "type": 0, "maxRegular": 4},
        "nugget": {"text": ""},
        "hTeam": {"teamId": "1610612757", "score": "", "win": "0", "loss": "0"},
        "vTeam": {"teamId": "1610612758", "score": "", "win": "0", "loss": "0"},
        "watch": {
          "broadcast": {
            "video": {
              "regionalBlackoutCodes": "",
              "isLeaguePass": false,
              "isNationalBlackout": false,
              "isTNTOT": false,
              "canPurchase": false,
              "isVR": false,
              "isNextVR": false,
              "isNBAOnTNTVR": false,
              "isMagicLeap": false,
              "isOculusVenues": false,
              "national": {"broadcasters": []},
              "canadian": [],
              "spanish_national": []
            }
          }
        }
      }
    ],
    "africa": [],
    "sacramento": [],
    "vegas": [],
    "utah": []
  }
};
