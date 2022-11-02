// teamIds --> [full Name, nickname, img-url, conference]

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Map eastID = {
  "1": [
    'Atlanta Hawks',
    'Hawks',
    'https://upload.wikimedia.org//wikipedia//fr//e//ee//Hawks_2016.png',
    'East',
    'ATL',
    '1610612737' //nba team id
  ],
  "2": [
    'Boston Celtics',
    'Celtics',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//6//65//Celtics_de_Boston_logo.svg//1024px-Celtics_de_Boston_logo.svg.png',
    'East',
    'BOS',
    '1610612738' //nba team id
  ],
  "4": [
    'Brooklyn Nets',
    'Nets',
    'https://upload.wikimedia.org//wikipedia//commons//thumb//4//44//Brooklyn_Nets_newlogo.svg//130px-Brooklyn_Nets_newlogo.svg.png',
    'East',
    'BKN',
    '1610612751' //nba team id
  ],
  "5": [
    'Charlotte Hornets',
    'Hornets',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//f//f3//Hornets_de_Charlotte_logo.svg//1200px-Hornets_de_Charlotte_logo.svg.png',
    'East',
    'CHA',
    '1610612766' //nba team id
  ],
  "6": [
    'Chicago Bulls',
    'Bulls',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//d1//Bulls_de_Chicago_logo.svg//1200px-Bulls_de_Chicago_logo.svg.png',
    'East',
    'CHI',
    '1610612741' //nba team id
  ],
  "7": [
    'Cleveland Cavaliers',
    'Cavaliers',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//0//06//Cavs_de_Cleveland_logo_2017.png//150px-Cavs_de_Cleveland_logo_2017.png',
    'East',
    'CLE',
    '1610612739' //nba team id
  ],
  "10": [
    'Detroit Pistons',
    'Pistons',
    'https://upload.wikimedia.org/wikipedia/commons/6/6a/Detroit_Pistons_primary_logo_2017.png',
    'East',
    'DET',
    '1610612765' //nba team id
  ],
  "15": [
    'Indiana Pacers',
    'Pacers',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//c//cf//Pacers_de_l%27Indiana_logo.svg//1180px-Pacers_de_l%27Indiana_logo.svg.png',
    'East',
    'IND',
    '1610612754' //nba team id
  ],
  "20": [
    'Miami Heat',
    'Heat',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//1//1c//Miami_Heat_-_Logo.svg//1200px-Miami_Heat_-_Logo.svg.png',
    'East',
    'MIA',
    '1610612748' //nba team id
  ],
  "21": [
    'Milwaukee Bucks',
    'Bucks',
    'https://upload.wikimedia.org//wikipedia//fr//3//34//Bucks2015.png',
    'East',
    'MIL',
    '1610612749' //nba team id
  ],
  "24": [
    'New York Knicks',
    'Knicks',
    'https://upload.wikimedia.org/wikipedia/en/thumb/2/25/New_York_Knicks_logo.svg/1261px-New_York_Knicks_logo.svg.png',
    'East',
    'NYK',
    '1610612752' //nba team id
  ],
  "26": [
    'Orlando Magic',
    'Magic',
    'https://upload.wikimedia.org//wikipedia//fr//b//bd//Orlando_Magic_logo_2010.png',
    'East',
    'ORL',
    '1610612753' //nba team id
  ],
  "27": [
    'Philadelphia 76ers',
    '76ers',
    'https://upload.wikimedia.org//wikipedia//fr//4//48//76ers_2016.png',
    'East',
    'PHI',
    '1610612755' //nba team id
  ],
  "38": [
    'Toronto Raptors',
    'Raptors',
    'https://upload.wikimedia.org//wikipedia//fr//8//89//Raptors2015.png',
    'East',
    'TOR',
    '1610612761' //nba team id
  ],
  "41": [
    'Washington Wizards',
    'Wizards',
    'https://upload.wikimedia.org//wikipedia//fr//archive//d//d6//20161212034849%21Wizards2015.png',
    'East',
    'WAS',
    '1610612764' //nba team id
  ]
};

Map westID = {
  "8": [
    'Dallas Mavericks',
    'Mavericks',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//b//b8//Mavericks_de_Dallas_logo.svg//150px-Mavericks_de_Dallas_logo.svg.png',
    'West',
    'DAL',
    '1610612742' //nba team id
  ],
  "9": [
    'Denver Nuggets',
    'Nuggets',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//3//35//Nuggets_de_Denver_2018.png//180px-Nuggets_de_Denver_2018.png',
    'West',
    'DEN',
    '1610612743' //nba team id
  ],
  "11": [
    'Golden State Warriors',
    'Warriors',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//de//Warriors_de_Golden_State_logo.svg//1200px-Warriors_de_Golden_State_logo.svg.png',
    'West',
    'GSW',
    '1610612744' //nba team id
  ],
  "14": [
    'Houston Rockets',
    'Rockets',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//de//Houston_Rockets_logo_2003.png//330px-Houston_Rockets_logo_2003.png',
    'West',
    'HOU',
    '1610612745' //nba team id
  ],
  "16": [
    'Los Angeles Clippers',
    'Clippers',
    'https://upload.wikimedia.org//wikipedia//fr//d//d6//Los_Angeles_Clippers_logo_2010.png',
    'West',
    'LAC',
    '1610612746' //nba team id
  ],
  "17": [
    'Los Angeles Lakers',
    'Lakers',
    'https://upload.wikimedia.org//wikipedia//commons//thumb//3//3c//Los_Angeles_Lakers_logo.svg//220px-Los_Angeles_Lakers_logo.svg.png',
    'West',
    'LAL',
    '1610612747' //nba team id
  ],
  "19": [
    'Memphis Grizzlies',
    'Grizzlies',
    'https://upload.wikimedia.org//wikipedia//en//thumb//f//f1//Memphis_Grizzlies.svg//1200px-Memphis_Grizzlies.svg.png',
    'West',
    'MEM',
    '1610612763' //nba team id
  ],
  "22": [
    'Minnesota Timberwolves',
    'Timberwolves',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//d9//Timberwolves_du_Minnesota_logo_2017.png//200px-Timberwolves_du_Minnesota_logo_2017.png',
    'West',
    'MIN',
    '1610612750' //nba team id
  ],
  "23": [
    'New Orleans Pelicans',
    'Pelicans',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//2//21//New_Orleans_Pelicans.png//200px-New_Orleans_Pelicans.png',
    'West',
    'NOP',
    '1610612740' //nba team id
  ],
  "25": [
    'Oklahoma City Thunder',
    'Thunder',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//4//4f//Thunder_d%27Oklahoma_City_logo.svg//1200px-Thunder_d%27Oklahoma_City_logo.svg.png',
    'West',
    'OKC',
    '1610612760' //nba team id
  ],
  "28": [
    'Phoenix Suns',
    'Suns',
    'https://upload.wikimedia.org//wikipedia//fr//5//56//Phoenix_Suns_2013.png',
    'West',
    'PHO',
    '1610612756' //nba team id
  ],
  "29": [
    'Portland Trail Blazers',
    'Blazers',
    'https://upload.wikimedia.org//wikipedia//en//thumb//2//21//Portland_Trail_Blazers_logo.svg//1200px-Portland_Trail_Blazers_logo.svg.png',
    'West',
    'POR',
    '1610612757' //nba team id
  ],
  "30": [
    'Sacramento Kings',
    'Kings',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//9//95//Kings_de_Sacramento_logo.svg//1200px-Kings_de_Sacramento_logo.svg.png',
    'West',
    'SAC',
    '1610612758' //nba team id
  ],
  "31": [
    'San Antonio Spurs',
    'Spurs',
    'https://upload.wikimedia.org//wikipedia//fr//0//0e//San_Antonio_Spurs_2018.png',
    'West',
    'SAS',
    '1610612759' //nba team id
  ],
  "40": [
    'Utah Jazz',
    'Jazz',
    'https://upload.wikimedia.org//wikipedia//fr//3//3b//Jazz_de_l%27Utah_logo.png',
    'West',
    'UTA',
    '1610612762' //nba team id
  ]
};

Map atlanticId = {
  "2": [
    'Boston Celtics',
    'Celtics',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//6//65//Celtics_de_Boston_logo.svg//1024px-Celtics_de_Boston_logo.svg.png',
    'East'
  ],
  "4": [
    'Brooklyn Nets',
    'Nets',
    'https://upload.wikimedia.org//wikipedia//commons//thumb//4//44//Brooklyn_Nets_newlogo.svg//130px-Brooklyn_Nets_newlogo.svg.png',
    'East'
  ],
  "24": [
    'New York Knicks',
    'Knicks',
    'https://upload.wikimedia.org/wikipedia/en/thumb/2/25/New_York_Knicks_logo.svg/1261px-New_York_Knicks_logo.svg.png',
    'East'
  ],
  "27": [
    'Philadelphia 76ers',
    '76ers',
    'https://upload.wikimedia.org//wikipedia//fr//4//48//76ers_2016.png',
    'East'
  ],
  "38": [
    'Toronto Raptors',
    'Raptors',
    'https://upload.wikimedia.org//wikipedia//fr//8//89//Raptors2015.png',
    'East'
  ],
};

Map centralId = {
  "6": [
    'Chicago Bulls',
    'Bulls',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//d1//Bulls_de_Chicago_logo.svg//1200px-Bulls_de_Chicago_logo.svg.png',
    'East'
  ],
  "7": [
    'Cleveland Cavaliers',
    'Cavaliers',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//0//06//Cavs_de_Cleveland_logo_2017.png//150px-Cavs_de_Cleveland_logo_2017.png',
    'East'
  ],
  "10": [
    'Detroit Pistons',
    'Pistons',
    'https://upload.wikimedia.org/wikipedia/commons/6/6a/Detroit_Pistons_primary_logo_2017.png',
    'East'
  ],
  "15": [
    'Indiana Pacers',
    'Pacers',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//c//cf//Pacers_de_l%27Indiana_logo.svg//1180px-Pacers_de_l%27Indiana_logo.svg.png',
    'East'
  ],
  "21": [
    'Milwaukee Bucks',
    'Bucks',
    'https://upload.wikimedia.org//wikipedia//fr//3//34//Bucks2015.png',
    'East'
  ],
};

Map southeastId = {
  "1": [
    'Atlanta Hawks',
    'Hawks',
    'https://upload.wikimedia.org//wikipedia//fr//e//ee//Hawks_2016.png',
    'East'
  ],
  "5": [
    'Charlotte Hornets',
    'Hornets',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//f//f3//Hornets_de_Charlotte_logo.svg//1200px-Hornets_de_Charlotte_logo.svg.png',
    'East'
  ],
  "20": [
    'Miami Heat',
    'Heat',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//1//1c//Miami_Heat_-_Logo.svg//1200px-Miami_Heat_-_Logo.svg.png',
    'East'
  ],
  "26": [
    'Orlando Magic',
    'Magic',
    'https://upload.wikimedia.org//wikipedia//fr//b//bd//Orlando_Magic_logo_2010.png',
    'East'
  ],
  "41": [
    'Washington Wizards',
    'Wizards',
    'https://upload.wikimedia.org//wikipedia//fr//archive//d//d6//20161212034849%21Wizards2015.png',
    'East'
  ]
};

Map northwestId = {
  "9": [
    'Denver Nuggets',
    'Nuggets',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//3//35//Nuggets_de_Denver_2018.png//180px-Nuggets_de_Denver_2018.png',
    'West'
  ],
  "22": [
    'Minnesota Timberwolves',
    'Timberwolves',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//d9//Timberwolves_du_Minnesota_logo_2017.png//200px-Timberwolves_du_Minnesota_logo_2017.png',
    'West'
  ],
  "25": [
    'Oklahoma City Thunder',
    'Thunder',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//4//4f//Thunder_d%27Oklahoma_City_logo.svg//1200px-Thunder_d%27Oklahoma_City_logo.svg.png',
    'West'
  ],
  "29": [
    'Portland Trail Blazers',
    'Blazers',
    'https://upload.wikimedia.org//wikipedia//en//thumb//2//21//Portland_Trail_Blazers_logo.svg//1200px-Portland_Trail_Blazers_logo.svg.png',
    'West'
  ],
  "40": [
    'Utah Jazz',
    'Jazz',
    'https://upload.wikimedia.org//wikipedia//fr//3//3b//Jazz_de_l%27Utah_logo.png',
    'West'
  ],
};

Map pacificId = {
  "11": [
    'Golden State Warriors',
    'Warriors',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//de//Warriors_de_Golden_State_logo.svg//1200px-Warriors_de_Golden_State_logo.svg.png',
    'West'
  ],
  "16": [
    'Los Angeles Clippers',
    'Clippers',
    'https://upload.wikimedia.org//wikipedia//fr//d//d6//Los_Angeles_Clippers_logo_2010.png',
    'West'
  ],
  "17": [
    'Los Angeles Lakers',
    'Lakers',
    'https://upload.wikimedia.org//wikipedia//commons//thumb//3//3c//Los_Angeles_Lakers_logo.svg//220px-Los_Angeles_Lakers_logo.svg.png',
    'West'
  ],
  "28": [
    'Phoenix Suns',
    'Suns',
    'https://upload.wikimedia.org//wikipedia//fr//5//56//Phoenix_Suns_2013.png',
    'West'
  ],
  "30": [
    'Sacramento Kings',
    'Kings',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//9//95//Kings_de_Sacramento_logo.svg//1200px-Kings_de_Sacramento_logo.svg.png',
    'West'
  ],
};

Map southwestId = {
  "8": [
    'Dallas Mavericks',
    'Mavericks',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//b//b8//Mavericks_de_Dallas_logo.svg//150px-Mavericks_de_Dallas_logo.svg.png',
    'West'
  ],
  "14": [
    'Houston Rockets',
    'Rockets',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//de//Houston_Rockets_logo_2003.png//330px-Houston_Rockets_logo_2003.png',
    'West'
  ],
  "19": [
    'Memphis Grizzlies',
    'Grizzlies',
    'https://upload.wikimedia.org//wikipedia//en//thumb//f//f1//Memphis_Grizzlies.svg//1200px-Memphis_Grizzlies.svg.png',
    'West'
  ],
  "23": [
    'New Orleans Pelicans',
    'Pelicans',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//2//21//New_Orleans_Pelicans.png//200px-New_Orleans_Pelicans.png',
    'West'
  ],
  "31": [
    'San Antonio Spurs',
    'Spurs',
    'https://upload.wikimedia.org//wikipedia//fr//0//0e//San_Antonio_Spurs_2018.png',
    'West'
  ],
};

// sorted teamIds
List<String> sortedIds = [
  '1',
  '2',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '14',
  '15',
  '16',
  '17',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31',
  '38',
  '40',
  '41',
];

Map allTeams = {
  "1610612737": [
    'Atlanta Hawks',
    'Hawks',
    'https://upload.wikimedia.org//wikipedia//fr//e//ee//Hawks_2016.png',
    'East',
    'ATL',
    '1610612737', //nba team id
    'southeast'
  ],
  "1610612738": [
    'Boston Celtics',
    'Celtics',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//6//65//Celtics_de_Boston_logo.svg//1024px-Celtics_de_Boston_logo.svg.png',
    'East',
    'BOS',
    '1610612738', //nba team id
    'atlantic'
  ],
  "1610612751": [
    'Brooklyn Nets',
    'Nets',
    'https://upload.wikimedia.org//wikipedia//commons//thumb//4//44//Brooklyn_Nets_newlogo.svg//130px-Brooklyn_Nets_newlogo.svg.png',
    'East',
    'BKN',
    '1610612751', //nba team id
    'atlantic'
  ],
  "1610612766": [
    'Charlotte Hornets',
    'Hornets',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//f//f3//Hornets_de_Charlotte_logo.svg//1200px-Hornets_de_Charlotte_logo.svg.png',
    'East',
    'CHA',
    '1610612766', //nba team id
    'southeast'
  ],
  "1610612741": [
    'Chicago Bulls',
    'Bulls',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//d1//Bulls_de_Chicago_logo.svg//1200px-Bulls_de_Chicago_logo.svg.png',
    'East',
    'CHI',
    '1610612741', //nba team id
    'central'
  ],
  "1610612739": [
    'Cleveland Cavaliers',
    'Cavaliers',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//0//06//Cavs_de_Cleveland_logo_2017.png//150px-Cavs_de_Cleveland_logo_2017.png',
    'East',
    'CLE',
    '1610612739', //nba team id
    'central'
  ],
  "1610612765": [
    'Detroit Pistons',
    'Pistons',
    'https://upload.wikimedia.org/wikipedia/commons/6/6a/Detroit_Pistons_primary_logo_2017.png',
    'East',
    'DET',
    '1610612765', //nba team id
    'central'
  ],
  "1610612754": [
    'Indiana Pacers',
    'Pacers',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//c//cf//Pacers_de_l%27Indiana_logo.svg//1180px-Pacers_de_l%27Indiana_logo.svg.png',
    'East',
    'IND',
    '1610612754', //nba team id
    'central'
  ],
  "1610612748": [
    'Miami Heat',
    'Heat',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//1//1c//Miami_Heat_-_Logo.svg//1200px-Miami_Heat_-_Logo.svg.png',
    'East',
    'MIA',
    '1610612748', //nba team id
    'southeast'
  ],
  "1610612749": [
    'Milwaukee Bucks',
    'Bucks',
    'https://upload.wikimedia.org//wikipedia//fr//3//34//Bucks2015.png',
    'East',
    'MIL',
    '1610612749', //nba team id
    'central'
  ],
  "1610612752": [
    'New York Knicks',
    'Knicks',
    'https://upload.wikimedia.org/wikipedia/en/thumb/2/25/New_York_Knicks_logo.svg/1261px-New_York_Knicks_logo.svg.png',
    'East',
    'NYK',
    '1610612752', //nba team id
    'atlantic'
  ],
  "1610612753": [
    'Orlando Magic',
    'Magic',
    'https://upload.wikimedia.org//wikipedia//fr//b//bd//Orlando_Magic_logo_2010.png',
    'East',
    'ORL',
    '1610612753', //nba team id
    'southeast'
  ],
  "1610612755": [
    'Philadelphia 76ers',
    '76ers',
    'https://upload.wikimedia.org//wikipedia//fr//4//48//76ers_2016.png',
    'East',
    'PHI',
    '1610612755', //nba team id
    'atlantic'
  ],
  "1610612761": [
    'Toronto Raptors',
    'Raptors',
    'https://upload.wikimedia.org//wikipedia//fr//8//89//Raptors2015.png',
    'East',
    'TOR',
    '1610612761', //nba team id
    'atlantic'
  ],
  "1610612764": [
    'Washington Wizards',
    'Wizards',
    'https://upload.wikimedia.org//wikipedia//fr//archive//d//d6//20161212034849%21Wizards2015.png',
    'East',
    'WAS',
    '1610612764', //nba team id
    'southeast'
  ],
  "1610612742": [
    'Dallas Mavericks',
    'Mavericks',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//b//b8//Mavericks_de_Dallas_logo.svg//150px-Mavericks_de_Dallas_logo.svg.png',
    'West',
    'DAL',
    '1610612742', //nba team id
    'southwest'
  ],
  "1610612743": [
    'Denver Nuggets',
    'Nuggets',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//3//35//Nuggets_de_Denver_2018.png//180px-Nuggets_de_Denver_2018.png',
    'West',
    'DEN',
    '1610612743', //nba team id
    'northwest'
  ],
  "1610612744": [
    'Golden State Warriors',
    'Warriors',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//de//Warriors_de_Golden_State_logo.svg//1200px-Warriors_de_Golden_State_logo.svg.png',
    'West',
    'GSW',
    '1610612744', //nba team id
    'pacific'
  ],
  "1610612745": [
    'Houston Rockets',
    'Rockets',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//de//Houston_Rockets_logo_2003.png//330px-Houston_Rockets_logo_2003.png',
    'West',
    'HOU',
    '1610612745', //nba team id
    'southwest'
  ],
  "1610612746": [
    'Los Angeles Clippers',
    'Clippers',
    'https://upload.wikimedia.org//wikipedia//fr//d//d6//Los_Angeles_Clippers_logo_2010.png',
    'West',
    'LAC',
    '1610612746', //nba team id
    'pacific'
  ],
  "1610612747": [
    'Los Angeles Lakers',
    'Lakers',
    'https://upload.wikimedia.org//wikipedia//commons//thumb//3//3c//Los_Angeles_Lakers_logo.svg//220px-Los_Angeles_Lakers_logo.svg.png',
    'West',
    'LAL',
    '1610612747', //nba team id
    'pacific'
  ],
  "1610612763": [
    'Memphis Grizzlies',
    'Grizzlies',
    'https://upload.wikimedia.org//wikipedia//en//thumb//f//f1//Memphis_Grizzlies.svg//1200px-Memphis_Grizzlies.svg.png',
    'West',
    'MEM',
    '1610612763', //nba team id
    'southwest'
  ],
  "1610612750": [
    'Minnesota Timberwolves',
    'Timberwolves',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//d//d9//Timberwolves_du_Minnesota_logo_2017.png//200px-Timberwolves_du_Minnesota_logo_2017.png',
    'West',
    'MIN',
    '1610612750', //nba team id
    'northwest'
  ],
  "1610612740": [
    'New Orleans Pelicans',
    'Pelicans',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//2//21//New_Orleans_Pelicans.png//200px-New_Orleans_Pelicans.png',
    'West',
    'NOP',
    '1610612740', //nba team id
    'southwest'
  ],
  "1610612760": [
    'Oklahoma City Thunder',
    'Thunder',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//4//4f//Thunder_d%27Oklahoma_City_logo.svg//1200px-Thunder_d%27Oklahoma_City_logo.svg.png',
    'West',
    'OKC',
    '1610612760', //nba team id
    'northwest'
  ],
  "1610612756": [
    'Phoenix Suns',
    'Suns',
    'https://upload.wikimedia.org//wikipedia//fr//5//56//Phoenix_Suns_2013.png',
    'West',
    'PHX', // changed from 'PHO'... not sure which one is correct
    '1610612756', //nba team id
    'pacific'
  ],
  "1610612757": [
    'Portland Trail Blazers',
    'Blazers',
    'https://upload.wikimedia.org//wikipedia//en//thumb//2//21//Portland_Trail_Blazers_logo.svg//1200px-Portland_Trail_Blazers_logo.svg.png',
    'West',
    'POR',
    '1610612757', //nba team id
    'northwest'
  ],
  "1610612758": [
    'Sacramento Kings',
    'Kings',
    'https://upload.wikimedia.org//wikipedia//fr//thumb//9//95//Kings_de_Sacramento_logo.svg//1200px-Kings_de_Sacramento_logo.svg.png',
    'West',
    'SAC',
    '1610612758', //nba team id
    'pacific'
  ],
  "1610612759": [
    'San Antonio Spurs',
    'Spurs',
    'https://upload.wikimedia.org//wikipedia//fr//0//0e//San_Antonio_Spurs_2018.png',
    'West',
    'SAS',
    '1610612759', //nba team id
    'southwest'
  ],
  "1610612762": [
    'Utah Jazz',
    'Jazz',
    'https://upload.wikimedia.org//wikipedia//fr//3//3b//Jazz_de_l%27Utah_logo.png',
    'West',
    'UTA',
    '1610612762', //nba team id
    'northwest'
  ],
};

class ConstantHelper {
  static String getPeriodText(String period) {
    var periodString = "";

    if (period == "1") {
      periodString = "1st";
    } else if (period == "2") {
      periodString = "2nd";
    } else if (period == "3") {
      periodString = "3rd";
    } else if (period == "4") {
      periodString = "4th";
    } else {
      periodString = "OT";
    }

    return periodString;
  }

  static String getTeamIdByTriCode(String triCode) {
    String teamId = '';
    allTeams.forEach((key, value) {
      if (value[4] == triCode.toUpperCase()) {
        teamId = value[5];
      }
    });
    return teamId;
  }

  static String getTeamName(String teamId) {
    String name = "";
    allTeams.forEach((key, value) {
      if (value[5] == teamId) {
        name = value[0];
      }
    });

    return name;
  }

  static String getTeamLogo(String teamId) {
    String logoUrl = "";
    allTeams.forEach((key, value) {
      if (value[5] == teamId) {
        logoUrl = value[2];
      }
    });

    return logoUrl;
  }

  static String getTeamNumber(String teamId) {
    String number;

    for (int i = 0; i < sortedIds.length; i++) {
      var index = sortedIds[i];
      var t = allTeams[index];
      if (t[5] == teamId) {
        number = index;
        break;
      }
    }

    return number;
  }

  static dynamic getTeamDetailsBasic(String teamId) {
    return allTeams[teamId];
  }

  static dynamic getTeamDetailsAdvanced(String teamId) {
    return teamDetails[teamId];
  }

  static dynamic getTeamDetailsExtra(String teamId) {
    dynamic team;

    for (var t in teamDetailsExtra["teams"]["config"]) {
      if (t["teamId"] == teamId) {
        team = t;
      }
    }

    return team;
  }

  static int getTeamColor(String teamId) {
    if (teamId.trim() != "") {
      dynamic team = ConstantHelper.getTeamDetailsExtra(teamId);
      String primaryColor =
          team["primaryColor"].toString().replaceFirst("#", "FF");
      return int.parse(primaryColor, radix: 16);
    } else
      return null;
  }

  static LinearGradient getTeamColor_Gradient(String teamId, int fanValue) {
    dynamic team = ConstantHelper.getTeamDetailsExtra(teamId);
    String primaryColor =
        team["primaryColor"].toString().replaceFirst("#", "FF");
    var c = int.parse(primaryColor, radix: 16);

    if (fanValue == 0) {
      return LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        stops: [
          0.1,
          0.4,
          0.6,
          0.8,
        ],
        colors: [
          Colors.amber[50],
          Color(c).withOpacity(.3),
          Color(c).withOpacity(.6),
          Color(c).withOpacity(.9),
        ],
      );
    } else if (fanValue == 10) {
      return LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        stops: [
          0.4,
          0.6,
          0.8,
        ],
        colors: [
          Colors.amber[50],
          Color(c).withOpacity(.4),
          Color(c).withOpacity(.8),
        ],
      );
    } else if (fanValue == 20) {
      return LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        stops: [
          0.7,
          0.9,
        ],
        colors: [
          Colors.amber[50],
          Color(c).withOpacity(.7),
        ],
      );
    } else if (fanValue == 40) {
      return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [
          0.7,
          0.9,
        ],
        colors: [
          Colors.amber[50],
          Color(c).withOpacity(.7),
        ],
      );
    } else if (fanValue == 50) {
      return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [
          0.4,
          0.6,
          0.8,
        ],
        colors: [
          Colors.amber[50],
          Color(c).withOpacity(.4),
          Color(c).withOpacity(.8),
        ],
      );
    } else if (fanValue == 60) {
      return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [
          0.1,
          0.4,
          0.6,
          0.8,
        ],
        colors: [
          Colors.amber[50],
          Color(c).withOpacity(.3),
          Color(c).withOpacity(.6),
          Color(c).withOpacity(.9),
        ],
      );
    }
  }

  static Color increaseColorLightness(Color color, double increment) {
    var hslColor = HSLColor.fromColor(color);
    var newValue = min(max(hslColor.lightness + increment, 0.0), 1.0);
    return hslColor.withLightness(newValue).toColor();
  }

  static int getTeamTextColor(String teamId) {
    dynamic team = ConstantHelper.getTeamDetailsExtra(teamId);
    String textColor = team["textColor"].toString().replaceFirst("#", "FF");
    return int.parse(textColor, radix: 16);
  }

  static String getTeamBackgroundImage(String teamId) {
    dynamic team = ConstantHelper.getTeamDetailsExtra(teamId);
    return team["web"]["background-image"];
  }

  static String getTeamTriCode(String teamId) {
    dynamic team = ConstantHelper.getTeamDetailsExtra(teamId);
    return team["tricode"];
  }
}

// This data is loaded via the below url/feed
// https://www.nba.com/stats/feeds/teams/profile/{Team_Id}_TeamProfile.js
Map teamDetails = {
  "1610612737": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612737,
            "Abbreviation": "ATL",
            "Nickname": "Hawks",
            "YearFounded": 1949,
            "YearActiveTill": "present",
            "City": "Atlanta",
            "Arena": "Philips Arena",
            "ArenaCapacity": "18729",
            "Owner": "Tony Ressler",
            "GeneralManager": "Wes Wilcox",
            "HeadCoach": "Mike Budenholzer",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612737,
            "City": "Atlanta",
            "Nickname": "Hawks",
            "YearFounded": 1968,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612737,
            "City": "St. Louis",
            "Nickname": "Hawks",
            "YearFounded": 1955,
            "YearActiveTill": 1967
          },
          {
            "Team_Id": 1610612737,
            "City": "Milwaukee",
            "Nickname": "Hawks",
            "YearFounded": 1951,
            "YearActiveTill": 1954
          },
          {
            "Team_Id": 1610612737,
            "City": "Tri-Cities",
            "Nickname": "Blackhawks",
            "YearFounded": 1949,
            "YearActiveTill": 1950
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/hawks"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://www.instagram.com/atlhawks"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/atlhawks"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1958, "OppositeTeam": "Boston Celtics"}
            ]
          },
          {"ConferenceTitles": []},
          {
            "DivitionalTitles": [
              {"YearAwarded": 1957, "OppositeTeam": null},
              {"YearAwarded": 1958, "OppositeTeam": null},
              {"YearAwarded": 1959, "OppositeTeam": null},
              {"YearAwarded": 1960, "OppositeTeam": null},
              {"YearAwarded": 1961, "OppositeTeam": null},
              {"YearAwarded": 1970, "OppositeTeam": null},
              {"YearAwarded": 1980, "OppositeTeam": null},
              {"YearAwarded": 1987, "OppositeTeam": null},
              {"YearAwarded": 1994, "OppositeTeam": null},
              {"YearAwarded": 2015, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 1122,
            "Player": "Dominique Wilkins",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1983-1994",
            "Year": 2006
          },
          {
            "PlayerID": 77449,
            "Player": "Moses Malone",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1989-1991",
            "Year": 2001
          },
          {
            "PlayerID": 76144,
            "Player": "Walt Bellamy",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1970-1974",
            "Year": 1993
          },
          {
            "PlayerID": 76972,
            "Player": "Connie Hawkins",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1976",
            "Year": 1992
          },
          {
            "PlayerID": 78530,
            "Player": "Lenny Wilkens",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1961-1968",
            "Year": 1989
          },
          {
            "PlayerID": 77414,
            "Player": "Clyde Lovellette",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1959-1962",
            "Year": 1988
          },
          {
            "PlayerID": 77062,
            "Player": "Bob Houbregs",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1954",
            "Year": 1987
          },
          {
            "PlayerID": 77459,
            "Player": "Pete Maravich",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1971-1974",
            "Year": 1987
          },
          {
            "PlayerID": 77480,
            "Player": "Slater Martin",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1957-1960",
            "Year": 1982
          },
          {
            "PlayerID": 76912,
            "Player": "Cliff Hagan",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1957-1966",
            "Year": 1978
          },
          {
            "PlayerID": 77847,
            "Player": "Bob Pettit",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1955-1965",
            "Year": 1971
          },
          {
            "PlayerID": 77429,
            "Player": "Ed Macauley",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1957-1959",
            "Year": 1960
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 2044,
            "Player": "Jason Collier",
            "Position": "C",
            "Jersey": "40",
            "SeasonsWithTeam": "2003-2005",
            "Year": 2005
          },
          {
            "PlayerID": null,
            "Player": "Ted Turner",
            "Position": "Owner",
            "Jersey": "17",
            "SeasonsWithTeam": "1977-2001",
            "Year": 2004
          },
          {
            "PlayerID": 1122,
            "Player": "Dominique Wilkins",
            "Position": "F",
            "Jersey": "21",
            "SeasonsWithTeam": "1983-1994",
            "Year": 2001
          },
          {
            "PlayerID": 77074,
            "Player": "Lou Hudson",
            "Position": "F/G",
            "Jersey": "23",
            "SeasonsWithTeam": "1968-1977",
            "Year": 1977
          },
          {
            "PlayerID": 77847,
            "Player": "Bob Pettit",
            "Position": "F",
            "Jersey": "9",
            "SeasonsWithTeam": "1955-1965",
            "Year": null
          }
        ]
      }
    ]
  },
  "1610612742": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612742,
            "Abbreviation": "DAL",
            "Nickname": "Mavericks",
            "YearFounded": 1980,
            "YearActiveTill": "present",
            "City": "Dallas",
            "Arena": "American Airlines Center",
            "ArenaCapacity": "21041",
            "Owner": "Mark Cuban",
            "GeneralManager": "Donnie Nelson",
            "HeadCoach": "Rick Carlisle",
            "DLeagueAffiliation": "Texas Legends"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612742,
            "City": "Dallas",
            "Nickname": "Mavericks",
            "YearFounded": 1980,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/dallasmavs"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/dallasmavs"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/dallasmavs"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 2011, "OppositeTeam": "Miami Heat"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 2006, "OppositeTeam": null},
              {"YearAwarded": 2011, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1987, "OppositeTeam": null},
              {"YearAwarded": 2007, "OppositeTeam": null},
              {"YearAwarded": 2010, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 23,
            "Player": "Dennis Rodman",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "2000",
            "Year": 2011
          },
          {
            "PlayerID": 76504,
            "Player": "Adrian Dantley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1989-1990",
            "Year": 2008
          },
          {
            "PlayerID": 76673,
            "Player": "Alex English",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1991",
            "Year": 1997
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 76176,
            "Player": "Rolando Blackman",
            "Position": "G",
            "Jersey": "22",
            "SeasonsWithTeam": "1982-1992",
            "Year": 1999
          },
          {
            "PlayerID": 76516,
            "Player": "Brad Davis",
            "Position": "G",
            "Jersey": "15",
            "SeasonsWithTeam": "1981-1992",
            "Year": 1992
          }
        ]
      }
    ]
  },
  "1610612738": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612738,
            "Abbreviation": "BOS",
            "Nickname": "Celtics",
            "YearFounded": 1946,
            "YearActiveTill": "present",
            "City": "Boston",
            "Arena": "TD Garden",
            "ArenaCapacity": "18624",
            "Owner": "Wyc Grousbeck",
            "GeneralManager": "Danny Ainge",
            "HeadCoach": "Brad Stevens",
            "DLeagueAffiliation": "Maine Red Claws"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612738,
            "City": "Boston",
            "Nickname": "Celtics",
            "YearFounded": 1946,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/bostonceltics"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://www.instagram.com/celtics"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/celtics"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1957, "OppositeTeam": "St. Louis Hawks"},
              {"YearAwarded": 1959, "OppositeTeam": "Minneapolis Lakers"},
              {"YearAwarded": 1960, "OppositeTeam": "St. Louis Hawks"},
              {"YearAwarded": 1961, "OppositeTeam": "St. Louis Hawks"},
              {"YearAwarded": 1962, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1963, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1964, "OppositeTeam": "San Francisco Warriors"},
              {"YearAwarded": 1965, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1966, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1968, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1969, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1974, "OppositeTeam": "Milwaukee Bucks"},
              {"YearAwarded": 1976, "OppositeTeam": "Phoenix Suns"},
              {"YearAwarded": 1981, "OppositeTeam": "Houston Rockets"},
              {"YearAwarded": 1984, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1986, "OppositeTeam": "Houston Rockets"},
              {"YearAwarded": 2008, "OppositeTeam": "Los Angeles Lakers"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1974, "OppositeTeam": null},
              {"YearAwarded": 1976, "OppositeTeam": null},
              {"YearAwarded": 1981, "OppositeTeam": null},
              {"YearAwarded": 1984, "OppositeTeam": null},
              {"YearAwarded": 1985, "OppositeTeam": null},
              {"YearAwarded": 1986, "OppositeTeam": null},
              {"YearAwarded": 1987, "OppositeTeam": null},
              {"YearAwarded": 2008, "OppositeTeam": null},
              {"YearAwarded": 2010, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1957, "OppositeTeam": null},
              {"YearAwarded": 1958, "OppositeTeam": null},
              {"YearAwarded": 1959, "OppositeTeam": null},
              {"YearAwarded": 1960, "OppositeTeam": null},
              {"YearAwarded": 1961, "OppositeTeam": null},
              {"YearAwarded": 1962, "OppositeTeam": null},
              {"YearAwarded": 1963, "OppositeTeam": null},
              {"YearAwarded": 1964, "OppositeTeam": null},
              {"YearAwarded": 1965, "OppositeTeam": null},
              {"YearAwarded": 1972, "OppositeTeam": null},
              {"YearAwarded": 1973, "OppositeTeam": null},
              {"YearAwarded": 1974, "OppositeTeam": null},
              {"YearAwarded": 1975, "OppositeTeam": null},
              {"YearAwarded": 1976, "OppositeTeam": null},
              {"YearAwarded": 1980, "OppositeTeam": null},
              {"YearAwarded": 1981, "OppositeTeam": null},
              {"YearAwarded": 1982, "OppositeTeam": null},
              {"YearAwarded": 1984, "OppositeTeam": null},
              {"YearAwarded": 1985, "OppositeTeam": null},
              {"YearAwarded": 1986, "OppositeTeam": null},
              {"YearAwarded": 1987, "OppositeTeam": null},
              {"YearAwarded": 1988, "OppositeTeam": null},
              {"YearAwarded": 1991, "OppositeTeam": null},
              {"YearAwarded": 1992, "OppositeTeam": null},
              {"YearAwarded": 2005, "OppositeTeam": null},
              {"YearAwarded": 2008, "OppositeTeam": null},
              {"YearAwarded": 2009, "OppositeTeam": null},
              {"YearAwarded": 2010, "OppositeTeam": null},
              {"YearAwarded": 2011, "OppositeTeam": null},
              {"YearAwarded": 2012, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 600014,
            "Player": "Artis Gilmore",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1988",
            "Year": 2011
          },
          {
            "PlayerID": 77141,
            "Player": "Dennis Johnson",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1984-1990",
            "Year": 2010
          },
          {
            "PlayerID": 1122,
            "Player": "Dominique Wilkins",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1995",
            "Year": 2006
          },
          {
            "PlayerID": 305,
            "Player": "Robert Parish",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1981-1994",
            "Year": 2003
          },
          {
            "PlayerID": 77498,
            "Player": "Bob McAdoo",
            "Position": "C/F",
            "Jersey": null,
            "SeasonsWithTeam": "1979",
            "Year": 2000
          },
          {
            "PlayerID": 1450,
            "Player": "Kevin McHale",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1981-1993",
            "Year": 1999
          },
          {
            "PlayerID": 77967,
            "Player": "Arnie Risen",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1956-1958",
            "Year": 1998
          },
          {
            "PlayerID": 1449,
            "Player": "Larry Bird",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1980-1992",
            "Year": 1998
          },
          {
            "PlayerID": 77070,
            "Player": "Bailey Howell",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1967-1970",
            "Year": 1997
          },
          {
            "PlayerID": 78450,
            "Player": "Bill Walton",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1986-1987",
            "Year": 1993
          },
          {
            "PlayerID": 76462,
            "Player": "Dave Cowens",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1971-1980",
            "Year": 1991
          },
          {
            "PlayerID": 76054,
            "Player": "Tiny Archibald",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1979-1983",
            "Year": 1991
          },
          {
            "PlayerID": 76166,
            "Player": "Dave Bing",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1978",
            "Year": 1990
          },
          {
            "PlayerID": 77188,
            "Player": "K.C. Jones",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1959-1967",
            "Year": 1989
          },
          {
            "PlayerID": 77414,
            "Player": "Clyde Lovellette",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1963-1964",
            "Year": 1988
          },
          {
            "PlayerID": 77062,
            "Player": "Bob Houbregs",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1955",
            "Year": 1987
          },
          {
            "PlayerID": 77459,
            "Player": "Pete Maravich",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1980",
            "Year": 1987
          },
          {
            "PlayerID": 76988,
            "Player": "Tom Heinsohn",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1957-1965",
            "Year": 1986
          },
          {
            "PlayerID": 76970,
            "Player": "John Havlicek",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1963-1978",
            "Year": 1984
          },
          {
            "PlayerID": 77196,
            "Player": "Sam Jones",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1958-1969",
            "Year": 1984
          },
          {
            "PlayerID": 77907,
            "Player": "Frank Ramsey",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1955-1964",
            "Year": 1982
          },
          {
            "PlayerID": 78126,
            "Player": "Bill Sharman",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1952-1961",
            "Year": 1976
          },
          {
            "PlayerID": 78049,
            "Player": "Bill Russell",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1957-1969",
            "Year": 1975
          },
          {
            "PlayerID": 600003,
            "Player": "Bob Cousy",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1951-1963",
            "Year": 1971
          },
          {
            "PlayerID": 77853,
            "Player": "Andy Phillip",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1957-1958",
            "Year": 1961
          },
          {
            "PlayerID": 77429,
            "Player": "Ed Macauley",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1951-1956",
            "Year": 1960
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 77487,
            "Player": "Cedric Maxwell",
            "Position": "F",
            "Jersey": "31",
            "SeasonsWithTeam": "1978-1985",
            "Year": 2003
          },
          {
            "PlayerID": 305,
            "Player": "Robert Parish",
            "Position": "C",
            "Jersey": "00",
            "SeasonsWithTeam": "1981-1994",
            "Year": 1998
          },
          {
            "PlayerID": 1450,
            "Player": "Kevin McHale",
            "Position": "F",
            "Jersey": "32",
            "SeasonsWithTeam": "1981-1993",
            "Year": 1994
          },
          {
            "PlayerID": 1449,
            "Player": "Larry Bird",
            "Position": "F",
            "Jersey": "33",
            "SeasonsWithTeam": "1980-1992",
            "Year": 1993
          },
          {
            "PlayerID": 77141,
            "Player": "Dennis Johnson",
            "Position": "G",
            "Jersey": "3",
            "SeasonsWithTeam": "1984-1990",
            "Year": 1991
          },
          {
            "PlayerID": null,
            "Player": "Johnny Most",
            "Position": "Broadcaster",
            "Jersey": " ",
            "SeasonsWithTeam": "1953-1990",
            "Year": 1990
          },
          {
            "PlayerID": 77384,
            "Player": "Reggie Lewis",
            "Position": "F",
            "Jersey": "35",
            "SeasonsWithTeam": "1988-1993",
            "Year": 1990
          },
          {
            "PlayerID": null,
            "Player": "Red Auerbach",
            "Position": "Head Coach, Executive",
            "Jersey": "2",
            "SeasonsWithTeam": "1950-2006",
            "Year": 1985
          },
          {
            "PlayerID": 78510,
            "Player": "Jo Jo White",
            "Position": "G",
            "Jersey": "10",
            "SeasonsWithTeam": "1969-1979",
            "Year": 1982
          },
          {
            "PlayerID": 76462,
            "Player": "Dave Cowens",
            "Position": "C",
            "Jersey": "18",
            "SeasonsWithTeam": "1971-1980",
            "Year": 1981
          },
          {
            "PlayerID": 77700,
            "Player": "Don Nelson",
            "Position": "F",
            "Jersey": "19",
            "SeasonsWithTeam": "1966-1976",
            "Year": 1978
          },
          {
            "PlayerID": 76970,
            "Player": "John Havlicek",
            "Position": "F",
            "Jersey": "17",
            "SeasonsWithTeam": "1963-1978",
            "Year": 1978
          },
          {
            "PlayerID": 78060,
            "Player": "Satch Sanders",
            "Position": "F",
            "Jersey": "16",
            "SeasonsWithTeam": "1961-1973",
            "Year": 1973
          },
          {
            "PlayerID": 78049,
            "Player": "Bill Russell",
            "Position": "C",
            "Jersey": "6",
            "SeasonsWithTeam": "1956-1969",
            "Year": 1972
          },
          {
            "PlayerID": 77196,
            "Player": "Sam Jones",
            "Position": "G",
            "Jersey": "24",
            "SeasonsWithTeam": "1958-1969",
            "Year": 1969
          },
          {
            "PlayerID": 77188,
            "Player": "K.C. Jones",
            "Position": "G",
            "Jersey": "25",
            "SeasonsWithTeam": "1959-1967",
            "Year": 1967
          },
          {
            "PlayerID": 78126,
            "Player": "Bill Sharman",
            "Position": "G",
            "Jersey": "21",
            "SeasonsWithTeam": "1952-1961",
            "Year": 1966
          },
          {
            "PlayerID": 76988,
            "Player": "Tom Heinsohn",
            "Position": "F",
            "Jersey": "15",
            "SeasonsWithTeam": "1957-1965",
            "Year": 1966
          },
          {
            "PlayerID": 77409,
            "Player": "Jim \"Loscy\" Loscutoff",
            "Position": "F",
            "Jersey": "LOSCY",
            "SeasonsWithTeam": "1956-1964",
            "Year": 1964
          },
          {
            "PlayerID": null,
            "Player": "Walter Brown",
            "Position": "Owner",
            "Jersey": "1",
            "SeasonsWithTeam": "1946-1964",
            "Year": 1964
          },
          {
            "PlayerID": 600003,
            "Player": "Bob Cousy",
            "Position": "G",
            "Jersey": "14",
            "SeasonsWithTeam": "1951-1963",
            "Year": 1963
          },
          {
            "PlayerID": 77429,
            "Player": "Ed Macauley",
            "Position": "C",
            "Jersey": "22",
            "SeasonsWithTeam": "1951-1956",
            "Year": 1963
          },
          {
            "PlayerID": 77907,
            "Player": "Frank Ramsey",
            "Position": "F",
            "Jersey": "23",
            "SeasonsWithTeam": "1955-1964",
            "Year": null
          }
        ]
      }
    ]
  },
  "1610612751": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612751,
            "Abbreviation": "BKN",
            "Nickname": "Nets",
            "YearFounded": 1976,
            "YearActiveTill": "present",
            "City": "Brooklyn",
            "Arena": "Barclays Center",
            "ArenaCapacity": "18103",
            "Owner": "Mikhail Prokhorov",
            "GeneralManager": "Sean Marks",
            "HeadCoach": "Tony Brown",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612751,
            "City": "Brooklyn",
            "Nickname": "Nets",
            "YearFounded": 2012,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612751,
            "City": "New Jersey",
            "Nickname": "Nets",
            "YearFounded": 1977,
            "YearActiveTill": 2011
          },
          {
            "Team_Id": 1610612751,
            "City": "New York",
            "Nickname": "Nets",
            "YearFounded": 1976,
            "YearActiveTill": 1976
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/BrooklynNets"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/brooklynnets"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/brooklynnets"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {
            "ConferenceTitles": [
              {"YearAwarded": 2002, "OppositeTeam": null},
              {"YearAwarded": 2003, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 2002, "OppositeTeam": null},
              {"YearAwarded": 2003, "OppositeTeam": null},
              {"YearAwarded": 2004, "OppositeTeam": null},
              {"YearAwarded": 2006, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 76502,
            "Player": "Mel Daniels",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1977",
            "Year": 2012
          },
          {
            "PlayerID": 77845,
            "Player": "Drazen Petrovic",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1991-1993",
            "Year": 2002
          },
          {
            "PlayerID": 77498,
            "Player": "Bob McAdoo",
            "Position": "C/F",
            "Jersey": null,
            "SeasonsWithTeam": "1981",
            "Year": 2000
          },
          {
            "PlayerID": 76681,
            "Player": "Julius Erving",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1974-1976",
            "Year": 1993
          },
          {
            "PlayerID": 76054,
            "Player": "Tiny Archibald",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1977",
            "Year": 1991
          },
          {
            "PlayerID": 600013,
            "Player": "Rick Barry",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1971-1972",
            "Year": 1987
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 433,
            "Player": "Buck Williams",
            "Position": "F",
            "Jersey": "52",
            "SeasonsWithTeam": "1982-1989",
            "Year": 1999
          },
          {
            "PlayerID": 77845,
            "Player": "Drazen Petrovic",
            "Position": "G",
            "Jersey": "3",
            "SeasonsWithTeam": "1991-1993",
            "Year": 1993
          },
          {
            "PlayerID": 78575,
            "Player": "John Williamson",
            "Position": "G",
            "Jersey": "23",
            "SeasonsWithTeam": "1974-1980",
            "Year": 1990
          },
          {
            "PlayerID": 76681,
            "Player": "Julius Erving",
            "Position": "F",
            "Jersey": "32",
            "SeasonsWithTeam": "1974-1976",
            "Year": 1987
          },
          {
            "PlayerID": 77576,
            "Player": "Bill Melchionni",
            "Position": "G",
            "Jersey": "25",
            "SeasonsWithTeam": "1970-1976",
            "Year": 1976
          },
          {
            "PlayerID": null,
            "Player": "Wendell Ladner",
            "Position": "F",
            "Jersey": "4",
            "SeasonsWithTeam": "1975",
            "Year": 1975
          }
        ]
      }
    ]
  },
  "1610612766": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612766,
            "Abbreviation": "CHA",
            "Nickname": "Hornets",
            "YearFounded": 1988,
            "YearActiveTill": "present",
            "City": "Charlotte",
            "Arena": "Time Warner Cable Arena",
            "ArenaCapacity": "18103",
            "Owner": "Michael Jordan",
            "GeneralManager": "Rich Cho",
            "HeadCoach": "Steve Clifford",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612766,
            "City": "Charlotte",
            "Nickname": "Hornets",
            "YearFounded": 2014,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612766,
            "City": "Charlotte",
            "Nickname": "Bobcats",
            "YearFounded": 2004,
            "YearActiveTill": 2013
          },
          {
            "Team_Id": 1610612766,
            "City": "Charlotte",
            "Nickname": "Hornets",
            "YearFounded": 1988,
            "YearActiveTill": 2001
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/bobcats"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/charlottebobcats"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://www.twitter.com/bobcats"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {"ConferenceTitles": []},
          {"DivitionalTitles": []}
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 305,
            "Player": "Robert Parish",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1995-1996",
            "Year": 2003
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 77459,
            "Player": "Pete Maravich",
            "Position": "G",
            "Jersey": "7",
            "SeasonsWithTeam": null,
            "Year": 2002
          },
          {
            "PlayerID": 184,
            "Player": "Bobby Phills",
            "Position": "G",
            "Jersey": "13",
            "SeasonsWithTeam": "1998-2000",
            "Year": 2000
          }
        ]
      }
    ]
  },
  "1610612741": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612741,
            "Abbreviation": "CHI",
            "Nickname": "Bulls",
            "YearFounded": 1966,
            "YearActiveTill": "present",
            "City": "Chicago",
            "Arena": "United Center",
            "ArenaCapacity": "21711",
            "Owner": "Jerry Reinsdorf",
            "GeneralManager": "Gar Forman",
            "HeadCoach": "Fred Hoiberg",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612741,
            "City": "Chicago",
            "Nickname": "Bulls",
            "YearFounded": 1966,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/chicagobulls"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/chicagobulls"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/chicagobulls"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1991, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1992, "OppositeTeam": "Portland Trail Blazers"},
              {"YearAwarded": 1993, "OppositeTeam": "Phoenix Suns"},
              {"YearAwarded": 1996, "OppositeTeam": "Seattle SuperSonics"},
              {"YearAwarded": 1997, "OppositeTeam": "Utah Jazz"},
              {"YearAwarded": 1998, "OppositeTeam": "Utah Jazz"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1991, "OppositeTeam": null},
              {"YearAwarded": 1992, "OppositeTeam": null},
              {"YearAwarded": 1993, "OppositeTeam": null},
              {"YearAwarded": 1996, "OppositeTeam": null},
              {"YearAwarded": 1997, "OppositeTeam": null},
              {"YearAwarded": 1998, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1975, "OppositeTeam": null},
              {"YearAwarded": 1991, "OppositeTeam": null},
              {"YearAwarded": 1992, "OppositeTeam": null},
              {"YearAwarded": 1993, "OppositeTeam": null},
              {"YearAwarded": 1996, "OppositeTeam": null},
              {"YearAwarded": 1997, "OppositeTeam": null},
              {"YearAwarded": 1998, "OppositeTeam": null},
              {"YearAwarded": 2011, "OppositeTeam": null},
              {"YearAwarded": 2012, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 78435,
            "Player": "Chet Walker",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1970-1975",
            "Year": 2012
          },
          {
            "PlayerID": 600014,
            "Player": "Artis Gilmore",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1977-1982, 1988",
            "Year": 2011
          },
          {
            "PlayerID": 23,
            "Player": "Dennis Rodman",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1996-1998",
            "Year": 2011
          },
          {
            "PlayerID": 937,
            "Player": "Scottie Pippen",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1988-1998, 2004",
            "Year": 2010
          },
          {
            "PlayerID": 893,
            "Player": "Michael Jordan",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1985-1993, 1995-1998",
            "Year": 2009
          },
          {
            "PlayerID": 76804,
            "Player": "George Gervin",
            "Position": "G/F",
            "Jersey": null,
            "SeasonsWithTeam": "1986",
            "Year": 1996
          },
          {
            "PlayerID": 600001,
            "Player": "Nate Thurmond",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1975-1976",
            "Year": 1985
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 937,
            "Player": "Scottie Pippen",
            "Position": "F",
            "Jersey": "33",
            "SeasonsWithTeam": "1988-1998, 2004",
            "Year": 2005
          },
          {
            "PlayerID": null,
            "Player": "Jerry Krause",
            "Position": "General Manager",
            "Jersey": " ",
            "SeasonsWithTeam": "1985-2003",
            "Year": 2003
          },
          {
            "PlayerID": 77106,
            "Player": "Phil Jackson",
            "Position": "Coach",
            "Jersey": " ",
            "SeasonsWithTeam": "1988-1998",
            "Year": 1999
          },
          {
            "PlayerID": 77412,
            "Player": "Bob Love",
            "Position": "F",
            "Jersey": "10",
            "SeasonsWithTeam": "1969-1977",
            "Year": 1994
          },
          {
            "PlayerID": 893,
            "Player": "Michael Jordan",
            "Position": "G",
            "Jersey": "23",
            "SeasonsWithTeam": "1985-1993, 1995-1998",
            "Year": 1994
          },
          {
            "PlayerID": 78173,
            "Player": "Jerry Sloan",
            "Position": "G",
            "Jersey": "4",
            "SeasonsWithTeam": "1967-1976",
            "Year": 1978
          },
          {
            "PlayerID": null,
            "Player": "Johny Kerr",
            "Position": "Coach, Business Manager, Broadcaster",
            "Jersey": " ",
            "SeasonsWithTeam": "1966-2009",
            "Year": null
          }
        ]
      }
    ]
  },
  "1610612739": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612739,
            "Abbreviation": "CLE",
            "Nickname": "Cavaliers",
            "YearFounded": 1970,
            "YearActiveTill": "present",
            "City": "Cleveland",
            "Arena": "Quicken Loans Arena",
            "ArenaCapacity": "20562",
            "Owner": "Dan Gilbert",
            "GeneralManager": "David Griffin",
            "HeadCoach": "Tyronn Lue",
            "DLeagueAffiliation": "Canton Charge"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612739,
            "City": "Cleveland",
            "Nickname": "Cavaliers",
            "YearFounded": 1970,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/Cavs"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/cavs"
          },
          {"AccountType": "Twitter", "WebSite_Link": "http://twitter.com/cavs"}
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {
            "ConferenceTitles": [
              {"YearAwarded": 2007, "OppositeTeam": null},
              {"YearAwarded": 2015, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1976, "OppositeTeam": null},
              {"YearAwarded": 2009, "OppositeTeam": null},
              {"YearAwarded": 2010, "OppositeTeam": null},
              {"YearAwarded": 2015, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 78530,
            "Player": "Lenny Wilkens",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1973-1974",
            "Year": 1989
          },
          {
            "PlayerID": 76750,
            "Player": "Walt Frazier",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1978-1980",
            "Year": 1987
          },
          {
            "PlayerID": 600001,
            "Player": "Nate Thurmond",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1976-1977",
            "Year": 1985
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 899,
            "Player": "Mark Price",
            "Position": "G",
            "Jersey": "25",
            "SeasonsWithTeam": "1987-1995",
            "Year": 1999
          },
          {
            "PlayerID": 921,
            "Player": "Brad Daugherty",
            "Position": "C",
            "Jersey": "43",
            "SeasonsWithTeam": "1987-1994",
            "Year": 1997
          },
          {
            "PlayerID": 77685,
            "Player": "Larry Nance",
            "Position": "F",
            "Jersey": "22",
            "SeasonsWithTeam": "1989-1994",
            "Year": 1995
          },
          {
            "PlayerID": 76348,
            "Player": "Austin Carr",
            "Position": "G",
            "Jersey": "34",
            "SeasonsWithTeam": "1972-1980",
            "Year": 1981
          },
          {
            "PlayerID": 78202,
            "Player": "Bingo Smith",
            "Position": "F",
            "Jersey": "7",
            "SeasonsWithTeam": "1971-1979",
            "Year": 1979
          },
          {
            "PlayerID": 600001,
            "Player": "Nate Thurmond",
            "Position": "C",
            "Jersey": "42",
            "SeasonsWithTeam": "1976-1977",
            "Year": 1977
          }
        ]
      }
    ]
  },
  "1610612743": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612743,
            "Abbreviation": "DEN",
            "Nickname": "Nuggets",
            "YearFounded": 1976,
            "YearActiveTill": "present",
            "City": "Denver",
            "Arena": "Pepsi Center",
            "ArenaCapacity": "19099",
            "Owner": "Stan Kroenke",
            "GeneralManager": "Tim Connelly",
            "HeadCoach": "Mike Malone",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612743,
            "City": "Denver",
            "Nickname": "Nuggets",
            "YearFounded": 1976,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/DenverNuggets"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/denvernuggets"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/denvernuggets"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {"ConferenceTitles": []},
          {
            "DivitionalTitles": [
              {"YearAwarded": 1977, "OppositeTeam": null},
              {"YearAwarded": 1978, "OppositeTeam": null},
              {"YearAwarded": 1985, "OppositeTeam": null},
              {"YearAwarded": 1988, "OppositeTeam": null},
              {"YearAwarded": 2006, "OppositeTeam": null},
              {"YearAwarded": 2009, "OppositeTeam": null},
              {"YearAwarded": 2010, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 76673,
            "Player": "Alex English",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1980-1990",
            "Year": 1997
          },
          {
            "PlayerID": 78326,
            "Player": "David Thompson",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1976-1982",
            "Year": 1996
          },
          {
            "PlayerID": 77097,
            "Player": "Dan Issel",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1976-1985",
            "Year": 1993
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": null,
            "Player": "Doug Moe",
            "Position": "Coach",
            "Jersey": "432",
            "SeasonsWithTeam": "1981-1990",
            "Year": 2002
          },
          {
            "PlayerID": 76673,
            "Player": "Alex English",
            "Position": "F",
            "Jersey": "2",
            "SeasonsWithTeam": "1980-1990",
            "Year": 1993
          },
          {
            "PlayerID": 78326,
            "Player": "David Thompson",
            "Position": "F/G",
            "Jersey": "33",
            "SeasonsWithTeam": "1976-1982",
            "Year": 1992
          },
          {
            "PlayerID": 77097,
            "Player": "Dan Issel",
            "Position": "C/F",
            "Jersey": "44",
            "SeasonsWithTeam": "1976-1985",
            "Year": 1985
          },
          {
            "PlayerID": 76134,
            "Player": "Byron Beck",
            "Position": "F/C",
            "Jersey": "40",
            "SeasonsWithTeam": "1968-1977",
            "Year": 1977
          }
        ]
      }
    ]
  },
  "1610612765": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612765,
            "Abbreviation": "DET",
            "Nickname": "Pistons",
            "YearFounded": 1948,
            "YearActiveTill": "present",
            "City": "Detroit",
            "Arena": "The Palace of Auburn Hills",
            "ArenaCapacity": "22076",
            "Owner": "Tom Gores",
            "GeneralManager": "Jeff Bower",
            "HeadCoach": "Stan Van Gundy",
            "DLeagueAffiliation": "Grand Rapids Drive"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612765,
            "City": "Detroit",
            "Nickname": "Pistons",
            "YearFounded": 1957,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612765,
            "City": "Ft. Wayne Zollner",
            "Nickname": "Pistons",
            "YearFounded": 1948,
            "YearActiveTill": 1956
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/detroitpistons"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/detroitpistons"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/detroitpistons"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1989, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1990, "OppositeTeam": "Portland Trail Blazers"},
              {"YearAwarded": 2004, "OppositeTeam": "Los Angeles Lakers"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1988, "OppositeTeam": null},
              {"YearAwarded": 1989, "OppositeTeam": null},
              {"YearAwarded": 1990, "OppositeTeam": null},
              {"YearAwarded": 2004, "OppositeTeam": null},
              {"YearAwarded": 2005, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1955, "OppositeTeam": null},
              {"YearAwarded": 1956, "OppositeTeam": null},
              {"YearAwarded": 1988, "OppositeTeam": null},
              {"YearAwarded": 1989, "OppositeTeam": null},
              {"YearAwarded": 1990, "OppositeTeam": null},
              {"YearAwarded": 2002, "OppositeTeam": null},
              {"YearAwarded": 2003, "OppositeTeam": null},
              {"YearAwarded": 2005, "OppositeTeam": null},
              {"YearAwarded": 2006, "OppositeTeam": null},
              {"YearAwarded": 2007, "OppositeTeam": null},
              {"YearAwarded": 2008, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 23,
            "Player": "Dennis Rodman",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1987-1993",
            "Year": 2011
          },
          {
            "PlayerID": 76504,
            "Player": "Adrian Dantley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1987-1989",
            "Year": 2008
          },
          {
            "PlayerID": 247,
            "Player": "Joe Dumars",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1986-1996",
            "Year": 2006
          },
          {
            "PlayerID": 77498,
            "Player": "Bob McAdoo",
            "Position": "C/F",
            "Jersey": null,
            "SeasonsWithTeam": "1980-1981",
            "Year": 2000
          },
          {
            "PlayerID": 202738,
            "Player": "Isiah Thomas",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1982-1994",
            "Year": 2000
          },
          {
            "PlayerID": 77070,
            "Player": "Bailey Howell",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1961-1964",
            "Year": 1997
          },
          {
            "PlayerID": 78628,
            "Player": "George Yardley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1954-1959",
            "Year": 1996
          },
          {
            "PlayerID": 77537,
            "Player": "Dick McGuire",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1959-1960",
            "Year": 1993
          },
          {
            "PlayerID": 76144,
            "Player": "Walt Bellamy",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1969-1970",
            "Year": 1993
          },
          {
            "PlayerID": 600005,
            "Player": "Bob Lanier",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1971-1980",
            "Year": 1992
          },
          {
            "PlayerID": 76166,
            "Player": "Dave Bing",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1967-1975",
            "Year": 1990
          },
          {
            "PlayerID": 77062,
            "Player": "Bob Houbregs",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1955-1958",
            "Year": 1987
          },
          {
            "PlayerID": 76545,
            "Player": "Dave DeBusschere",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1963-1969",
            "Year": 1983
          },
          {
            "PlayerID": 77853,
            "Player": "Andy Phillip",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1953-1956",
            "Year": 1961
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 77512,
            "Player": "Jack McCloskey",
            "Position": "General Manager",
            "Jersey": " ",
            "SeasonsWithTeam": "1980-1992",
            "Year": 2008
          },
          {
            "PlayerID": 247,
            "Player": "Joe Dumars",
            "Position": "G",
            "Jersey": "4",
            "SeasonsWithTeam": "1986-1996",
            "Year": 2000
          },
          {
            "PlayerID": null,
            "Player": "Chuck Daly",
            "Position": "Coach",
            "Jersey": "2",
            "SeasonsWithTeam": "1984-1992",
            "Year": 1997
          },
          {
            "PlayerID": 202738,
            "Player": "Isiah Thomas",
            "Position": "G",
            "Jersey": "11",
            "SeasonsWithTeam": "1982-1994",
            "Year": 1996
          },
          {
            "PlayerID": 100263,
            "Player": "Bill Lambieer",
            "Position": "C",
            "Jersey": "40",
            "SeasonsWithTeam": "1983-1994",
            "Year": 1995
          },
          {
            "PlayerID": 77167,
            "Player": "Vinnie Johnson",
            "Position": "G",
            "Jersey": "15",
            "SeasonsWithTeam": "1982-1991",
            "Year": 1994
          },
          {
            "PlayerID": 600005,
            "Player": "Bob Lanier",
            "Position": "C",
            "Jersey": "16",
            "SeasonsWithTeam": "1971-1980",
            "Year": 1993
          },
          {
            "PlayerID": 76166,
            "Player": "Dave Bing",
            "Position": "G",
            "Jersey": "21",
            "SeasonsWithTeam": "1967-1975",
            "Year": 1983
          },
          {
            "PlayerID": 23,
            "Player": "Dennis Rodman",
            "Position": "F",
            "Jersey": "10",
            "SeasonsWithTeam": "1987-1993",
            "Year": null
          },
          {
            "PlayerID": null,
            "Player": "William Davidson",
            "Position": "Owner",
            "Jersey": " ",
            "SeasonsWithTeam": "1975-2009",
            "Year": null
          }
        ]
      }
    ]
  },
  "1610612744": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612744,
            "Abbreviation": "GSW",
            "Nickname": "Warriors",
            "YearFounded": 1946,
            "YearActiveTill": "present",
            "City": "Golden State",
            "Arena": "Oracle Arena",
            "ArenaCapacity": "19596",
            "Owner": "Joe Lacob",
            "GeneralManager": "Bob Myers",
            "HeadCoach": "Steve Kerr",
            "DLeagueAffiliation": "Santa Cruz Warriors"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612744,
            "City": "Golden State",
            "Nickname": "Warriors",
            "YearFounded": 1971,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612744,
            "City": "San Francisco",
            "Nickname": "Warriors",
            "YearFounded": 1962,
            "YearActiveTill": 1970
          },
          {
            "Team_Id": 1610612744,
            "City": "Philadelphia",
            "Nickname": "Warriors",
            "YearFounded": 1946,
            "YearActiveTill": 1961
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/goldenstatewarriors"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/officialwarriors"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/warriors"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1947, "OppositeTeam": "Chicago Stags"},
              {"YearAwarded": 1956, "OppositeTeam": "Fort Wayne Pistons"},
              {"YearAwarded": 1975, "OppositeTeam": "Washington Bullets"},
              {"YearAwarded": 2015, "OppositeTeam": "Cleveland Cavaliers"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1975, "OppositeTeam": null},
              {"YearAwarded": 2015, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1948, "OppositeTeam": null},
              {"YearAwarded": 1951, "OppositeTeam": null},
              {"YearAwarded": 1956, "OppositeTeam": null},
              {"YearAwarded": 1964, "OppositeTeam": null},
              {"YearAwarded": 1967, "OppositeTeam": null},
              {"YearAwarded": 1968, "OppositeTeam": null},
              {"YearAwarded": 1975, "OppositeTeam": null},
              {"YearAwarded": 1976, "OppositeTeam": null},
              {"YearAwarded": 2015, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 78532,
            "Player": "Jamaal Wilkes",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1975-1977",
            "Year": 2012
          },
          {
            "PlayerID": 78055,
            "Player": "Ralph Sampson",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1988-1989",
            "Year": 2012
          },
          {
            "PlayerID": 904,
            "Player": "Chris Mullin",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1986-1997, 2001",
            "Year": 2011
          },
          {
            "PlayerID": 305,
            "Player": "Robert Parish",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1977-1980",
            "Year": 2003
          },
          {
            "PlayerID": 77169,
            "Player": "Neil Johnston",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1952-1959",
            "Year": 1990
          },
          {
            "PlayerID": 600013,
            "Player": "Rick Barry",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1966-1967, 1973-1978",
            "Year": 1987
          },
          {
            "PlayerID": 600001,
            "Player": "Nate Thurmond",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1964-1974",
            "Year": 1985
          },
          {
            "PlayerID": 77418,
            "Player": "Jerry Lucas",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1970-1971",
            "Year": 1980
          },
          {
            "PlayerID": 76375,
            "Player": "Wilt Chamberlain",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1960-1965",
            "Year": 1979
          },
          {
            "PlayerID": 76764,
            "Player": "Joe Fulks",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1947-1954",
            "Year": 1978
          },
          {
            "PlayerID": 76056,
            "Player": "Paul Arizin",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1951-1952, 1955-1962",
            "Year": 1978
          },
          {
            "PlayerID": 76828,
            "Player": "Tom Gola",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1956, 1958-1963",
            "Year": 1976
          },
          {
            "PlayerID": 77853,
            "Player": "Andy Phillip",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1951-1953",
            "Year": 1961
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 904,
            "Player": "Chris Mullin",
            "Position": "G/F",
            "Jersey": "17",
            "SeasonsWithTeam": "1986-1997, 2001",
            "Year": 2012
          },
          {
            "PlayerID": 76375,
            "Player": "Wilt Chamberlain",
            "Position": "C",
            "Jersey": "13",
            "SeasonsWithTeam": "1960-1965",
            "Year": 1999
          },
          {
            "PlayerID": 600013,
            "Player": "Rick Barry",
            "Position": "F",
            "Jersey": "24",
            "SeasonsWithTeam": "1966-1967, 1973-1978",
            "Year": 1988
          },
          {
            "PlayerID": 600001,
            "Player": "Nate Thurmond",
            "Position": "C",
            "Jersey": "42",
            "SeasonsWithTeam": "1964-1974",
            "Year": 1978
          },
          {
            "PlayerID": 76070,
            "Player": "Alvin Attles",
            "Position": "G",
            "Jersey": "16",
            "SeasonsWithTeam": "1961-1971",
            "Year": 1977
          },
          {
            "PlayerID": 77584,
            "Player": "Tom Meschery",
            "Position": "F",
            "Jersey": "14",
            "SeasonsWithTeam": "1962-1971",
            "Year": 1967
          }
        ]
      }
    ]
  },
  "1610612745": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612745,
            "Abbreviation": "HOU",
            "Nickname": "Rockets",
            "YearFounded": 1967,
            "YearActiveTill": "present",
            "City": "Houston",
            "Arena": "Toyota Center",
            "ArenaCapacity": "18300",
            "Owner": "Leslie Alexander",
            "GeneralManager": "Daryl Morey",
            "HeadCoach": "J.B. Bickerstaff",
            "DLeagueAffiliation": "Rio Grande Valley Vipers"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612745,
            "City": "Houston",
            "Nickname": "Rockets",
            "YearFounded": 1971,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612745,
            "City": "San Diego",
            "Nickname": "Rockets",
            "YearFounded": 1967,
            "YearActiveTill": 1970
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/houstonrockets"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/houstonrocketsnba"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/houstonrockets"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1994, "OppositeTeam": "New York Knicks"},
              {"YearAwarded": 1995, "OppositeTeam": "Orlando Magic"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1981, "OppositeTeam": null},
              {"YearAwarded": 1986, "OppositeTeam": null},
              {"YearAwarded": 1994, "OppositeTeam": null},
              {"YearAwarded": 1995, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1977, "OppositeTeam": null},
              {"YearAwarded": 1986, "OppositeTeam": null},
              {"YearAwarded": 1993, "OppositeTeam": null},
              {"YearAwarded": 1994, "OppositeTeam": null},
              {"YearAwarded": 2015, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 78055,
            "Player": "Ralph Sampson",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1984-1988",
            "Year": 2012
          },
          {
            "PlayerID": 165,
            "Player": "Hakeem Olajuwon",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1985-2001",
            "Year": 2008
          },
          {
            "PlayerID": 787,
            "Player": "Charles Barkley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1997-2000",
            "Year": 2006
          },
          {
            "PlayerID": 17,
            "Player": "Clyde Drexler",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1995-1998",
            "Year": 2004
          },
          {
            "PlayerID": 77449,
            "Player": "Moses Malone",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1977-1982",
            "Year": 2001
          },
          {
            "PlayerID": 77669,
            "Player": "Calvin Murphy",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1971-1983",
            "Year": 1993
          },
          {
            "PlayerID": 76979,
            "Player": "Elvin Hayes",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1969-1972, 1982-1984",
            "Year": 1990
          },
          {
            "PlayerID": 600013,
            "Player": "Rick Barry",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1979-1980",
            "Year": 1987
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 165,
            "Player": "Hakeem Olajuwon",
            "Position": "C",
            "Jersey": "34",
            "SeasonsWithTeam": "1985-2001",
            "Year": 2002
          },
          {
            "PlayerID": 17,
            "Player": "Clyde Drexler",
            "Position": "G",
            "Jersey": "22",
            "SeasonsWithTeam": "1995-1998",
            "Year": 2000
          },
          {
            "PlayerID": 77449,
            "Player": "Moses Malone",
            "Position": "C",
            "Jersey": "24",
            "SeasonsWithTeam": "1977-1982",
            "Year": 1998
          },
          {
            "PlayerID": 77669,
            "Player": "Calvin Murphy",
            "Position": "G",
            "Jersey": "23",
            "SeasonsWithTeam": "1971-1983",
            "Year": 1984
          },
          {
            "PlayerID": 78350,
            "Player": "Rudy Tomjanovich",
            "Position": "F",
            "Jersey": "45",
            "SeasonsWithTeam": "1971-1981",
            "Year": 1982
          },
          {
            "PlayerID": null,
            "Player": "Carroll Dawson",
            "Position": "Assistant Coach, General Manager",
            "Jersey": " ",
            "SeasonsWithTeam": "1980-2007",
            "Year": null
          }
        ]
      }
    ]
  },
  "1610612754": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612754,
            "Abbreviation": "IND",
            "Nickname": "Pacers",
            "YearFounded": 1976,
            "YearActiveTill": "present",
            "City": "Indiana",
            "Arena": "Bankers Life Fieldhouse",
            "ArenaCapacity": "18165",
            "Owner": "Herb Simon",
            "GeneralManager": "Kevin Pritchard",
            "HeadCoach": "Frank Vogel",
            "DLeagueAffiliation": "Fort Wayne Mad Ants"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612754,
            "City": "Indiana",
            "Nickname": "Pacers",
            "YearFounded": 1976,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/pacers"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/thepacers"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/pacers"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {
            "ConferenceTitles": [
              {"YearAwarded": 2000, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1995, "OppositeTeam": null},
              {"YearAwarded": 1999, "OppositeTeam": null},
              {"YearAwarded": 2000, "OppositeTeam": null},
              {"YearAwarded": 2004, "OppositeTeam": null},
              {"YearAwarded": 2013, "OppositeTeam": null},
              {"YearAwarded": 2014, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 76502,
            "Player": "Mel Daniels",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1969-1974",
            "Year": 2012
          },
          {
            "PlayerID": 397,
            "Player": "Reggie Miller",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1988-2005",
            "Year": 2012
          },
          {
            "PlayerID": 904,
            "Player": "Chris Mullin",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1998-2000",
            "Year": 2011
          },
          {
            "PlayerID": 77150,
            "Player": "Gus Johnson",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1973",
            "Year": 2010
          },
          {
            "PlayerID": 76504,
            "Player": "Adrian Dantley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1978",
            "Year": 2008
          },
          {
            "PlayerID": 76673,
            "Player": "Alex English",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1979-1980",
            "Year": 1997
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 397,
            "Player": "Reggie Miller",
            "Position": "G",
            "Jersey": "31",
            "SeasonsWithTeam": "1988-2005",
            "Year": 2005
          },
          {
            "PlayerID": null,
            "Player": "Bobby \"Slick\" Leonard",
            "Position": "Coach",
            "Jersey": "529",
            "SeasonsWithTeam": "1969-1980",
            "Year": 1996
          },
          {
            "PlayerID": 77532,
            "Player": "George McGinnis",
            "Position": "F",
            "Jersey": "30",
            "SeasonsWithTeam": "1972-1975, 1981-1982",
            "Year": 1985
          },
          {
            "PlayerID": 76502,
            "Player": "Mel Daniels",
            "Position": "C",
            "Jersey": "34",
            "SeasonsWithTeam": "1969-1974",
            "Year": 1985
          },
          {
            "PlayerID": 76286,
            "Player": "Roger Brown",
            "Position": "F",
            "Jersey": "35",
            "SeasonsWithTeam": "1968-1974, 1976",
            "Year": 1985
          },
          {
            "PlayerID": null,
            "Player": "Melvin Simon",
            "Position": "Owner",
            "Jersey": " ",
            "SeasonsWithTeam": "1983-2009",
            "Year": null
          }
        ]
      }
    ]
  },
  "1610612746": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612746,
            "Abbreviation": "LAC",
            "Nickname": "Clippers",
            "YearFounded": 1970,
            "YearActiveTill": "present",
            "City": "Los Angeles",
            "Arena": "STAPLES Center",
            "ArenaCapacity": "18997",
            "Owner": "Steve Ballmer",
            "GeneralManager": "Dave Wohl",
            "HeadCoach": "Doc Rivers",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612746,
            "City": "Los Angeles",
            "Nickname": "Clippers",
            "YearFounded": 1984,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612746,
            "City": "San Diego",
            "Nickname": "Clippers",
            "YearFounded": 1978,
            "YearActiveTill": 1983
          },
          {
            "Team_Id": 1610612746,
            "City": "Buffalo",
            "Nickname": "Braves",
            "YearFounded": 1970,
            "YearActiveTill": 1977
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/LAClippers"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://www.instagram.com/laclippers"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/LAClippers"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {"ConferenceTitles": []},
          {
            "DivitionalTitles": [
              {"YearAwarded": 2013, "OppositeTeam": null},
              {"YearAwarded": 2014, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 78532,
            "Player": "Jamaal Wilkes",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1986",
            "Year": 2012
          },
          {
            "PlayerID": 76504,
            "Player": "Adrian Dantley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1977",
            "Year": 2008
          },
          {
            "PlayerID": 1122,
            "Player": "Dominique Wilkins",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1994",
            "Year": 2006
          },
          {
            "PlayerID": 77449,
            "Player": "Moses Malone",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1977",
            "Year": 2001
          },
          {
            "PlayerID": 77498,
            "Player": "Bob McAdoo",
            "Position": "C/F",
            "Jersey": null,
            "SeasonsWithTeam": "1973-1977",
            "Year": 2000
          },
          {
            "PlayerID": 78450,
            "Player": "Bill Walton",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1980-1985",
            "Year": 1993
          }
        ]
      },
      {"RetiredMembers": []}
    ]
  },
  "1610612747": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612747,
            "Abbreviation": "LAL",
            "Nickname": "Lakers",
            "YearFounded": 1948,
            "YearActiveTill": "present",
            "City": "Los Angeles",
            "Arena": "STAPLES Center",
            "ArenaCapacity": "18997",
            "Owner": "Jerry Buss Family Trust",
            "GeneralManager": "Mitch Kupchak",
            "HeadCoach": "Byron Scott",
            "DLeagueAffiliation": "Los Angeles D-Fenders"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612747,
            "City": "Los Angeles",
            "Nickname": "Lakers",
            "YearFounded": 1960,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612747,
            "City": "Minneapolis",
            "Nickname": "Lakers",
            "YearFounded": 1948,
            "YearActiveTill": 1959
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/losangeleslakers"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/lakers"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/Lakers"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1949, "OppositeTeam": "Washington Capitols"},
              {
                "YearAwarded": 1950,
                "OppositeTeam": "Syracuse Nationals (76ers)"
              },
              {"YearAwarded": 1952, "OppositeTeam": "New York Knicks"},
              {"YearAwarded": 1953, "OppositeTeam": "New York Knicks"},
              {
                "YearAwarded": 1954,
                "OppositeTeam": "Syracuse Nationals (76ers)"
              },
              {"YearAwarded": 1972, "OppositeTeam": "New York Knicks"},
              {"YearAwarded": 1980, "OppositeTeam": "Philadelphia 76ers"},
              {"YearAwarded": 1982, "OppositeTeam": "Philadelphia 76ers"},
              {"YearAwarded": 1985, "OppositeTeam": "Boston Celtics"},
              {"YearAwarded": 1987, "OppositeTeam": "Boston Celtics"},
              {"YearAwarded": 1988, "OppositeTeam": "Detroit Pistons"},
              {"YearAwarded": 2000, "OppositeTeam": "Indiana Pacers"},
              {"YearAwarded": 2001, "OppositeTeam": "Philadelphia 76ers"},
              {"YearAwarded": 2002, "OppositeTeam": "New Jersey Nets"},
              {"YearAwarded": 2009, "OppositeTeam": "Orlando Magic"},
              {"YearAwarded": 2010, "OppositeTeam": "Boston Celtics"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1972, "OppositeTeam": null},
              {"YearAwarded": 1973, "OppositeTeam": null},
              {"YearAwarded": 1980, "OppositeTeam": null},
              {"YearAwarded": 1982, "OppositeTeam": null},
              {"YearAwarded": 1983, "OppositeTeam": null},
              {"YearAwarded": 1984, "OppositeTeam": null},
              {"YearAwarded": 1985, "OppositeTeam": null},
              {"YearAwarded": 1987, "OppositeTeam": null},
              {"YearAwarded": 1988, "OppositeTeam": null},
              {"YearAwarded": 1989, "OppositeTeam": null},
              {"YearAwarded": 1991, "OppositeTeam": null},
              {"YearAwarded": 2000, "OppositeTeam": null},
              {"YearAwarded": 2001, "OppositeTeam": null},
              {"YearAwarded": 2002, "OppositeTeam": null},
              {"YearAwarded": 2004, "OppositeTeam": null},
              {"YearAwarded": 2008, "OppositeTeam": null},
              {"YearAwarded": 2009, "OppositeTeam": null},
              {"YearAwarded": 2010, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1950, "OppositeTeam": null},
              {"YearAwarded": 1951, "OppositeTeam": null},
              {"YearAwarded": 1953, "OppositeTeam": null},
              {"YearAwarded": 1954, "OppositeTeam": null},
              {"YearAwarded": 1962, "OppositeTeam": null},
              {"YearAwarded": 1963, "OppositeTeam": null},
              {"YearAwarded": 1965, "OppositeTeam": null},
              {"YearAwarded": 1966, "OppositeTeam": null},
              {"YearAwarded": 1969, "OppositeTeam": null},
              {"YearAwarded": 1971, "OppositeTeam": null},
              {"YearAwarded": 1972, "OppositeTeam": null},
              {"YearAwarded": 1973, "OppositeTeam": null},
              {"YearAwarded": 1974, "OppositeTeam": null},
              {"YearAwarded": 1977, "OppositeTeam": null},
              {"YearAwarded": 1980, "OppositeTeam": null},
              {"YearAwarded": 1982, "OppositeTeam": null},
              {"YearAwarded": 1983, "OppositeTeam": null},
              {"YearAwarded": 1984, "OppositeTeam": null},
              {"YearAwarded": 1985, "OppositeTeam": null},
              {"YearAwarded": 1986, "OppositeTeam": null},
              {"YearAwarded": 1987, "OppositeTeam": null},
              {"YearAwarded": 1988, "OppositeTeam": null},
              {"YearAwarded": 1989, "OppositeTeam": null},
              {"YearAwarded": 1990, "OppositeTeam": null},
              {"YearAwarded": 2000, "OppositeTeam": null},
              {"YearAwarded": 2001, "OppositeTeam": null},
              {"YearAwarded": 2004, "OppositeTeam": null},
              {"YearAwarded": 2008, "OppositeTeam": null},
              {"YearAwarded": 2009, "OppositeTeam": null},
              {"YearAwarded": 2010, "OppositeTeam": null},
              {"YearAwarded": 2011, "OppositeTeam": null},
              {"YearAwarded": 2012, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 78532,
            "Player": "Jamaal Wilkes",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1978-1985",
            "Year": 2012
          },
          {
            "PlayerID": 23,
            "Player": "Dennis Rodman",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1999",
            "Year": 2011
          },
          {
            "PlayerID": 252,
            "Player": "Karl Malone",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "2004",
            "Year": 2010
          },
          {
            "PlayerID": 76504,
            "Player": "Adrian Dantley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1978-1979",
            "Year": 2008
          },
          {
            "PlayerID": 1460,
            "Player": "James Worthy",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1983-1994",
            "Year": 2003
          },
          {
            "PlayerID": 77142,
            "Player": "Magic Johnson",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1980-1991, 1996",
            "Year": 2002
          },
          {
            "PlayerID": 76832,
            "Player": "Gail Goodrich",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1966-1968, 1971-1976",
            "Year": 1996
          },
          {
            "PlayerID": 76003,
            "Player": "Kareem Abdul-Jabbar",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1976-1989",
            "Year": 1995
          },
          {
            "PlayerID": 77593,
            "Player": "Vern Mikkelsen",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1950-1959",
            "Year": 1995
          },
          {
            "PlayerID": 76972,
            "Player": "Connie Hawkins",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1974-1975",
            "Year": 1992
          },
          {
            "PlayerID": 77414,
            "Player": "Clyde Lovellette",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1954-1957",
            "Year": 1988
          },
          {
            "PlayerID": 77480,
            "Player": "Slater Martin",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1950-1956",
            "Year": 1982
          },
          {
            "PlayerID": 78497,
            "Player": "Jerry West",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1961-1974",
            "Year": 1980
          },
          {
            "PlayerID": 76375,
            "Player": "Wilt Chamberlain",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1969-1973",
            "Year": 1979
          },
          {
            "PlayerID": 77867,
            "Player": "Jim Pollard",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1949-1955",
            "Year": 1978
          },
          {
            "PlayerID": 76127,
            "Player": "Elgin Baylor",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1959-1972",
            "Year": 1977
          },
          {
            "PlayerID": 600012,
            "Player": "George Mikan",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1949-1956",
            "Year": 1959
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 406,
            "Player": "Shaquille O'Neal",
            "Position": "C",
            "Jersey": "34",
            "SeasonsWithTeam": "1997-2004",
            "Year": 2013
          },
          {
            "PlayerID": null,
            "Player": "Chick Hearn",
            "Position": "Broadcaster",
            "Jersey": " ",
            "SeasonsWithTeam": "1962-2002",
            "Year": 2002
          },
          {
            "PlayerID": 76832,
            "Player": "Gail Goodrich",
            "Position": "G",
            "Jersey": "25",
            "SeasonsWithTeam": "1966-1968, 1971-1976",
            "Year": 1996
          },
          {
            "PlayerID": 1460,
            "Player": "James Worthy",
            "Position": "F",
            "Jersey": "42",
            "SeasonsWithTeam": "1983-1994",
            "Year": 1995
          },
          {
            "PlayerID": 77142,
            "Player": "Earvin \"Magic\" Johnson",
            "Position": "G",
            "Jersey": "32",
            "SeasonsWithTeam": "1980-1991, 1996",
            "Year": 1992
          },
          {
            "PlayerID": 76003,
            "Player": "Kareem Abdul-Jabbar",
            "Position": "C",
            "Jersey": "33",
            "SeasonsWithTeam": "1976-1989",
            "Year": 1989
          },
          {
            "PlayerID": 76127,
            "Player": "Elgin Baylor",
            "Position": "F",
            "Jersey": "22",
            "SeasonsWithTeam": "1959-1972",
            "Year": 1983
          },
          {
            "PlayerID": 78497,
            "Player": "Jerry West",
            "Position": "G",
            "Jersey": "44",
            "SeasonsWithTeam": "1961-1974",
            "Year": 1983
          },
          {
            "PlayerID": 76375,
            "Player": "Wilt Chamberlain",
            "Position": "C",
            "Jersey": "13",
            "SeasonsWithTeam": "1969-1973",
            "Year": 1983
          },
          {
            "PlayerID": 78532,
            "Player": "Jamaal Wilkes",
            "Position": "F",
            "Jersey": "52",
            "SeasonsWithTeam": "1978-1985",
            "Year": null
          }
        ]
      }
    ]
  },
  "1610612763": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612763,
            "Abbreviation": "MEM",
            "Nickname": "Grizzlies",
            "YearFounded": 1995,
            "YearActiveTill": "present",
            "City": "Memphis",
            "Arena": "FedEx Forum",
            "ArenaCapacity": "21165",
            "Owner": "Robert Pera",
            "GeneralManager": "Chris Wallace",
            "HeadCoach": "David Joerger",
            "DLeagueAffiliation": "Iowa Energy"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612763,
            "City": "Memphis",
            "Nickname": "Grizzlies",
            "YearFounded": 2001,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612763,
            "City": "Vancouver",
            "Nickname": "Grizzlies",
            "YearFounded": 1995,
            "YearActiveTill": 2000
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/MemphisGrizzlies"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/thememphisgrizzlies"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/memgrizz"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {"ConferenceTitles": []},
          {"DivitionalTitles": []}
        ]
      },
      {"HallOfFameInductees": []},
      {"RetiredMembers": []}
    ]
  },
  "1610612748": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612748,
            "Abbreviation": "MIA",
            "Nickname": "Heat",
            "YearFounded": 1988,
            "YearActiveTill": "present",
            "City": "Miami",
            "Arena": "AmericanAirlines Arena",
            "ArenaCapacity": "19600",
            "Owner": "Micky Arison",
            "GeneralManager": "Pat Riley",
            "HeadCoach": "Erik Spoelstra",
            "DLeagueAffiliation": "Sioux Falls Skyforce"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612748,
            "City": "Miami",
            "Nickname": "Heat",
            "YearFounded": 1988,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/MiamiHeat"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/miamiheat/"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/MiamiHEAT"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 2006, "OppositeTeam": "Dallas Mavericks"},
              {"YearAwarded": 2012, "OppositeTeam": "Oklahoma City Thunder"},
              {"YearAwarded": 2013, "OppositeTeam": "San Antonio Spurs"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 2006, "OppositeTeam": null},
              {"YearAwarded": 2011, "OppositeTeam": null},
              {"YearAwarded": 2012, "OppositeTeam": null},
              {"YearAwarded": 2013, "OppositeTeam": null},
              {"YearAwarded": 2014, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1997, "OppositeTeam": null},
              {"YearAwarded": 1998, "OppositeTeam": null},
              {"YearAwarded": 1999, "OppositeTeam": null},
              {"YearAwarded": 2000, "OppositeTeam": null},
              {"YearAwarded": 2005, "OppositeTeam": null},
              {"YearAwarded": 2006, "OppositeTeam": null},
              {"YearAwarded": 2007, "OppositeTeam": null},
              {"YearAwarded": 2011, "OppositeTeam": null},
              {"YearAwarded": 2012, "OppositeTeam": null},
              {"YearAwarded": 2013, "OppositeTeam": null},
              {"YearAwarded": 2014, "OppositeTeam": null}
            ]
          }
        ]
      },
      {"HallOfFameInductees": []},
      {
        "RetiredMembers": [
          {
            "PlayerID": 297,
            "Player": "Alonzo Mourning",
            "Position": "C",
            "Jersey": "33",
            "SeasonsWithTeam": "1996-2002, 2006-2008",
            "Year": 2009
          },
          {
            "PlayerID": 896,
            "Player": "Tim Hardaway",
            "Position": "G",
            "Jersey": "10",
            "SeasonsWithTeam": "1997-2001",
            "Year": 2009
          },
          {
            "PlayerID": 893,
            "Player": "Michael Jordan",
            "Position": "G",
            "Jersey": "23",
            "SeasonsWithTeam": null,
            "Year": 2005
          }
        ]
      }
    ]
  },
  "1610612749": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612749,
            "Abbreviation": "MIL",
            "Nickname": "Bucks",
            "YearFounded": 1968,
            "YearActiveTill": "present",
            "City": "Milwaukee",
            "Arena": "BMO Harris Bradley Center",
            "ArenaCapacity": "18717",
            "Owner": "Wesley Edens &Â Marc Lasry",
            "GeneralManager": "John Hammond",
            "HeadCoach": "Jason Kidd",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612749,
            "City": "Milwaukee",
            "Nickname": "Bucks",
            "YearFounded": 1968,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/milwaukeebucks"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://www.instagram.com/bucks"
          },
          {"AccountType": "Twitter", "WebSite_Link": "http://twitter.com/bucks"}
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1971, "OppositeTeam": "Baltimore Bullets"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1971, "OppositeTeam": null},
              {"YearAwarded": 1974, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1971, "OppositeTeam": null},
              {"YearAwarded": 1972, "OppositeTeam": null},
              {"YearAwarded": 1973, "OppositeTeam": null},
              {"YearAwarded": 1974, "OppositeTeam": null},
              {"YearAwarded": 1976, "OppositeTeam": null},
              {"YearAwarded": 1980, "OppositeTeam": null},
              {"YearAwarded": 1981, "OppositeTeam": null},
              {"YearAwarded": 1982, "OppositeTeam": null},
              {"YearAwarded": 1983, "OppositeTeam": null},
              {"YearAwarded": 1984, "OppositeTeam": null},
              {"YearAwarded": 1985, "OppositeTeam": null},
              {"YearAwarded": 1986, "OppositeTeam": null},
              {"YearAwarded": 2001, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 76504,
            "Player": "Adrian Dantley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1991",
            "Year": 2008
          },
          {
            "PlayerID": 77449,
            "Player": "Moses Malone",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1992-1993",
            "Year": 2001
          },
          {
            "PlayerID": 76673,
            "Player": "Alex English",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1977-1978",
            "Year": 1997
          },
          {
            "PlayerID": 76003,
            "Player": "Kareem Abdul-Jabbar",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1970-1975",
            "Year": 1995
          },
          {
            "PlayerID": 600005,
            "Player": "Bob Lanier",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1980-1984",
            "Year": 1992
          },
          {
            "PlayerID": 76462,
            "Player": "Dave Cowens",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1983",
            "Year": 1991
          },
          {
            "PlayerID": 76054,
            "Player": "Tiny Archibald",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1984",
            "Year": 1991
          },
          {
            "PlayerID": 600015,
            "Player": "Oscar Robertson",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1971-1974",
            "Year": 1980
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 76003,
            "Player": "Kareem Abdul-Jabbar",
            "Position": "C",
            "Jersey": "33",
            "SeasonsWithTeam": "1970-1975",
            "Year": 1993
          },
          {
            "PlayerID": 77626,
            "Player": "Sidney Moncrief",
            "Position": "G",
            "Jersey": "4",
            "SeasonsWithTeam": "1980-1989",
            "Year": 1990
          },
          {
            "PlayerID": 76252,
            "Player": "Junior Bridgeman",
            "Position": "F",
            "Jersey": "2",
            "SeasonsWithTeam": "1976-1984, 1987",
            "Year": 1988
          },
          {
            "PlayerID": 600005,
            "Player": "Bob Lanier",
            "Position": "C",
            "Jersey": "16",
            "SeasonsWithTeam": "1980-1984",
            "Year": 1984
          },
          {
            "PlayerID": 78600,
            "Player": "Brian Winters",
            "Position": "G",
            "Jersey": "32",
            "SeasonsWithTeam": "1976-1983",
            "Year": 1983
          },
          {
            "PlayerID": 77533,
            "Player": "Jon McGlocklin",
            "Position": "G",
            "Jersey": "14",
            "SeasonsWithTeam": "1969-1976",
            "Year": 1976
          },
          {
            "PlayerID": 600015,
            "Player": "Oscar Robertson",
            "Position": "G",
            "Jersey": "1",
            "SeasonsWithTeam": "1971-1974",
            "Year": 1974
          }
        ]
      }
    ]
  },
  "1610612750": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612750,
            "Abbreviation": "MIN",
            "Nickname": "Timberwolves",
            "YearFounded": 1989,
            "YearActiveTill": "present",
            "City": "Minnesota",
            "Arena": "Target Center",
            "ArenaCapacity": "20500",
            "Owner": "Glen Taylor",
            "GeneralManager": "Milt Newton",
            "HeadCoach": "Sam Mitchell",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612750,
            "City": "Minnesota",
            "Nickname": "Timberwolves",
            "YearFounded": 1989,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/MNTimberwolves"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/mntimberwolves"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/MNTimberwolves"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {"ConferenceTitles": []},
          {
            "DivitionalTitles": [
              {"YearAwarded": 2004, "OppositeTeam": null}
            ]
          }
        ]
      },
      {"HallOfFameInductees": []},
      {
        "RetiredMembers": [
          {
            "PlayerID": 907,
            "Player": "Malik Sealy",
            "Position": "F",
            "Jersey": "2",
            "SeasonsWithTeam": "2000",
            "Year": 2000
          }
        ]
      }
    ]
  },
  "1610612740": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612740,
            "Abbreviation": "NOP",
            "Nickname": "Pelicans",
            "YearFounded": 2002,
            "YearActiveTill": "present",
            "City": "New Orleans",
            "Arena": "Smoothie King Arena",
            "ArenaCapacity": "18000",
            "Owner": "Tom Benson",
            "GeneralManager": "Dell Demps",
            "HeadCoach": "Alvin Gentry",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612740,
            "City": "New Orleans",
            "Nickname": "Pelicans",
            "YearFounded": 2013,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612740,
            "City": "New Orleans",
            "Nickname": "Hornets",
            "YearFounded": 2007,
            "YearActiveTill": 2012
          },
          {
            "Team_Id": 1610612740,
            "City": "New Orleans/Oklahoma City",
            "Nickname": "Hornets",
            "YearFounded": 2005,
            "YearActiveTill": 2006
          },
          {
            "Team_Id": 1610612740,
            "City": "New Orleans",
            "Nickname": "Hornets",
            "YearFounded": 2002,
            "YearActiveTill": 2004
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/PelicansNBA?source=menu"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/PelicansNBA"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/PelicansNBA"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {"ConferenceTitles": []},
          {
            "DivitionalTitles": [
              {"YearAwarded": 2008, "OppositeTeam": null}
            ]
          }
        ]
      },
      {"HallOfFameInductees": []},
      {"RetiredMembers": []}
    ]
  },
  "1610612752": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612752,
            "Abbreviation": "NYK",
            "Nickname": "Knicks",
            "YearFounded": 1946,
            "YearActiveTill": "present",
            "City": "New York",
            "Arena": "Madison Square Garden (IV)",
            "ArenaCapacity": "19763",
            "Owner": "Cablevision (James Dolan)",
            "GeneralManager": "Steve Mills",
            "HeadCoach": "Kurt Rambis",
            "DLeagueAffiliation": "Westchester Knicks"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612752,
            "City": "New York",
            "Nickname": "Knicks",
            "YearFounded": 1946,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/NYKnicks"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/nyknicks"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/#!/nyknicks"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1970, "OppositeTeam": "Los Angeles Lakers"},
              {"YearAwarded": 1973, "OppositeTeam": "Los Angeles Lakers"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1972, "OppositeTeam": null},
              {"YearAwarded": 1973, "OppositeTeam": null},
              {"YearAwarded": 1994, "OppositeTeam": null},
              {"YearAwarded": 1999, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1953, "OppositeTeam": null},
              {"YearAwarded": 1954, "OppositeTeam": null},
              {"YearAwarded": 1970, "OppositeTeam": null},
              {"YearAwarded": 1971, "OppositeTeam": null},
              {"YearAwarded": 1989, "OppositeTeam": null},
              {"YearAwarded": 1993, "OppositeTeam": null},
              {"YearAwarded": 1994, "OppositeTeam": null},
              {"YearAwarded": 2013, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 121,
            "Player": "Patrick Ewing",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1986-2000",
            "Year": 2008
          },
          {
            "PlayerID": 77498,
            "Player": "Bob McAdoo",
            "Position": "C/F",
            "Jersey": null,
            "SeasonsWithTeam": "1977-1979",
            "Year": 2000
          },
          {
            "PlayerID": 77537,
            "Player": "Dick McGuire",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1950-1957",
            "Year": 1993
          },
          {
            "PlayerID": 76144,
            "Player": "Walt Bellamy",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1966-1969",
            "Year": 1993
          },
          {
            "PlayerID": 76773,
            "Player": "Harry Gallatin",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1949-1957",
            "Year": 1991
          },
          {
            "PlayerID": 600006,
            "Player": "Earl Monroe",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1972-1980",
            "Year": 1990
          },
          {
            "PlayerID": 76750,
            "Player": "Walt Frazier",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1968-1977",
            "Year": 1987
          },
          {
            "PlayerID": 76233,
            "Player": "Bill Bradley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1968-1977",
            "Year": 1983
          },
          {
            "PlayerID": 76545,
            "Player": "Dave DeBusschere",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1969-1974",
            "Year": 1983
          },
          {
            "PlayerID": 77480,
            "Player": "Slater Martin",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1957",
            "Year": 1982
          },
          {
            "PlayerID": 77929,
            "Player": "Willis Reed",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1965-1974",
            "Year": 1982
          },
          {
            "PlayerID": 77418,
            "Player": "Jerry Lucas",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1972-1974",
            "Year": 1980
          },
          {
            "PlayerID": 76828,
            "Player": "Tom Gola",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1963-1966",
            "Year": 1976
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 121,
            "Player": "Patrick Ewing",
            "Position": "C",
            "Jersey": "33",
            "SeasonsWithTeam": "1986-2000",
            "Year": 2003
          },
          {
            "PlayerID": 77537,
            "Player": "Dick McGuire",
            "Position": "G",
            "Jersey": "15",
            "SeasonsWithTeam": "1950-1957",
            "Year": 1992
          },
          {
            "PlayerID": 76107,
            "Player": "Dick Barnett",
            "Position": "G",
            "Jersey": "12",
            "SeasonsWithTeam": "1966-1974",
            "Year": 1990
          },
          {
            "PlayerID": null,
            "Player": "Red Holtzman",
            "Position": "Coach",
            "Jersey": "613",
            "SeasonsWithTeam": "1968-1977, 1979-1982",
            "Year": 1990
          },
          {
            "PlayerID": 600006,
            "Player": "Earl Monroe",
            "Position": "G",
            "Jersey": "15",
            "SeasonsWithTeam": "1972-1980",
            "Year": 1986
          },
          {
            "PlayerID": 76233,
            "Player": "Bill Bradley",
            "Position": "F",
            "Jersey": "24",
            "SeasonsWithTeam": "1968-1977",
            "Year": 1984
          },
          {
            "PlayerID": 76545,
            "Player": "Dave DeBusschere",
            "Position": "F",
            "Jersey": "22",
            "SeasonsWithTeam": "1969-1974",
            "Year": 1981
          },
          {
            "PlayerID": 76750,
            "Player": "Walt Frazier",
            "Position": "G",
            "Jersey": "10",
            "SeasonsWithTeam": "1968-1977",
            "Year": 1979
          },
          {
            "PlayerID": 77929,
            "Player": "Willis Reed",
            "Position": "C",
            "Jersey": "19",
            "SeasonsWithTeam": "1965-1974",
            "Year": 1976
          }
        ]
      }
    ]
  },
  "1610612760": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612760,
            "Abbreviation": "OKC",
            "Nickname": "Thunder",
            "YearFounded": 1967,
            "YearActiveTill": "present",
            "City": "Oklahoma City",
            "Arena": "Chesapeake Energy Arena",
            "ArenaCapacity": "18203",
            "Owner": "Clay Bennett",
            "GeneralManager": "Sam Presti",
            "HeadCoach": "Billy Donovan",
            "DLeagueAffiliation": "Oklahoma City Blue"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612760,
            "City": "Oklahoma City",
            "Nickname": "Thunder",
            "YearFounded": 2008,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612760,
            "City": "Seattle",
            "Nickname": "SuperSonics",
            "YearFounded": 1967,
            "YearActiveTill": 2007
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/thunderfans"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/okcthunder/"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/okcthunder"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1979, "OppositeTeam": "Washington Bullets"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1978, "OppositeTeam": null},
              {"YearAwarded": 1979, "OppositeTeam": null},
              {"YearAwarded": 1996, "OppositeTeam": null},
              {"YearAwarded": 2012, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1979, "OppositeTeam": null},
              {"YearAwarded": 1994, "OppositeTeam": null},
              {"YearAwarded": 1996, "OppositeTeam": null},
              {"YearAwarded": 1997, "OppositeTeam": null},
              {"YearAwarded": 1998, "OppositeTeam": null},
              {"YearAwarded": 2005, "OppositeTeam": null},
              {"YearAwarded": 2011, "OppositeTeam": null},
              {"YearAwarded": 2012, "OppositeTeam": null},
              {"YearAwarded": 2013, "OppositeTeam": null},
              {"YearAwarded": 2014, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 77141,
            "Player": "Dennis Johnson",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1977-1980",
            "Year": 2010
          },
          {
            "PlayerID": 121,
            "Player": "Patrick Ewing",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "2001",
            "Year": 2008
          },
          {
            "PlayerID": 78326,
            "Player": "David Thompson",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1983-1984",
            "Year": 1996
          },
          {
            "PlayerID": 78530,
            "Player": "Lenny Wilkens",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1969-1972",
            "Year": 1989
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 76981,
            "Player": "Spencer Haywood",
            "Position": "F",
            "Jersey": "24",
            "SeasonsWithTeam": "1972-1975",
            "Year": 2007
          },
          {
            "PlayerID": 78549,
            "Player": "Gus Williams",
            "Position": "G",
            "Jersey": "1",
            "SeasonsWithTeam": "1978-1984",
            "Year": 2004
          },
          {
            "PlayerID": 203,
            "Player": "Nate McMillan",
            "Position": "G",
            "Jersey": "10",
            "SeasonsWithTeam": "1987-1998",
            "Year": 1999
          },
          {
            "PlayerID": null,
            "Player": "Bob Blackburn",
            "Position": "Broadcaster",
            "Jersey": " ",
            "SeasonsWithTeam": "1968-1992",
            "Year": 1993
          },
          {
            "PlayerID": 78149,
            "Player": "Jack Sikma",
            "Position": "C",
            "Jersey": "43",
            "SeasonsWithTeam": "1978-1986",
            "Year": 1992
          },
          {
            "PlayerID": 76272,
            "Player": "Fred Brown",
            "Position": "G",
            "Jersey": "32",
            "SeasonsWithTeam": "1972-1984",
            "Year": 1986
          },
          {
            "PlayerID": 78530,
            "Player": "Lenny Wilkens",
            "Position": "G - Coach",
            "Jersey": "19",
            "SeasonsWithTeam": "1969-1972, 1978-1985",
            "Year": 1979
          }
        ]
      }
    ]
  },
  "1610612753": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612753,
            "Abbreviation": "ORL",
            "Nickname": "Magic",
            "YearFounded": 1989,
            "YearActiveTill": "present",
            "City": "Orlando",
            "Arena": "Amway Center",
            "ArenaCapacity": "18500",
            "Owner": "Rick DeVos",
            "GeneralManager": "Rob Hennigan",
            "HeadCoach": "Scott Skiles",
            "DLeagueAffiliation": "Erie Bayhawks"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612753,
            "City": "Orlando",
            "Nickname": "Magic",
            "YearFounded": 1989,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/OrlandoMagic"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/orlandomagic"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/OrlandoMagic"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {
            "ConferenceTitles": [
              {"YearAwarded": 1995, "OppositeTeam": null},
              {"YearAwarded": 2009, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1995, "OppositeTeam": null},
              {"YearAwarded": 1996, "OppositeTeam": null},
              {"YearAwarded": 2008, "OppositeTeam": null},
              {"YearAwarded": 2009, "OppositeTeam": null},
              {"YearAwarded": 2010, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 121,
            "Player": "Patrick Ewing",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "2002",
            "Year": 2008
          },
          {
            "PlayerID": 1122,
            "Player": "Dominique Wilkins",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1999",
            "Year": 2006
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": null,
            "Player": "Sixth Man",
            "Position": null,
            "Jersey": "6",
            "SeasonsWithTeam": null,
            "Year": 2000
          }
        ]
      }
    ]
  },
  "1610612755": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612755,
            "Abbreviation": "PHI",
            "Nickname": "76ers",
            "YearFounded": 1949,
            "YearActiveTill": "present",
            "City": "Philadelphia",
            "Arena": "Wells Fargo Center",
            "ArenaCapacity": "21600",
            "Owner": "Joshua Harris",
            "GeneralManager": "Sam Hinkie",
            "HeadCoach": "Brett Brown",
            "DLeagueAffiliation": "Delaware 87ers"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612755,
            "City": "Philadelphia",
            "Nickname": "76ers",
            "YearFounded": 1963,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612755,
            "City": "Syracuse",
            "Nickname": "Nationals",
            "YearFounded": 1949,
            "YearActiveTill": 1962
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/Sixers"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://www.instagram.com/Philadelphia76ers"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/sixers"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1955, "OppositeTeam": "Fort Wayne Pistons"},
              {"YearAwarded": 1967, "OppositeTeam": "San Francisco Warriors"},
              {"YearAwarded": 1983, "OppositeTeam": "Los Angeles Lakers"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1977, "OppositeTeam": null},
              {"YearAwarded": 1980, "OppositeTeam": null},
              {"YearAwarded": 1982, "OppositeTeam": null},
              {"YearAwarded": 1983, "OppositeTeam": null},
              {"YearAwarded": 2001, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1950, "OppositeTeam": null},
              {"YearAwarded": 1952, "OppositeTeam": null},
              {"YearAwarded": 1955, "OppositeTeam": null},
              {"YearAwarded": 1966, "OppositeTeam": null},
              {"YearAwarded": 1967, "OppositeTeam": null},
              {"YearAwarded": 1968, "OppositeTeam": null},
              {"YearAwarded": 1977, "OppositeTeam": null},
              {"YearAwarded": 1978, "OppositeTeam": null},
              {"YearAwarded": 1983, "OppositeTeam": null},
              {"YearAwarded": 1990, "OppositeTeam": null},
              {"YearAwarded": 2001, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 78435,
            "Player": "Chet Walker",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1963-1969",
            "Year": 2012
          },
          {
            "PlayerID": 787,
            "Player": "Charles Barkley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1985-1992",
            "Year": 2006
          },
          {
            "PlayerID": 77449,
            "Player": "Moses Malone",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1983-1986, 1994",
            "Year": 2001
          },
          {
            "PlayerID": 77498,
            "Player": "Bob McAdoo",
            "Position": "C/F",
            "Jersey": null,
            "SeasonsWithTeam": "1986",
            "Year": 2000
          },
          {
            "PlayerID": 78628,
            "Player": "George Yardley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1960",
            "Year": 1996
          },
          {
            "PlayerID": 76681,
            "Player": "Julius Erving",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1977-1987",
            "Year": 1993
          },
          {
            "PlayerID": 76487,
            "Player": "Billy Cunningham",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1966-1972, 1975-1976",
            "Year": 1986
          },
          {
            "PlayerID": 76373,
            "Player": "Al Cervi",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1950-1953",
            "Year": 1985
          },
          {
            "PlayerID": 76882,
            "Player": "Hal Greer",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1959-1973",
            "Year": 1982
          },
          {
            "PlayerID": 76375,
            "Player": "Wilt Chamberlain",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1965-1968",
            "Year": 1979
          },
          {
            "PlayerID": 78076,
            "Player": "Dolph Schayes",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1950-1964",
            "Year": 1973
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 947,
            "Player": "Allen Iverson",
            "Position": "G",
            "Jersey": "3",
            "SeasonsWithTeam": "1997-2007, 2010",
            "Year": 2014
          },
          {
            "PlayerID": 787,
            "Player": "Charles Barkley",
            "Position": "F",
            "Jersey": "34",
            "SeasonsWithTeam": "1985-1992",
            "Year": 2001
          },
          {
            "PlayerID": 76385,
            "Player": "Maurice Cheeks",
            "Position": "G",
            "Jersey": "10",
            "SeasonsWithTeam": "1979-1989",
            "Year": 1995
          },
          {
            "PlayerID": 76375,
            "Player": "Wilt Chamberlain",
            "Position": "C",
            "Jersey": "13",
            "SeasonsWithTeam": "1965-1968",
            "Year": 1991
          },
          {
            "PlayerID": 76681,
            "Player": "Julius Erving",
            "Position": "F",
            "Jersey": "6",
            "SeasonsWithTeam": "1977-1987",
            "Year": 1988
          },
          {
            "PlayerID": 77193,
            "Player": "Bobby Jones",
            "Position": "F",
            "Jersey": "24",
            "SeasonsWithTeam": "1979-1986",
            "Year": 1986
          },
          {
            "PlayerID": null,
            "Player": "Dave Zinkoff",
            "Position": "Broadcaster",
            "Jersey": " ",
            "SeasonsWithTeam": "1963-1985",
            "Year": 1986
          },
          {
            "PlayerID": 76487,
            "Player": "Billy Cunningham",
            "Position": "F",
            "Jersey": "32",
            "SeasonsWithTeam": "1966-1972, 1975-1976",
            "Year": 1976
          },
          {
            "PlayerID": 76882,
            "Player": "Hal Greer",
            "Position": "G",
            "Jersey": "15",
            "SeasonsWithTeam": "1959-1973",
            "Year": 1976
          }
        ]
      }
    ]
  },
  "1610612756": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612756,
            "Abbreviation": "PHX",
            "Nickname": "Suns",
            "YearFounded": 1968,
            "YearActiveTill": "present",
            "City": "Phoenix",
            "Arena": "Talking Stick Resort Arena",
            "ArenaCapacity": "18422",
            "Owner": "Robert Sarver",
            "GeneralManager": "Ryan McDonough",
            "HeadCoach": "Earl Watson",
            "DLeagueAffiliation": "Bakersfield Jam"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612756,
            "City": "Phoenix",
            "Nickname": "Suns",
            "YearFounded": 1968,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/suns"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/suns"
          },
          {"AccountType": "Twitter", "WebSite_Link": "http://twitter.com/suns"}
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {
            "ConferenceTitles": [
              {"YearAwarded": 1976, "OppositeTeam": null},
              {"YearAwarded": 1993, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1981, "OppositeTeam": null},
              {"YearAwarded": 1993, "OppositeTeam": null},
              {"YearAwarded": 1995, "OppositeTeam": null},
              {"YearAwarded": 2005, "OppositeTeam": null},
              {"YearAwarded": 2006, "OppositeTeam": null},
              {"YearAwarded": 2007, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 77141,
            "Player": "Dennis Johnson",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1981-1983",
            "Year": 2010
          },
          {
            "PlayerID": 787,
            "Player": "Charles Barkley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1993-1996",
            "Year": 2006
          },
          {
            "PlayerID": 76832,
            "Player": "Gail Goodrich",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1969-1970",
            "Year": 1996
          },
          {
            "PlayerID": 76972,
            "Player": "Connie Hawkins",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1970-1974",
            "Year": 1992
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": null,
            "Player": "Jerry Colangelo",
            "Position": "General Manager",
            "Jersey": " ",
            "SeasonsWithTeam": "1968-2012",
            "Year": 2007
          },
          {
            "PlayerID": null,
            "Player": "Cotton Fitzsimmons",
            "Position": "Coach",
            "Jersey": "832",
            "SeasonsWithTeam": "1970-1972, 1989-1992, 199",
            "Year": 2005
          },
          {
            "PlayerID": 787,
            "Player": "Charles Barkley",
            "Position": "F",
            "Jersey": "34",
            "SeasonsWithTeam": "1993-1996",
            "Year": 2004
          },
          {
            "PlayerID": 105,
            "Player": "Dan Majerle",
            "Position": "F",
            "Jersey": "9",
            "SeasonsWithTeam": "1989-1995, 2002",
            "Year": 2003
          },
          {
            "PlayerID": null,
            "Player": "Joe Proski",
            "Position": "Trainer",
            "Jersey": " ",
            "SeasonsWithTeam": "1968-2000",
            "Year": 2001
          },
          {
            "PlayerID": 134,
            "Player": "Kevin Johnson",
            "Position": "G",
            "Jersey": "7",
            "SeasonsWithTeam": "1989-1998, 2000",
            "Year": 2001
          },
          {
            "PlayerID": 1472,
            "Player": "Tom Chambers",
            "Position": "F",
            "Jersey": "24",
            "SeasonsWithTeam": "1989-1993",
            "Year": 1999
          },
          {
            "PlayerID": 1453,
            "Player": "Walter Davis",
            "Position": "G",
            "Jersey": "6",
            "SeasonsWithTeam": "1978-1988",
            "Year": 1994
          },
          {
            "PlayerID": 78500,
            "Player": "Paul Westphal",
            "Position": "G",
            "Jersey": "44",
            "SeasonsWithTeam": "1976-1980, 1984",
            "Year": 1989
          },
          {
            "PlayerID": 76011,
            "Player": "Alvan Adams",
            "Position": "C",
            "Jersey": "33",
            "SeasonsWithTeam": "1976-1988",
            "Year": 1988
          },
          {
            "PlayerID": 78398,
            "Player": "Dick Van Arsdale",
            "Position": "G",
            "Jersey": "5",
            "SeasonsWithTeam": "1969-1977",
            "Year": 1978
          },
          {
            "PlayerID": 76972,
            "Player": "Connie Hawkins",
            "Position": "F",
            "Jersey": "42",
            "SeasonsWithTeam": "1970-1974",
            "Year": 1976
          }
        ]
      }
    ]
  },
  "1610612757": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612757,
            "Abbreviation": "POR",
            "Nickname": "Trail Blazers",
            "YearFounded": 1970,
            "YearActiveTill": "present",
            "City": "Portland",
            "Arena": "Moda Center",
            "ArenaCapacity": "19980",
            "Owner": "Paul Allen",
            "GeneralManager": "Neil Olshey",
            "HeadCoach": "Terry Stotts",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612757,
            "City": "Portland",
            "Nickname": "Trail Blazers",
            "YearFounded": 1970,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/trailblazers"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/nbatrailblazers/"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/pdxtrailblazers"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1977, "OppositeTeam": "Philadelphia 76ers"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1977, "OppositeTeam": null},
              {"YearAwarded": 1990, "OppositeTeam": null},
              {"YearAwarded": 1992, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1978, "OppositeTeam": null},
              {"YearAwarded": 1991, "OppositeTeam": null},
              {"YearAwarded": 1992, "OppositeTeam": null},
              {"YearAwarded": 2015, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 717,
            "Player": "Arvydas Sabonis",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1996-2003",
            "Year": 2011
          },
          {
            "PlayerID": 937,
            "Player": "Scottie Pippen",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "2000-2003",
            "Year": 2010
          },
          {
            "PlayerID": 17,
            "Player": "Clyde Drexler",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1984-1995",
            "Year": 2004
          },
          {
            "PlayerID": 77845,
            "Player": "Drazen Petrovic",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1990-1991",
            "Year": 2002
          },
          {
            "PlayerID": 78450,
            "Player": "Bill Walton",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1975-1978",
            "Year": 1993
          },
          {
            "PlayerID": 78530,
            "Player": "Lenny Wilkens",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1975",
            "Year": 1989
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 76895,
            "Player": "Bob Gross",
            "Position": "F",
            "Jersey": "30",
            "SeasonsWithTeam": "1976-1982",
            "Year": 2008
          },
          {
            "PlayerID": 345,
            "Player": "Terry Porter",
            "Position": "G",
            "Jersey": "30",
            "SeasonsWithTeam": "1986-1995",
            "Year": 2008
          },
          {
            "PlayerID": 77043,
            "Player": "Lionel Hollins",
            "Position": "G",
            "Jersey": "14",
            "SeasonsWithTeam": "1976-1980",
            "Year": 2007
          },
          {
            "PlayerID": null,
            "Player": "Bill Schonely",
            "Position": "Broadcaster",
            "Jersey": " ",
            "SeasonsWithTeam": "1970-1998",
            "Year": 2003
          },
          {
            "PlayerID": 17,
            "Player": "Clyde Drexler",
            "Position": "G",
            "Jersey": "22",
            "SeasonsWithTeam": "1984-1995",
            "Year": 2001
          },
          {
            "PlayerID": null,
            "Player": "Jack Ramsay",
            "Position": "Coach",
            "Jersey": "77",
            "SeasonsWithTeam": "1977-1986",
            "Year": 1993
          },
          {
            "PlayerID": null,
            "Player": "Larry Weinberg",
            "Position": "Owner",
            "Jersey": "1",
            "SeasonsWithTeam": "1970-1988",
            "Year": 1992
          },
          {
            "PlayerID": 78450,
            "Player": "Bill Walton",
            "Position": "C",
            "Jersey": "32",
            "SeasonsWithTeam": "1975-1978",
            "Year": 1989
          },
          {
            "PlayerID": 77420,
            "Player": "Maurice Lucas",
            "Position": "F",
            "Jersey": "20",
            "SeasonsWithTeam": "1977-1980, 1988",
            "Year": 1987
          },
          {
            "PlayerID": 78387,
            "Player": "Dave Twardzik",
            "Position": "G",
            "Jersey": "13",
            "SeasonsWithTeam": "1977-1980",
            "Year": 1981
          },
          {
            "PlayerID": 77844,
            "Player": "Geoff Petrie",
            "Position": "G/F",
            "Jersey": "45",
            "SeasonsWithTeam": "1971-1976",
            "Year": 1981
          },
          {
            "PlayerID": 78245,
            "Player": "Larry Steele",
            "Position": "G",
            "Jersey": "15",
            "SeasonsWithTeam": "1972-1980",
            "Year": 1981
          },
          {
            "PlayerID": 77696,
            "Player": "Lloyd Neal",
            "Position": "F/C",
            "Jersey": "36",
            "SeasonsWithTeam": "1973-1979",
            "Year": 1979
          }
        ]
      }
    ]
  },
  "1610612758": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612758,
            "Abbreviation": "SAC",
            "Nickname": "Kings",
            "YearFounded": 1948,
            "YearActiveTill": "present",
            "City": "Sacramento",
            "Arena": "Sleep Train Arena",
            "ArenaCapacity": "17317",
            "Owner": "Vivek Ranadive",
            "GeneralManager": "Pete D'Alessandro",
            "HeadCoach": "George Karl",
            "DLeagueAffiliation": "Reno Bighorns"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612758,
            "City": "Sacramento",
            "Nickname": "Kings",
            "YearFounded": 1985,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612758,
            "City": "Kansas City",
            "Nickname": "Kings",
            "YearFounded": 1975,
            "YearActiveTill": 1984
          },
          {
            "Team_Id": 1610612758,
            "City": "Kansas City-Omaha",
            "Nickname": "Kings",
            "YearFounded": 1972,
            "YearActiveTill": 1974
          },
          {
            "Team_Id": 1610612758,
            "City": "Cincinnati",
            "Nickname": "Royals",
            "YearFounded": 1957,
            "YearActiveTill": 1971
          },
          {
            "Team_Id": 1610612758,
            "City": "Rochester",
            "Nickname": "Royals",
            "YearFounded": 1948,
            "YearActiveTill": 1956
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/sacramentokings"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/sacramentokings"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/sacramentokings/"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1951, "OppositeTeam": "New York Knicks"}
            ]
          },
          {"ConferenceTitles": []},
          {
            "DivitionalTitles": [
              {"YearAwarded": 1949, "OppositeTeam": null},
              {"YearAwarded": 1952, "OppositeTeam": null},
              {"YearAwarded": 1979, "OppositeTeam": null},
              {"YearAwarded": 2002, "OppositeTeam": null},
              {"YearAwarded": 2003, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 78055,
            "Player": "Ralph Sampson",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1990-1991",
            "Year": 2012
          },
          {
            "PlayerID": 600016,
            "Player": "Maurice Stokes",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1956-1958",
            "Year": 2004
          },
          {
            "PlayerID": 77967,
            "Player": "Arnie Risen",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1949-1955",
            "Year": 1998
          },
          {
            "PlayerID": 76054,
            "Player": "Tiny Archibald",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1971-1976",
            "Year": 1991
          },
          {
            "PlayerID": 77414,
            "Player": "Clyde Lovellette",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1958",
            "Year": 1988
          },
          {
            "PlayerID": 78453,
            "Player": "Bobby Wanzer",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1949-1957",
            "Year": 1987
          },
          {
            "PlayerID": 78388,
            "Player": "Jack Twyman",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1956-1966",
            "Year": 1983
          },
          {
            "PlayerID": 77418,
            "Player": "Jerry Lucas",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1964-1970",
            "Year": 1980
          },
          {
            "PlayerID": 600015,
            "Player": "Oscar Robertson",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1961-1970",
            "Year": 1980
          },
          {
            "PlayerID": 600003,
            "Player": "Bob Cousy",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1970",
            "Year": 1971
          },
          {
            "PlayerID": 76514,
            "Player": "Bob Davies",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1949-1955",
            "Year": 1970
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 185,
            "Player": "Chris Webber",
            "Position": "F",
            "Jersey": "4",
            "SeasonsWithTeam": "1999-2005",
            "Year": 2009
          },
          {
            "PlayerID": 124,
            "Player": "Vlade Divac",
            "Position": "C",
            "Jersey": "21",
            "SeasonsWithTeam": "1999-2004",
            "Year": 2009
          },
          {
            "PlayerID": 782,
            "Player": "Mitch Richmond",
            "Position": "G",
            "Jersey": "2",
            "SeasonsWithTeam": "1992-1998",
            "Year": 2003
          },
          {
            "PlayerID": 600015,
            "Player": "Oscar Robertson",
            "Position": "G",
            "Jersey": "14",
            "SeasonsWithTeam": "1961-1970",
            "Year": 1970
          },
          {
            "PlayerID": 76533,
            "Player": "Bobby Davies",
            "Position": "G",
            "Jersey": "11",
            "SeasonsWithTeam": "1949-1955",
            "Year": null
          },
          {
            "PlayerID": 78388,
            "Player": "Jack Twyman",
            "Position": "F",
            "Jersey": "27",
            "SeasonsWithTeam": "1956-1966",
            "Year": null
          },
          {
            "PlayerID": 600016,
            "Player": "Maurice Stokes",
            "Position": "F",
            "Jersey": "12",
            "SeasonsWithTeam": "1956-1958",
            "Year": null
          },
          {
            "PlayerID": 76054,
            "Player": "Nate \"Tiny\" Archibald",
            "Position": "G",
            "Jersey": "1",
            "SeasonsWithTeam": "1971-1976",
            "Year": null
          },
          {
            "PlayerID": 77326,
            "Player": "Sam Lacey",
            "Position": "C",
            "Jersey": "44",
            "SeasonsWithTeam": "1971-1981",
            "Year": null
          },
          {
            "PlayerID": null,
            "Player": "Sixth Man",
            "Position": null,
            "Jersey": "6",
            "SeasonsWithTeam": null,
            "Year": null
          }
        ]
      }
    ]
  },
  "1610612759": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612759,
            "Abbreviation": "SAS",
            "Nickname": "Spurs",
            "YearFounded": 1976,
            "YearActiveTill": "present",
            "City": "San Antonio",
            "Arena": "AT&T Center",
            "ArenaCapacity": "18797",
            "Owner": "Peter Holt",
            "GeneralManager": "R. C. Buford",
            "HeadCoach": "Gregg Popovich",
            "DLeagueAffiliation": "Austin Spurs"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612759,
            "City": "San Antonio",
            "Nickname": "Spurs",
            "YearFounded": 1976,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/Spurs"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/officialspurs"
          },
          {"AccountType": "Twitter", "WebSite_Link": "http://twitter.com/spurs"}
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1999, "OppositeTeam": "New York Knicks"},
              {"YearAwarded": 2003, "OppositeTeam": "New Jersey Nets"},
              {"YearAwarded": 2005, "OppositeTeam": "Detroit Pistons"},
              {"YearAwarded": 2007, "OppositeTeam": "Cleveland Cavaliers"},
              {"YearAwarded": 2014, "OppositeTeam": "Miami Heat"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1999, "OppositeTeam": null},
              {"YearAwarded": 2003, "OppositeTeam": null},
              {"YearAwarded": 2005, "OppositeTeam": null},
              {"YearAwarded": 2007, "OppositeTeam": null},
              {"YearAwarded": 2013, "OppositeTeam": null},
              {"YearAwarded": 2014, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1978, "OppositeTeam": null},
              {"YearAwarded": 1979, "OppositeTeam": null},
              {"YearAwarded": 1981, "OppositeTeam": null},
              {"YearAwarded": 1982, "OppositeTeam": null},
              {"YearAwarded": 1983, "OppositeTeam": null},
              {"YearAwarded": 1990, "OppositeTeam": null},
              {"YearAwarded": 1991, "OppositeTeam": null},
              {"YearAwarded": 1995, "OppositeTeam": null},
              {"YearAwarded": 1996, "OppositeTeam": null},
              {"YearAwarded": 1999, "OppositeTeam": null},
              {"YearAwarded": 2001, "OppositeTeam": null},
              {"YearAwarded": 2002, "OppositeTeam": null},
              {"YearAwarded": 2003, "OppositeTeam": null},
              {"YearAwarded": 2005, "OppositeTeam": null},
              {"YearAwarded": 2006, "OppositeTeam": null},
              {"YearAwarded": 2009, "OppositeTeam": null},
              {"YearAwarded": 2011, "OppositeTeam": null},
              {"YearAwarded": 2012, "OppositeTeam": null},
              {"YearAwarded": 2013, "OppositeTeam": null},
              {"YearAwarded": 2014, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 600014,
            "Player": "Artis Gilmore",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1983-1987",
            "Year": 2011
          },
          {
            "PlayerID": 23,
            "Player": "Dennis Rodman",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1994-1995",
            "Year": 2011
          },
          {
            "PlayerID": 764,
            "Player": "David Robinson",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1990-2003",
            "Year": 2009
          },
          {
            "PlayerID": 1122,
            "Player": "Dominique Wilkins",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1997",
            "Year": 2006
          },
          {
            "PlayerID": 77449,
            "Player": "Moses Malone",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1995",
            "Year": 2001
          },
          {
            "PlayerID": 76804,
            "Player": "George Gervin",
            "Position": "G/F",
            "Jersey": null,
            "SeasonsWithTeam": "1974-1985",
            "Year": 1996
          },
          {
            "PlayerID": 76912,
            "Player": "Cliff Hagan",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1968-1970",
            "Year": 1978
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 1477,
            "Player": "Bruce Bowen",
            "Position": "F",
            "Jersey": "12",
            "SeasonsWithTeam": "2002-2009",
            "Year": 2012
          },
          {
            "PlayerID": 422,
            "Player": "Avery Johnson",
            "Position": "G",
            "Jersey": "6",
            "SeasonsWithTeam": "1991, 1993, 1995-2001",
            "Year": 2007
          },
          {
            "PlayerID": 251,
            "Player": "Sean Elliott",
            "Position": "F",
            "Jersey": "32",
            "SeasonsWithTeam": "1990-1993, 1995-2001",
            "Year": 2005
          },
          {
            "PlayerID": 764,
            "Player": "David Robinson",
            "Position": "C",
            "Jersey": "50",
            "SeasonsWithTeam": "1990-2003",
            "Year": 2003
          },
          {
            "PlayerID": 77633,
            "Player": "Johnny Moore",
            "Position": "G",
            "Jersey": "00",
            "SeasonsWithTeam": "1981-1988, 1990",
            "Year": 1998
          },
          {
            "PlayerID": 76804,
            "Player": "George Gervin",
            "Position": "G",
            "Jersey": "44",
            "SeasonsWithTeam": "1974-1985",
            "Year": 1987
          },
          {
            "PlayerID": 78150,
            "Player": "James Silas",
            "Position": "G",
            "Jersey": "13",
            "SeasonsWithTeam": "1973-1981",
            "Year": 1984
          }
        ]
      }
    ]
  },
  "1610612761": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612761,
            "Abbreviation": "TOR",
            "Nickname": "Raptors",
            "YearFounded": 1995,
            "YearActiveTill": "present",
            "City": "Toronto",
            "Arena": "Air Canada Centre",
            "ArenaCapacity": "19800",
            "Owner": "Maple Leaf Sports and Entertainment",
            "GeneralManager": "Masai Ujiri",
            "HeadCoach": "Dwane Casey",
            "DLeagueAffiliation": "Raptors 905"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612761,
            "City": "Toronto",
            "Nickname": "Raptors",
            "YearFounded": 1995,
            "YearActiveTill": 2014
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/TorontoRaptors"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/thetorontoraptors"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "http://twitter.com/raptors"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {"ConferenceTitles": []},
          {
            "DivitionalTitles": [
              {"YearAwarded": 2007, "OppositeTeam": null},
              {"YearAwarded": 2014, "OppositeTeam": null},
              {"YearAwarded": 2015, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 165,
            "Player": "Hakeem Olajuwon",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "2002",
            "Year": 2008
          }
        ]
      },
      {"RetiredMembers": []}
    ]
  },
  "1610612762": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612762,
            "Abbreviation": "UTA",
            "Nickname": "Jazz",
            "YearFounded": 1974,
            "YearActiveTill": "present",
            "City": "Utah",
            "Arena": "Vivint Smart Home Arena",
            "ArenaCapacity": "19991",
            "Owner": "Greg Miller",
            "GeneralManager": "Dennis Lindsey",
            "HeadCoach": "Quin Snyder",
            "DLeagueAffiliation": "Idaho Stampede"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612762,
            "City": "Utah",
            "Nickname": "Jazz",
            "YearFounded": 1979,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612762,
            "City": "New Orleans",
            "Nickname": "Jazz",
            "YearFounded": 1974,
            "YearActiveTill": 1978
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/NBAUtahJazz"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/utahjazz"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/utahjazz"
          }
        ]
      },
      {
        "Awards": [
          {"Championships": []},
          {
            "ConferenceTitles": [
              {"YearAwarded": 1997, "OppositeTeam": null},
              {"YearAwarded": 1998, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1984, "OppositeTeam": null},
              {"YearAwarded": 1989, "OppositeTeam": null},
              {"YearAwarded": 1992, "OppositeTeam": null},
              {"YearAwarded": 1997, "OppositeTeam": null},
              {"YearAwarded": 1998, "OppositeTeam": null},
              {"YearAwarded": 1999, "OppositeTeam": null},
              {"YearAwarded": 2000, "OppositeTeam": null},
              {"YearAwarded": 2007, "OppositeTeam": null},
              {"YearAwarded": 2008, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 252,
            "Player": "Karl Malone",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1986-2003",
            "Year": 2010
          },
          {
            "PlayerID": 304,
            "Player": "John Stockton",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1985-2003",
            "Year": 2009
          },
          {
            "PlayerID": 76504,
            "Player": "Adrian Dantley",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1980-1986",
            "Year": 2008
          },
          {
            "PlayerID": 76832,
            "Player": "Gail Goodrich",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1977-1979",
            "Year": 1996
          },
          {
            "PlayerID": 76144,
            "Player": "Walt Bellamy",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1975",
            "Year": 1993
          },
          {
            "PlayerID": 77459,
            "Player": "Pete Maravich",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1975-1980",
            "Year": 1987
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 76504,
            "Player": "Adrian Dantley",
            "Position": "F",
            "Jersey": "4",
            "SeasonsWithTeam": "1980-1986",
            "Year": 2007
          },
          {
            "PlayerID": 252,
            "Player": "Karl Malone",
            "Position": "F",
            "Jersey": "32",
            "SeasonsWithTeam": "1986-2003",
            "Year": 2006
          },
          {
            "PlayerID": 304,
            "Player": "John Stockton",
            "Position": "G",
            "Jersey": "12",
            "SeasonsWithTeam": "1985-2003",
            "Year": 2004
          },
          {
            "PlayerID": 204,
            "Player": "Jeff Hornacek",
            "Position": "G",
            "Jersey": "14",
            "SeasonsWithTeam": "1995-2000",
            "Year": 2002
          },
          {
            "PlayerID": 76631,
            "Player": "Mark Eaton",
            "Position": "C",
            "Jersey": "53",
            "SeasonsWithTeam": "1983-1993",
            "Year": 1996
          },
          {
            "PlayerID": 76890,
            "Player": "Darrell Griffith",
            "Position": "G",
            "Jersey": "35",
            "SeasonsWithTeam": "1981-1991",
            "Year": 1993
          },
          {
            "PlayerID": null,
            "Player": "Frank Layden",
            "Position": "Coach",
            "Jersey": "1",
            "SeasonsWithTeam": "1982-1988",
            "Year": 1988
          },
          {
            "PlayerID": 77459,
            "Player": "Pete Maravich",
            "Position": "G",
            "Jersey": "7",
            "SeasonsWithTeam": "1975-1980",
            "Year": 1985
          },
          {
            "PlayerID": null,
            "Player": "Larry Miller",
            "Position": "Owner",
            "Jersey": "9",
            "SeasonsWithTeam": "1985-2009",
            "Year": null
          },
          {
            "PlayerID": 77082,
            "Player": "Rod Hundley",
            "Position": "Broadcaster",
            "Jersey": " ",
            "SeasonsWithTeam": "1975-2009",
            "Year": null
          }
        ]
      }
    ]
  },
  "1610612764": {
    "TeamDetails": [
      {
        "Details": [
          {
            "Team_Id": 1610612764,
            "Abbreviation": "WAS",
            "Nickname": "Wizards",
            "YearFounded": 1961,
            "YearActiveTill": "present",
            "City": "Washington",
            "Arena": "Verizon Center",
            "ArenaCapacity": "20173",
            "Owner": "Ted Leonsis",
            "GeneralManager": "Ernie Grunfeld",
            "HeadCoach": "Randy Wittman",
            "DLeagueAffiliation": "No Affiliate"
          }
        ]
      },
      {
        "History": [
          {
            "Team_Id": 1610612764,
            "City": "Washington",
            "Nickname": "Wizards",
            "YearFounded": 1997,
            "YearActiveTill": 2014
          },
          {
            "Team_Id": 1610612764,
            "City": "Washington",
            "Nickname": "Bullets",
            "YearFounded": 1974,
            "YearActiveTill": 1996
          },
          {
            "Team_Id": 1610612764,
            "City": "Capital",
            "Nickname": "Bullets",
            "YearFounded": 1973,
            "YearActiveTill": 1973
          },
          {
            "Team_Id": 1610612764,
            "City": "Baltimore",
            "Nickname": "Bullets",
            "YearFounded": 1963,
            "YearActiveTill": 1972
          },
          {
            "Team_Id": 1610612764,
            "City": "Chicago",
            "Nickname": "Zephyrs",
            "YearFounded": 1962,
            "YearActiveTill": 1962
          },
          {
            "Team_Id": 1610612764,
            "City": "Chicago",
            "Nickname": "Packers",
            "YearFounded": 1961,
            "YearActiveTill": 1961
          }
        ]
      },
      {
        "SocialSites": [
          {
            "AccountType": "Facebook",
            "WebSite_Link": "https://www.facebook.com/Wizards"
          },
          {
            "AccountType": "Instagram",
            "WebSite_Link": "http://instagram.com/officialwashingtonwizards/"
          },
          {
            "AccountType": "Twitter",
            "WebSite_Link": "https://twitter.com/washwizards"
          }
        ]
      },
      {
        "Awards": [
          {
            "Championships": [
              {"YearAwarded": 1978, "OppositeTeam": "Seattle SuperSonics"}
            ]
          },
          {
            "ConferenceTitles": [
              {"YearAwarded": 1971, "OppositeTeam": null},
              {"YearAwarded": 1975, "OppositeTeam": null},
              {"YearAwarded": 1978, "OppositeTeam": null},
              {"YearAwarded": 1979, "OppositeTeam": null}
            ]
          },
          {
            "DivitionalTitles": [
              {"YearAwarded": 1969, "OppositeTeam": null},
              {"YearAwarded": 1971, "OppositeTeam": null},
              {"YearAwarded": 1972, "OppositeTeam": null},
              {"YearAwarded": 1973, "OppositeTeam": null},
              {"YearAwarded": 1974, "OppositeTeam": null},
              {"YearAwarded": 1975, "OppositeTeam": null},
              {"YearAwarded": 1979, "OppositeTeam": null}
            ]
          }
        ]
      },
      {
        "HallOfFameInductees": [
          {
            "PlayerID": 78055,
            "Player": "Ralph Sampson",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1992",
            "Year": 2012
          },
          {
            "PlayerID": 77150,
            "Player": "Gus Johnson",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1964-1972",
            "Year": 2010
          },
          {
            "PlayerID": 893,
            "Player": "Michael Jordan",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "2002-2003",
            "Year": 2009
          },
          {
            "PlayerID": 77449,
            "Player": "Moses Malone",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1987-1988",
            "Year": 2001
          },
          {
            "PlayerID": 77070,
            "Player": "Bailey Howell",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1965-1966",
            "Year": 1997
          },
          {
            "PlayerID": 76144,
            "Player": "Walt Bellamy",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1962-1966",
            "Year": 1993
          },
          {
            "PlayerID": 600006,
            "Player": "Earl Monroe",
            "Position": "G",
            "Jersey": null,
            "SeasonsWithTeam": "1968-1972",
            "Year": 1990
          },
          {
            "PlayerID": 76979,
            "Player": "Elvin Hayes",
            "Position": "F",
            "Jersey": null,
            "SeasonsWithTeam": "1973-1981",
            "Year": 1990
          },
          {
            "PlayerID": 78392,
            "Player": "Wes Unseld",
            "Position": "C",
            "Jersey": null,
            "SeasonsWithTeam": "1969-1981",
            "Year": 1988
          }
        ]
      },
      {
        "RetiredMembers": [
          {
            "PlayerID": 600006,
            "Player": "Earl Monroe",
            "Position": "G",
            "Jersey": "10",
            "SeasonsWithTeam": "1968-1972",
            "Year": 2007
          },
          {
            "PlayerID": 77150,
            "Player": "Gus Johnson",
            "Position": "F",
            "Jersey": "25",
            "SeasonsWithTeam": "1964-1972",
            "Year": 1986
          },
          {
            "PlayerID": 76979,
            "Player": "Elvin Hayes",
            "Position": "F",
            "Jersey": "11",
            "SeasonsWithTeam": "1973-1981",
            "Year": null
          },
          {
            "PlayerID": 78392,
            "Player": "Wes Unseld",
            "Position": "C",
            "Jersey": "41",
            "SeasonsWithTeam": "1969-1981",
            "Year": null
          }
        ]
      }
    ]
  },
};

Map teamDetailsExtra = {
  "teams": {
    "config": [
      {
        "teamId": "1610612737",
        "tricode": "ATL",
        "ttsName": "Atlanta Hawks",
        "primaryColor": "#e21a37",
        "secondaryColor": "#e21a37",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.hawks&hl=en",
          "androidDeepLink": "yc-atl-nba://",
          "ios":
              "https://itunes.apple.com/us/app/atlanta-hawks-mobile/id979576290",
          "iosDeepLink": "yc-atl-nba://",
          "tickets":
              "http://m.ticketmaster.com/Atlanta-Hawks-tickets/artist/805898?extcmp=gw500743&wt.mc_id=NBA_LEAGUE_ATL_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/hawks",
          "background-image":
              "https://www.nba.com/hawks/sites/hawks/files/1617_hwk_mk_playoffs_digitaltoolkit_background_white.jpg",
          "tickets": "http://www.nba.com/hawks/tickets"
        }
      },
      {
        "teamId": "1610612751",
        "tricode": "BKN",
        "ttsName": "Brooklyn Nets",
        "primaryColor": "#000000",
        "secondaryColor": "#000000",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.brooklynnets.android&hl=en",
          "androidDeepLink": "yc-bkn-nba://",
          "ios": "https://itunes.apple.com/us/app/brooklyn-nets/id570867939",
          "iosDeepLink": "yc-bkn-nba://",
          "tickets":
              "http://m.ticketmaster.com/Brooklyn-Nets-tickets/artist/805983?extcmp=gw500735&wt.mc_id=NBA_LEAGUE_NETS_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/nets",
          "background-image": "",
          "tickets": "http://www.nba.com/nets/tickets"
        }
      },
      {
        "teamId": "1610612738",
        "tricode": "BOS",
        "ttsName": "Boston Celtics",
        "primaryColor": "#00611b",
        "secondaryColor": "#00611b",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.mobile.android.celtics&hl=en",
          "androidDeepLink": "com.bostonceltics.iphone",
          "ios": "https://itunes.apple.com/us/app/boston-celtics/id577818612",
          "iosDeepLink": "com.mobile.android.celtics",
          "tickets":
              "http://m.ticketmaster.com/Boston-Celtics-tickets/artist/805903?extcmp=gw500745&wt.mc_id=NBA_LEAGUE_BOS_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/celtics",
          "background-image":
              "https://www.nba.com/celtics/sites/celtics/files/2014-celtics-bg-1900x1600_3.jpg",
          "tickets": "http://www.nba.com/celtics/tickets"
        }
      },
      {
        "teamId": "1610612766",
        "tricode": "CHA",
        "ttsName": "Charlotte Hornets",
        "primaryColor": "#00848e",
        "secondaryColor": "#00848e",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.bobcats&hl=en",
          "androidDeepLink": "yc-cha-nba://",
          "ios":
              "https://itunes.apple.com/us/app/charlotte-hornets/id411553578",
          "iosDeepLink": "yc-cha-nba://",
          "tickets":
              "http://m.ticketmaster.com/artist/931493?extcmp=gw500744&wt.mc_id=NBA_LEAGUE_CHA_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/hornets",
          "background-image":
              "https://www.nba.com/hornets/sites/hornets/files/hornets_generic_web_skin.jpg",
          "tickets": "http://www.nba.com/hornets/tickets"
        }
      },
      {
        "teamId": "1610612741",
        "tricode": "CHI",
        "ttsName": "Chicago Bulls",
        "primaryColor": "#b00203",
        "secondaryColor": "#b00203",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.bulls&hl=en",
          "androidDeepLink": "yc-chi-nba://",
          "ios": "https://itunes.apple.com/us/app/chicago-bulls/id731191999",
          "iosDeepLink": "yc-chi-nba://",
          "tickets":
              "http://m.ticketmaster.com/Chicago-Bulls-tickets/artist/805914?extcmp=gw500726&wt.mc_id=NBA_LEAGUE_CHI_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/bulls",
          "background-image":
              "https://www.nba.com/bulls/sites/bulls/files/bulls_game_experience.jpg",
          "tickets": "http://www.nba.com/bulls/tickets"
        }
      },
      {
        "teamId": "1610612739",
        "tricode": "CLE",
        "ttsName": "Cleveland Cavaliers",
        "primaryColor": "#860038",
        "secondaryColor": "#860038",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.detroitlabs.cavaliers&hl=en",
          "androidDeepLink": "yc-cle-nba://",
          "ios":
              "https://itunes.apple.com/us/app/cleveland-cavaliers/id570803648",
          "iosDeepLink": "yc-cle-nba://",
          "tickets":
              "http://theqarena.com/events/?display=list&amp;cat=cavaliers"
        },
        "web": {
          "homepage": "http://www.nba.com/cavaliers",
          "background-image":
              "https://www.nba.com/cavaliers/sites/cavaliers/files/2018-game-tracker-background.jpg",
          "tickets": "http://www.nba.com/cavaliers/tickets"
        }
      },
      {
        "teamId": "1610612742",
        "tricode": "DAL",
        "ttsName": "Dallas Mavericks",
        "primaryColor": "#006bb6",
        "secondaryColor": "#006bb6",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.mobileroadie.app_1202&hl=en",
          "androidDeepLink": "",
          "ios":
              "https://itunes.apple.com/us/app/official-dallas-mavericks/id413372557",
          "iosDeepLink": "",
          "tickets":
              "http://m.ticketmaster.com/Dallas-Mavericks-tickets/artist/805932?extcmp=gw500734&wt.mc_id=NBA_LEAGUE_DAL_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.mavs.com",
          "background-image":
              "https://www.nba.com/mavericks/sites/mavericks/files/mavs-bg.jpg",
          "tickets": "http://www.mavs.com/tickets"
        }
      },
      {
        "teamId": "1610612743",
        "tricode": "DEN",
        "ttsName": "Denver Nuggets",
        "primaryColor": "#0e2240",
        "secondaryColor": "#0e2240",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.b3connect.dmf.nuggets&hl=en",
          "androidDeepLink": "yc-den-nba://",
          "ios": "https://itunes.apple.com/us/app/denver-nuggets/id654784306",
          "iosDeepLink": "yc-den-nba://",
          "tickets":
              "http://www.altitudetickets.com/tags/sports/basketball/?cfc=NUGGETS_MOBILE_GAMETIMEAPP"
        },
        "web": {
          "homepage": "http://www.nba.com/nuggets",
          "background-image": "",
          "tickets": "http://www.nba.com/nuggets/tickets"
        }
      },
      {
        "teamId": "1610612765",
        "tricode": "DET",
        "ttsName": "Detroit Pistons",
        "primaryColor": "#fa002c",
        "secondaryColor": "#fa002c",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.b3connect.dmf.pistons&hl=en",
          "androidDeepLink": "https://u3735.app.goo.gl/CTXh",
          "ios":
              "https://itunes.apple.com/us/app/detroit-pistons-official-mobile/id570797670",
          "iosDeepLink": "https://u3735.app.goo.gl/CTXh",
          "tickets":
              "http://m.ticketmaster.com/Detroit-Pistons-tickets/artist/805937?extcmp=gw500738&wt.mc_id=NBA_LEAGUE_DET_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/pistons",
          "background-image":
              "https://www.nba.com/pistons/sites/pistons/files/2019_background.jpg",
          "tickets": "http://www.nba.com/pistons/tickets"
        }
      },
      {
        "teamId": "1610612744",
        "tricode": "GSW",
        "ttsName": "Golden State Warriors",
        "primaryColor": "#003399",
        "secondaryColor": "#003399",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.warriors&hl=en",
          "androidDeepLink": "yc-gsw-nba://",
          "ios":
              "https://itunes.apple.com/us/app/golden-state-warriors/id516767086",
          "iosDeepLink": "yc-gsw-nba://",
          "tickets":
              "http://m.ticketmaster.com/artist/805946?extcmp=gw500731&wt.mc_id=NBA_LEAGUE_GSW_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/warriors",
          "background-image":
              "https://www.nba.com/warriors/sites/warriors/files/1920-gametracker_0.png",
          "tickets": "http://www.nba.com/warriors/tickets"
        }
      },
      {
        "teamId": "1610612745",
        "tricode": "HOU",
        "ttsName": "Houston Rockets",
        "primaryColor": "#cd212b",
        "secondaryColor": "#cd212b",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.rockets&hl=en",
          "androidDeepLink": "yc-hou-nba://",
          "ios": "https://itunes.apple.com/us/app/houston-rockets/id751632134",
          "iosDeepLink": "yc-hou-nba://",
          "tickets":
              "http://www.houstontoyotacenter.com/events/category/rockets?cid=gametimeapp_tickets_rockets"
        },
        "web": {
          "homepage": "http://www.nba.com/rockets",
          "background-image":
              "https://www.nba.com/rockets/sites/rockets/files/game-experience-graphic_02.jpg",
          "tickets": "http://www.nba.com/rockets/tickets"
        }
      },
      {
        "teamId": "1610612754",
        "tricode": "IND",
        "ttsName": "Indiana Pacers",
        "primaryColor": "#ffb517",
        "secondaryColor": "#ffb517",
        "textColor": "#000000",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.pacers&hl=en",
          "androidDeepLink": "yc-ind-nba://",
          "ios":
              "https://itunes.apple.com/us/app/indiana-pacers-official/id858169562",
          "iosDeepLink": "yc-ind-nba://",
          "tickets":
              "http://m.ticketmaster.com/Indiana-Pacers-tickets/artist/805952?extcmp=gw500739&wt.mc_id=NBA_LEAGUE_IND_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/pacers",
          "background-image":
              "https://www.nba.com/pacers/sites/pacers/files/2017-18-sitebackground-logo.png",
          "tickets": "http://www.nba.com/pacers/tickets"
        }
      },
      {
        "teamId": "1610612746",
        "tricode": "LAC",
        "ttsName": "L.A. Clippers",
        "primaryColor": "#ed174b",
        "secondaryColor": "#ed174b",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.lucidappeal.laclippers&hl=en",
          "androidDeepLink": "yc-lac-nba://",
          "ios": "https://itunes.apple.com/us/app/la-clippers/id521606689",
          "iosDeepLink": "yc-lac-nba://",
          "tickets":
              "http://m.axs.com/artists/113909/los-angeles-clippers-tickets?cid=nbatickets_gametime_general"
        },
        "web": {
          "homepage": "http://www.nba.com/clippers",
          "background-image":
              "https://www.nba.com/clippers/sites/clippers/files/background-image-for-header_clippers.jpg",
          "tickets": "http://www.nba.com/clippers/tickets"
        }
      },
      {
        "teamId": "1610612747",
        "tricode": "LAL",
        "ttsName": "L.A. Lakers",
        "primaryColor": "#fdba33",
        "secondaryColor": "#fdba33",
        "textColor": "#000000",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.lucidappeal.appmold&hl=en",
          "androidDeepLink": "yc-lal-nba://",
          "ios":
              "https://itunes.apple.com/us/app/los-angeles-lakers-official/id578834522",
          "iosDeepLink": "yc-lal-nba://",
          "tickets":
              "http://m.ticketmaster.com/Los-Angeles-Lakers-tickets/artist/805962?extcmp=gw002391&wt.mc_id=NBA_LEAGUE_LAL_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/lakers",
          "background-image":
              "https://www.nba.com/lakers/sites/lakers/files/1920_lal_mktg_gametracker_2000x600.jpg",
          "tickets": "http://www.nba.com/lakers/tickets"
        }
      },
      {
        "teamId": "1610612763",
        "tricode": "MEM",
        "ttsName": "Memphis Grizzlies",
        "primaryColor": "#5d76a9",
        "secondaryColor": "#5d76a9",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.grizzlies&hl=en",
          "androidDeepLink": "yc-mem-nba://",
          "ios":
              "https://itunes.apple.com/us/app/memphis-grizzlies/id787339433",
          "iosDeepLink": "yc-mem-nba://",
          "tickets":
              "http://www.ticketmaster.com/Memphis-Grizzlies-tickets/artist/806038?webview=1&brand=nba&camefromNBAGRIZZLIES_GTAPP"
        },
        "web": {
          "homepage": "http://www.nba.com/grizzlies",
          "background-image":
              "https://www.nba.com/grizzlies/sites/grizzlies/files/pattern_navy_background_0.jpg",
          "tickets": "http://www.nba.com/grizzlies/tickets"
        }
      },
      {
        "teamId": "1610612748",
        "tricode": "MIA",
        "ttsName": "Miami Heat",
        "primaryColor": "#98002e",
        "secondaryColor": "#98002e",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.xcosoftware.miamiheat&hl=en",
          "androidDeepLink": "mh://",
          "ios":
              "https://itunes.apple.com/us/app/miami-heat-mobile/id497407923",
          "iosDeepLink": "mh://",
          "tickets":
              "http://m.ticketmaster.com/Miami-Heat-tickets/artist/805966?extcmp=gw500732&wt.mc_id=NBA_LEAGUE_MIA_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/heat",
          "background-image":
              "https://www.nba.com/heat/sites/heat/files/heat_game_experience.jpg",
          "tickets": "http://www.nba.com/heat/tickets"
        }
      },
      {
        "teamId": "1610612749",
        "ttsName": "Milwaukee Bucks",
        "tricode": "MIL",
        "primaryColor": "#00471b",
        "secondaryColor": "#00471b",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.bucks&hl=en",
          "androidDeepLink": "yc-mil-nba://",
          "ios": "https://itunes.apple.com/us/app/milwaukee-bucks/id731188767",
          "iosDeepLink": "yc-mil-nba://",
          "tickets":
              "http://m.ticketmaster.com/Milwaukee-Bucks-tickets/artist/805969?extcmp=gw500737&wt.mc_id=NBA_LEAGUE_MIL_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/bucks",
          "background-image":
              "https://www.nba.com/bucks/sites/bucks/files/gettyimages-491586636-2.jpg",
          "tickets": "http://www.nba.com/bucks/tickets"
        }
      },
      {
        "teamId": "1610612750",
        "tricode": "MIN",
        "ttsName": "Minnesota Timberwolves",
        "primaryColor": "#2b6291",
        "secondaryColor": "#2b6291",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.timberwolves&hl=en",
          "androidDeepLink": "yc-min-nba://",
          "ios":
              "https://itunes.apple.com/us/app/minnesota-timberwolves/id942701008?mt=8",
          "iosDeepLink": "yc-min-nba://",
          "tickets":
              "http://m.ticketmaster.com/Minnesota-Timberwolves-tickets/artist/805971?extcmp=gw500725&wt.mc_id=NBA_LEAGUE_MIN_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/timberwolves",
          "background-image":
              "https://www.nba.com/timberwolves/sites/timberwolves/files/wolves-game-tracker-cover-logo-170717.jpg",
          "tickets": "http://www.nba.com/timberwolves/tickets"
        }
      },
      {
        "teamId": "1610612740",
        "tricode": "NOP",
        "ttsName": "New Orleans Pelicans",
        "primaryColor": "#0c2340",
        "secondaryColor": "#0c2340",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.pelicans&hl=en",
          "androidDeepLink": "yc-nop-nba://",
          "ios":
              "https://itunes.apple.com/us/app/new-orleans-pelicans/id720553754",
          "iosDeepLink": "yc-nop-nba://",
          "tickets":
              "http://m.ticketmaster.com/New-Orleans-Pelicans-tickets/artist/805910?extcmp=gw500741&wt.mc_id=NBA_LEAGUE_NO_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/pelicans",
          "background-image":
              "https://www.nba.com/pelicans/sites/pelicans/files/gametracker-bkgd2-1920.jpg",
          "tickets": "http://www.nba.com/pelicans/tickets"
        }
      },
      {
        "teamId": "1610612752",
        "tricode": "NYK",
        "ttsName": "New York Knicks",
        "primaryColor": "#f58426",
        "secondaryColor": "#f58426",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.msgi.knicks&hl=en",
          "androidDeepLink": "yc-nyk-nba://",
          "ios":
              "https://itunes.apple.com/us/app/new-york-knicks-official-app/id498010853",
          "iosDeepLink": "yc-nyk-nba://",
          "tickets":
              "http://m.ticketmaster.com/New-York-Knicks-tickets/artist/805988?extcmp=gw002390&wt.mc_id=NBA_LEAGUE_NY_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/knicks",
          "background-image":
              "https://www.nba.com/knicks/sites/knicks/files/site_bkgd_0.png",
          "tickets": "http://www.nba.com/knicks/tickets"
        }
      },
      {
        "teamId": "1610612760",
        "tricode": "OKC",
        "ttsName": "Oklahoma City Thunder",
        "primaryColor": "#002d62",
        "secondaryColor": "#002d62",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.thunder&hl=en",
          "androidDeepLink": "yc-okc-nba://",
          "ios":
              "https://itunes.apple.com/us/app/oklahoma-city-thunder/id731118829",
          "iosDeepLink": "yc-okc-nba://",
          "tickets":
              "http://m.ticketmaster.com/Oklahoma-City-OKC-Thunder-tickets/artist/1250512?extcmp=gw500728&wt.mc_id=NBA_LEAGUE_OKC_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/thunder",
          "background-image":
              "https://www.nba.com/thunder/sites/thunder/files/grid-bg-1718_0.jpg",
          "tickets": "http://www.nba.com/thunder/tickets"
        }
      },
      {
        "teamId": "1610612753",
        "tricode": "ORL",
        "ttsName": "Orlando Magic",
        "primaryColor": "#0077c0",
        "secondaryColor": "#0077c0",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.magic&hl=en",
          "androidDeepLink": "orlandomagic://",
          "ios":
              "https://itunes.apple.com/us/app/orlando-magic-mobile/id731742786",
          "iosDeepLink": "orlandomagic://",
          "tickets":
              "http://m.ticketmaster.com/Orlando-Magic-tickets/artist/805995?extcmp=gw500733&wt.mc_id=NBA_LEAGUE_ORL_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/magic",
          "background-image":
              "https://www.nba.com/magic/sites/magic/files/gameblock-bg-2017.jpg",
          "tickets": "http://www.nba.com/magic/tickets"
        }
      },
      {
        "teamId": "1610612755",
        "tricode": "PHI",
        "ttsName": "Philadelphia 76ers",
        "primaryColor": "#ef0022",
        "secondaryColor": "#ef0022",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.sixers&hl=en",
          "androidDeepLink": "yc-phi-nba://",
          "ios":
              "https://itunes.apple.com/us/app/philadelphia-76ers/id731147513",
          "iosDeepLink": "yc-phi-nba://",
          "tickets":
              "http://ev10.evenue.net/cgi-bin/ncommerce3/SEGetEventList?groupCode=76SINGLE&linkID=global-sixers&RSRC=NBA_Gametime_Mobile_App&RDAT=701U0000000Uy18"
        },
        "web": {
          "homepage": "http://www.nba.com/sixers",
          "background-image":
              "https://www.nba.com/sixers/sites/sixers/files/1920-gametracker-bg.jpg",
          "tickets": "http://www.nba.com/sixers/tickets"
        }
      },
      {
        "teamId": "1610612756",
        "tricode": "PHX",
        "ttsName": "Phoenix Suns",
        "primaryColor": "#e76221",
        "secondaryColor": "#e76221",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.suns&hl=en",
          "androidDeepLink": "yc-phx-nba://",
          "ios":
              "https://itunes.apple.com/us/app/phoenix-suns-mobile/id522164105",
          "iosDeepLink": "yc-phx-nba://",
          "tickets":
              "http://m.ticketmaster.com/Phoenix-Suns-tickets/artist/806004?extcmp=gw500740&wt.mc_id=NBA_LEAGUE_PHX_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/suns",
          "background-image":
              "https://www.nba.com/suns/sites/suns/files/newsuns_bg.png",
          "tickets": "http://www.nba.com/suns/tickets"
        }
      },
      {
        "teamId": "1610612757",
        "tricode": "POR",
        "ttsName": "Portland Trail Blazers",
        "primaryColor": "#cc0000",
        "secondaryColor": "#cc0000",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.trailblazers&hl=en",
          "androidDeepLink": "yc-por-nba://",
          "ios":
              "https://itunes.apple.com/us/app/portland-trail-blazers/id573576267",
          "iosDeepLink": "yc-por-nba://",
          "tickets":
              "http://m.ticketmaster.com/Portland-Trail-Blazers-tickets/artist/806009?extcmp=gw504110&wt.mc_id=NBA_LEAGUE_POR_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/blazers",
          "background-image":
              "https://www.nba.com/blazers/sites/blazers/files/background.png",
          "tickets": "http://www.nba.com/blazers/tickets"
        }
      },
      {
        "teamId": "1610612758",
        "tricode": "SAC",
        "ttsName": "Sacramento Kings",
        "primaryColor": "#51388a",
        "secondaryColor": "#51388a",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.kings&hl=en",
          "androidDeepLink": "kingsapp://",
          "ios": "https://itunes.apple.com/us/app/sacramento-kings/id553358391",
          "iosDeepLink": "kingsapp://",
          "tickets":
              "http://m.ticketmaster.com/Sacramento-Kings-tickets/artist/806010?extcmp=gw500727&amp;wt.mc_id=NBA_LEAGUE_SAC_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/kings",
          "background-image":
              "https://www.nba.com/kings/sites/kings/files/gameday_takeoverheader.jpg",
          "tickets": "http://www.nba.com/kings/tickets"
        }
      },
      {
        "teamId": "1610612759",
        "tricode": "SAS",
        "ttsName": "San Antonio Spurs",
        "primaryColor": "#959191",
        "secondaryColor": "#959191",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.spurs&hl=en",
          "androidDeepLink": "yc-sas-nba://",
          "ios":
              "https://itunes.apple.com/us/app/san-antonio-spurs/id775446770",
          "iosDeepLink": "yc-sas-nba://",
          "tickets":
              "http://m.ticketmaster.com/San-Antonio-Spurs-tickets/artist/806012?extcmp=gw500729&wt.mc_id=NBA_LEAGUE_SAN_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/spurs",
          "background-image":
              "https://www.nba.com/spurs/sites/spurs/files/slatebg.jpg",
          "tickets": "http://www.nba.com/spurs/tickets"
        }
      },
      {
        "teamId": "1610612761",
        "tricode": "TOR",
        "ttsName": "Toronto Raptors",
        "primaryColor": "#bd1b21",
        "secondaryColor": "#bd1b21",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.oneup.raptors&hl=en",
          "androidDeepLink":
              "https://play.google.com/store/apps/details?id=com.oneup.raptors",
          "ios": "https://itunes.apple.com/us/app/raptors-mobile/id563960448",
          "iosDeepLink": "http://apple.co/1RrlUFY",
          "tickets":
              "http://www.ticketmaster.ca/Toronto-Raptors-tickets/artist/806034?webview=1&brand=nba&camefromNBARAPTORS_GTAPP"
        },
        "web": {
          "homepage": "http://www.nba.com/raptors",
          "background-image":
              "https://www.nba.com/raptors/sites/raptors/files/1718-default-header-image.jpg",
          "tickets": "http://www.nba.com/raptors/tickets"
        }
      },
      {
        "teamId": "1610612762",
        "tricode": "UTA",
        "ttsName": "Utah Jazz",
        "primaryColor": "#f9a11e",
        "secondaryColor": "#f9a11e",
        "textColor": "#000000",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.jazz&hl=en",
          "androidDeepLink": "yc-uta-nba://",
          "ios":
              "https://itunes.apple.com/us/app/utah-jazz-official-app-jazz/id716118894",
          "iosDeepLink": "yc-uta-nba://",
          "tickets": "http://smithstix.com/sports/all-sports/basketball/events"
        },
        "web": {
          "homepage": "http://www.nba.com/jazz",
          "background-image":
              "https://www.nba.com/jazz/sites/jazz/files/jaz1718_gametracker2000x600.jpg",
          "tickets": "http://www.nba.com/jazz/tickets"
        }
      },
      {
        "teamId": "1610612764",
        "tricode": "WAS",
        "ttsName": "Washington Wizards",
        "primaryColor": "#cf142b",
        "secondaryColor": "#cf142b",
        "textColor": "#FFFFFF",
        "app": {
          "android":
              "https://play.google.com/store/apps/details?id=com.yinzcam.nba.wizards&hl=en",
          "androidDeepLink": "yc-was-nba://",
          "ios":
              "https://itunes.apple.com/us/app/washington-wizards/id518100653",
          "iosDeepLink": "yc-was-nba://",
          "tickets":
              "http://m.ticketmaster.com/Washington-Wizards-tickets/artist/806042?extcmp=gw500730&wt.mc_id=NBA_LEAGUE_WAS_MOBILE_APP_LINK"
        },
        "web": {
          "homepage": "http://www.nba.com/wizards",
          "background-image":
              "https://www.nba.com/wizards/sites/wizards/files/1718-bg-2120x18002.jpg",
          "tickets": "http://www.nba.com/wizards/tickets"
        }
      },
    ]
  }
};
