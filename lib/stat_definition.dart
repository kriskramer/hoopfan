// Pulled from https://www.nba.com/stats/help/glossary/
Map allStats = {
  "%3PA": {
    "Name": "Percent of Team's 3 Point Field Goals Attempted",
    "Definition":
        "The percentage of a team's 3 point field goals attempted that a player has while on the court",
    "Labels": ["%3PA", "% 3PA"]
  },
  "%3PM": {
    "Name": "Percent of Team's 3 Point Field Goals Made",
    "Definition":
        "The percentage of a team's 3 point field goals that a player has made while on the court",
    "Labels": ["%3PM", "% 3PM"]
  },
  "%AST": {
    "Name": "Percent of Team's Assists",
    "Definition":
        "The percentage of a team's assists that a player has while on the court",
    "Labels": ["%AST", "% AST"]
  },
  "%BLK": {
    "Name": "Percent of Team's Blocks",
    "Definition":
        "The percentage of a team's blocks that a player has while on the court",
    "Labels": ["%BLK", "% BLK"]
  },
  "%BLKA": {
    "Name": "Percent of Team's Blocked Field Goal Attempts",
    "Definition":
        "The percentage of a team's own blocked field goal attempts that a player has while on the court",
    "Labels": ["%BLKA", "% BLKA"]
  },
  "%DREB": {
    "Name": "Percent of Team's Defensive Rebounds",
    "Definition":
        "The percentage of a team's defensive rebounds that a player has while on the court",
    "Labels": ["%DREB", "% DREB"]
  },
  "%FGA": {
    "Name": "Percent of Team's Field Goals Attempted",
    "Definition":
        "The percentage of a team's field goals attempted that a player has attempted while on the court",
    "Labels": ["%FGA", "% FGA"]
  },
  "%FGA 2PT": {
    "Name": "Percent of Field Goals Attempted (2 Pointers)",
    "Definition":
        "The percentage of field goals attempted by a player or team that are 2 pointers",
    "Labels": ["%FGA 2PT", "% FGA 2PT", "% FGA 2P"]
  },
  "%FGA 3PT": {
    "Name": "Percent of Field Goals Attempted (3 Pointers)",
    "Definition":
        "The percentage of field goals attempted by a player or team that are 3 pointers",
    "Labels": ["%FGA 3PT", "% FGA 3PT", "% FGA 3P"]
  },
  "%FGM": {
    "Name": "Percent of Team's Field Goals Made",
    "Definition":
        "The percentage of a team's made field goals that a player has made while on the court",
    "Labels": ["%FGM", "% FGM"]
  },
  "%FTA": {
    "Name": "Percent of Team's Free Throws Attempted",
    "Definition":
        "The percentage of a team's free throws attempted that a player has attempted while on the court",
    "Labels": ["%FTA", "% FTA"]
  },
  "%FTM": {
    "Name": "Percent of Team's Free Throws Made",
    "Definition":
        "The percentage of a team's made free throws that a player has made while on the court",
    "Labels": ["%FTM", "% FTM"]
  },
  "%OREB": {
    "Name": "Percent of Team's Offensive Rebounds",
    "Definition":
        "The percentage of a team's offensive rebounds that a player has while on the court",
    "Labels": ["%OREB", "% OREB"]
  },
  "%PF": {
    "Name": "Percent of Team's Personal Fouls",
    "Definition":
        "The percentage of a team's personal fouls that a player has while on the court",
    "Labels": ["%PF", "% PF"]
  },
  "%PFD": {
    "Name": "Percent of Team's Personal Fouls Drawn",
    "Definition":
        "The percentage of a team's personal fouls drawn that a player has while on the court",
    "Labels": ["%PFD", "% PFD"]
  },
  "%PTS": {
    "Name": "Percent of Team's Points",
    "Definition":
        "The percentage of a team's points that a player has while on the court",
    "Labels": ["%PTS", "% PTS"]
  },
  "%PTS 2PT": {
    "Name": "Percent of Points (2-Point Field Goals)",
    "Definition":
        "The percentage of points scored by a player or team that are from 2 point field goals",
    "Labels": ["%PTS 2PT", "% PTS 2PT", "% PTS 2P"]
  },
  "%PTS 2PT MR": {
    "Name": "Percent of Points (2-Point Field Goals: Mid Range)",
    "Definition":
        "The percentage of points scored by a player or team that are that are from mid-range field goals (2 point field goals from outside the paint)",
    "Labels": ["%PTS 2PT MR", "% PTS 2PT MR", "% PTS 2P MR"]
  },
  "%PTS 3PT": {
    "Name": "Percent of Points (3-Point Field Goals)",
    "Definition":
        "The percentage of points scored by a player or team that are from 3 point field goals",
    "Labels": ["%PTS 3PT", "% PTS 3PT", "% PTS 3P"]
  },
  "%PTS FBPS": {
    "Name": "Percent of Points (Fast Break Points)",
    "Definition":
        "The percentage of points scored by a player or team that are from fast break opportunities",
    "Labels": ["%PTS FBPS", "% PTS FBPS", "%PTS FB", "% PTS FB"]
  },
  "%PTS FT": {
    "Name": "Percent of Points (Free Throws)",
    "Definition":
        "The percentage of points scored by a player or team that are from free throws",
    "Labels": ["%PTS FT", "% PTS FT"]
  },
  "%PTS OFF TO": {
    "Name": "Percent of Points (Off Turnovers)",
    "Definition":
        "The percentage of points scored by a player or team that are scored on the possession after forcing an opponent turnover",
    "Labels": ["%PTS OFF TO", "% PTS OFF TO", "%PTS OFF TOV", "% PTS OFF TOV"]
  },
  "%PTS PITP": {
    "Name": "Percent of Points (Points in the Paint)",
    "Definition":
        "The percentage of points scored by a player or team that are scored in the paint",
    "Labels": ["%PTS PITP", "% PTS PITP", "% PTS PAINT"]
  },
  "%STL": {
    "Name": "Percent of Team's Steals",
    "Definition":
        "The percentage of a team's steals that a player has while on the court",
    "Labels": ["%STL", "% STL"]
  },
  "%TOV": {
    "Name": "Percent of Team's Turnovers",
    "Definition":
        "The percentage of a team's turnovers that a player has while on the court",
    "Labels": ["%TOV", "% TOV", "%TO", "% TO"]
  },
  "2FG FREQ": {
    "Name": "2 Point Field Goal Frequency",
    "Definition":
        "The percentage of opponent field goal attempts that fit the specified criteria",
    "Formula": "(2FGA)/(FGA)",
    "Labels": ["2FG FREQ", "2P FREQ"]
  },
  "2FG%": {
    "Name": "2 Point Field Goal Percentage",
    "Definition":
        "The percentage of 2 point field goal attempts of a specified criteria that a player or team makes",
    "Formula": "(2FGM)/(2FGA)",
    "Labels": ["2FG%", "2FG %"]
  },
  "2FGA": {
    "Name": "2 Point Field Goals Attempted",
    "Definition":
        "The number of 2 point field goals that a player or team has attempted that fit the specified criteria",
    "Labels": ["2FGA", "2PA", "FG2A"]
  },
  "2FGM": {
    "Name": "2 Point Field Goals Made",
    "Definition":
        "The number of 2 point field goals that a player or team has made that fit the specified criteria",
    "Labels": ["2FGM", "2PM", "FG2M"]
  },
  "2FGM %AST": {
    "Name": "Percent of 2 Point Field Goals Made Assisted",
    "Definition":
        "The percentage of 2 point field goals made by a player or team that are assisted by a teammate",
    "Labels": ["2FGM %AST", "2FGM % AST", "% AST 2P"]
  },
  "2FGM %UAST": {
    "Name": "Percent of 2 Point Field Goals Made Unassisted",
    "Definition":
        "The percentage of 2 point field goals made by a player or team that are not assisted by a teammate",
    "Labels": ["2FGM %UAST", "2FGM % UAST", "% UAST 2P"]
  },
  "2nd PTS": {
    "Name": "Second Chance Points",
    "Definition":
        "The percentage of isolation plays where a player or team shoots free throws as the result of a shooting foul",
    "Labels": ["2nd PTS", "2nd Chance Pts", "PTS 2ND CHANCE"]
  },
  "3FG FREQ": {
    "Name": "3 Point Field Goal Frequency",
    "Definition":
        "The percentage of opponent field goal attempts of the specified criteria that are 3 point attempts",
    "Formula": "(3FGA)/(FGA)",
    "Labels": ["3FG FREQ", "3P FREQ"]
  },
  "3FGM %AST": {
    "Name": "Percent of 3 Point Field Goals Made Assisted",
    "Definition":
        "The percentage of 3 point field goals made by a player or team that are assisted by a teammate",
    "Labels": ["3FGM %AST", "3FGM % AST", "% AST 3P"]
  },
  "3FGM % UAST": {
    "Name": "Percent of 3 Point Field Goals Made Unassisted",
    "Definition":
        "The percentage of 3 point field goals made by a player or team that are not assisted by a teammate",
    "Labels": ["3FGM %UAST", "3FGM % UAST", "% UAST 3P"]
  },
  "3P%": {
    "Name": "3 Point Field Goal Percentage",
    "Definition":
        "The percentage of 3 point field goal attempts that a player makes",
    "Formula": "(3PM)/(3PA)",
    "Type": "Traditional ",
    "Labels": ["3P%", "FG3%", "3P %", "FG3PCT", "FG3 PCT"],
  },
  "FG3A": {
    "Name": "3 Point Field Goals Attempted",
    "Definition":
        "The number of 3 point field goals that a player or team has attempted",
    "Type": "Traditional ",
    "Labels": ["FG3A", "3PA"]
  },
  "FG3M": {
    "Name": "3 Point Field Goals Made",
    "Definition":
        "The number of 3 point field goals that a player or team has made",
    "Type": "Traditional ",
    "Labels": ["FG3M", "3PM"]
  },
  "+/-": {
    "Name": "Plus-Minus",
    "Definition":
        "The point differential when a player or team is on the floor",
    "Type": "Traditional ",
    "Labels": ["+/-", "PLUS MINUS", "PLUSMINUS", "PLUS-MINUS"]
  },
  "Adjusted DREB Chance %": {
    "Name": "Adjusted Defensive Rebound Chance Percentage",
    "Definition":
        "Percentage of rebounds gathered when given a rebound chance on defense; excludes all deferred rebounds",
    "Formula": "(DREB)/(DREB Chances - Deferred DREB Chances)",
    "Type": "Rebounding ",
    "Labels": ["Adjusted DREB Chance %"]
  },
  "Adjusted OREB Chance %": {
    "Name": "Adjusted Offensive Rebound Chance Percentage",
    "Definition":
        "Percentage of rebounds gathered when given a rebound chance on offense; excludes all deferred rebounds",
    "Formula": "(OREB)/(OREB Chances - Deferred OREB Chances)",
    "Type": "Rebounding ",
    "Labels": ["Adjusted OREB Chance %"]
  },
  "Adjusted REB Chance %": {
    "Name": "Adjusted Rebound Chance Percentage",
    "Definition":
        "Percentage of rebounds gathered when given a rebound chance; excludes all deferred rebounds",
    "Formula": "(REB)/(REB Chances - Deferred REB Chances)",
    "Type": "Rebounding "
  },
  "And One Freq": {
    "Name": "And One Frequency",
    "Definition":
        "The percentage of plays where a player or team makes a field goal while also being awarded a free throw attempt due to a shooting foul",
    "Type": "Play ",
  },
  "AST": {
    "Name": "Assists",
    "Definition":
        "The number of assists -- passes that lead directly to a made basket -- by a player",
    "Type": "Traditional "
  },
  "AST ADJ": {
    "Name": "Assists Adjusted",
    "Definition":
        "The total sum of a player or team's assists, free throw assists, and secondary assists",
    "Type": "Tracking "
  },
  "AST Per 100 Events": {
    "Definition":
        "Assists by the player off that event type divided by the number of events for that player, multiplied by 100",
    "Type": "Tracking"
  },
  "AST PTS Created": {
    "Name": "Assist Points Created",
    "Definition": "Points created by a player or team through their assists",
    "Type": "Tracking "
  },
  "AST Ratio": {
    "Name": "Assist Ratio",
    "Definition":
        "Assist Ratio is the number of assists a player averages per 100 possessions used",
    "Formula": "(AST * 100) / (POSS)",
    "Type": "Advanced "
  },
  "AST to PASS%": {
    "Name": "Assist to Pass Percentage",
    "Definition":
        "The percentage of passes by a player or team that are assists",
    "Formula": "(Assists)/(Passes Made)",
    "Type": "Tracking "
  },
  "AST to PASS% ADJ": {
    "Name": "Assist to Pass Percentage Adjusted",
    "Definition":
        "The percentage of passes by a player or team that are assists, free throw assists, or secondary assists",
    "Formula": "(Adjusted Assists)/(Passes Made)",
    "Type": "Tracking "
  },
  "AST %": {
    "Name": "Assist Percentage",
    "Definition":
        "The percentage of teammate field goals a player assisted on while they were on the floor",
    "Formula": "AST / (TmFGM - FGM)",
    "Type": "Advanced ",
    "Labels": ["AST%", "AST %"]
  },
  "AST/TO": {
    "Name": "Assist to Turnover Ratio",
    "Definition":
        "The number of assists for a player or team compared to the number of turnovers they have committed",
    "Type": "Advanced ",
    "Labels": ["AST/TO", "AST/TOV"]
  },
  "AVG DREB Distance": {
    "Name": "Average Defensive Rebound Distance",
    "Definition": "The average distance of a defensive rebound",
    "Type": "Rebounding "
  },
  "AVG DRIB PER TOUCH": {
    "Name": "Average Dribbles per Touch",
    "Definition":
        "The average number of dribbles a player or team takes per touch",
    "Type": "Tracking "
  },
  "AVG OREB Distance": {
    "Name": "Average Offensive Rebound Distance",
    "Definition": "The average distance of an offensive rebound",
    "Type": "Rebounding "
  },
  "AVG REB Distance": {
    "Name": "Average Rebound Distance",
    "Definition": "The average distance of a rebound",
    "Type": "Rebounding "
  },
  "AVG SEC PER TOUCH": {
    "Name": "Average Seconds per Touch",
    "Definition": "The average number of seconds per touch by a player or team",
    "Type": "Tracking "
  },
  "Avg Speed": {
    "Name": "Average Speed",
    "Definition":
        "The average speed in miles per hour of all movements (sprinting, jogging, standing, walking) by a player or team while on the court",
    "Type": "Tracking "
  },
  "Avg Speed Def": {
    "Name": "Average Speed Defense",
    "Definition":
        "The average speed in miles per hour of all movements (sprinting, jogging, standing, walking) by a player or team while on defense",
    "Type": "Tracking "
  },
  "Avg Speed Off": {
    "Name": "Average Speed Offense",
    "Definition":
        "The average speed in miles per hour of all movements (sprinting, jogging, standing, walking) by a player or team while on offense",
    "Type": "Tracking "
  },
  "BLK": {
    "Name": "Blocks",
    "Definition":
        "A block occurs when an offensive player attempts a shot, and the defense player tips the ball, blocking their chance to score",
    "Type": "Traditional "
  },
  "BLKA": {
    "Name": "Blocks Against",
    "Definition":
        "The number of shots attempted by a player or team that are blocked by a defender",
    "Type": "Traditional "
  },
  "Body Fat %": {
    "Name": "Body Fat Percentage",
    "Definition": "Body Fat Percentage",
    "Type": "Combine "
  },
  "Boxouts": {
    "Name": "Boxouts",
    "Definition":
        "The number of times a player made physical contact with an opponent who was actively pursuing a rebound, showed visible progress or strong effort in disadvantaging the opponent, and successfully prevented that opponent from securing the rebound",
    "Type": "Hustle "
  },
  "Catch Shoot FG%": {
    "Name": "Catch Shoot Field Goal Percentage",
    "Definition":
        "The field goal percentage by a player or team on Catch and Shoot shots",
    "Type": "Tracking "
  },
  "Catch Shoot PTS": {
    "Name": "Catch Shoot Points",
    "Definition":
        "The number of points scored by a player or team on Catch and Shoot shots",
    "Type": "Tracking "
  },
  "Charges Drawn": {
    "Name": "Charges Drawn",
    "Definition":
        "The number of times a defensive player or team draws a charge",
    "Type": "Hustle "
  },
  "Close Touch": {
    "Definition":
        "Any touch where the player receives the ball within 5 feet of the basket",
    "Type": "Tracking "
  },
  "College Break Left": {
    "Name": "College Break Left",
    "Definition":
        "A player takes five shots from the left break area of the court. The shot is from the distance of a college three pointer (20 ft. 9 in.)",
    "Type": "Combine "
  },
  "College Break Right": {
    "Name": "College Break Right",
    "Definition":
        "A player takes five shots from the right break area of the court. The shot is from the distance of a college three pointer (20 ft. 9 in.)",
    "Type": "Combine "
  },
  "College Corner Left": {
    "Name": "College Corner Left",
    "Definition":
        "A player takes five shots from the left corner area of the court. The shot is from the distance of a college three pointer (20 ft. 9 in.)",
    "Type": "Combine "
  },
  "College Corner Right": {
    "Name": "College Corner Right",
    "Definition":
        "A player takes five shots from the right corner area of the court. The shot is from the distance of a college three pointer (20 ft. 9 in.)",
    "Type": "Combine "
  },
  "College Top Key": {
    "Name": "College Top Key",
    "Definition":
        "A player takes five shots from the top of the key. The shot is from the distance of a college three pointer (20 ft. 9 in.)",
    "Type": "Combine "
  },
  "Contested 2PT Shots": {
    "Name": "Contested 2PT Shots",
    "Definition":
        "The number of times a defensive player or team closes out and raises a hand to contest a 2 point shot prior to its release",
    "Type": "Hustle "
  },
  "Contested 3PT Shots": {
    "Name": "Contested 3PT Shots",
    "Definition":
        "The number of times a defensive player or team closes out and raises a hand to contest a 3 point shot prior to its release",
    "Type": "Hustle "
  },
  "Contested DREB": {
    "Name": "Contested Defensive Rebounds",
    "Definition":
        "A defensive rebound where an opponent is within 3.5 feet of the rebounder",
    "Type": "Rebounding "
  },
  "Contested DREB%": {
    "Name": "Contested Defensive Rebound Percentage",
    "Definition":
        "The percentage of defensive rebounds the player collects while an opponent is within 3.5 feet of the rebounder",
    "Formula": "(Contested DREB)/(DREB)",
    "Type": "Rebounding "
  },
  "Contested OREB": {
    "Name": "Contested Offensive Rebounds",
    "Definition":
        "An offensive rebound where an opponent is within 3.5 feet of the rebounder",
    "Type": "Rebounding "
  },
  "Contested OREB%": {
    "Name": "Contested Offensive Rebound Percentage",
    "Definition":
        "The percentage of offensive rebounds the player collects while an opponent is within 3.5 feet of the rebounder",
    "Formula": "(Contested OREB)/(OREB)",
    "Type": "Rebounding "
  },
  "Contested REB": {
    "Name": "Contested Rebounds",
    "Definition":
        "A rebound where an opponent is within 3.5 feet of the rebounder",
    "Type": "Rebounding "
  },
  "Contested REB%": {
    "Name": "Contested Rebound Percentage",
    "Definition":
        "The percentage of rebounds the player collects while an opponent is within 3.5 feet of the rebounder",
    "Formula": "(Contested REB)/(REB)",
    "Type": "Rebounding "
  },
  "Contested Shot": {
    "Definition": "Any shot where the closest defender is within 3.5 feet",
    "Type": "Tracking"
  },
  "Contested Shots": {
    "Name": "Contested Shots",
    "Definition":
        "The number of times a defensive player or team closes out and raises a hand to contest a shot prior to its release",
    "Type": "Hustle "
  },
  "CFG%": {
    "Name": "Contested Field Goals Percentage",
    "Definition":
        "The percentage of field goals the opposing players made while a defensive player was contesting",
    "Type": "Play ",
  },
  "CFGA": {
    "Name": "Contested Field Goals Attempted",
    "Definition":
        "The number of field goals the opposing players attempted while a defensive player was contesting",
    "Type": "Play ",
  },
  "CFGM": {
    "Name": "Contested Field Goals Made",
    "Definition":
        "The number of field goals the opposing players made while a defensive player was contesting",
    "Type": "Play ",
  },
  "C3P%": {
    "Name": "Contested Three Pointers Percentage",
    "Definition":
        "The percentage of three-point field goals the opposing players made while a defensive player was contesting",
    "Type": "Play ",
  },
  "C3PA": {
    "Name": "Contested Three Pointers Attempted",
    "Definition":
        "The number of three-point field goals the opposing players took while a defensive player was contesting",
    "Type": "Play ",
  },
  "C3PM": {
    "Name": "Contested Three Pointers Made",
    "Definition":
        "The number of three-point field goals the opposing players made while a defensive player was contesting",
    "Type": "Play ",
  },
  "DD2": {
    "Name": "Double Doubles",
    "Definition":
        "The number of double-doubles (double-digit number total in two of the five categories in a game) a player achieves",
    "Type": "Traditional "
  },
  "DEF FLS": {
    "Name": "Defensive Fouls",
    "Definition":
        "The number of non-shooting defensive fouls a defensive player committed while guarding a specific offensive player",
    "Type": "Play ",
  },
  "DEF MU%": {
    "Name": "Defensive Matchup Percentage",
    "Definition":
        "The percentage of a defensive player’s overall possessions where they were guarding a specific offensive player",
    "Type": "Play ",
  },
  "DEF WS": {
    "Name": "Defensive Win Shares",
    "Definition":
        "Share of wins a player contributes to their team from defense",
    "Type": "Defense "
  },
  "Deferred DREB Chances": {
    "Name": "Deferred Defensive Rebound Chances",
    "Definition":
        "The number of times that a player has a defensive rebound chance, but defers the rebound to a teammate",
    "Type": "Rebounding "
  },
  "Deferred OREB Chances": {
    "Name": "Deferred Offensive Rebound Chances",
    "Definition":
        "The number of times that a player has an offensive rebound chance, but defers the rebound to a teammate",
    "Type": "Rebounding "
  },
  "Deferred REB Chances": {
    "Name": "Deferred Rebounds Chances",
    "Definition":
        "The number of times that a player has a rebound chance, but defers the rebound to a teammate",
    "Type": "Rebounding "
  },
  "Deflections": {
    "Name": "Deflections",
    "Definition":
        "The number of times a defensive player or team gets their hand on the ball on a non-shot attempt",
    "Type": "Hustle "
  },
  "DEFRTG": {
    "Name": "Defensive Rating",
    "Definition":
        "The number of points allowed per 100 possessions by a team. For a player, it is the number of points per 100 possessions that the team allows while that individual player is on the court",
    "Formula": "100*((Opp Points)/(Opp POSS))",
    "Type": "Advanced ",
    "Labels": ["DEFRTG", "DRTG", "DEF RTG"]
  },
  "DET FACTOR": {
    "Name": "Deterrent Factor",
    "Definition":
        "The percentage of a player’s season average FGA output per Possession that he shot in a specific matchup",
    "Formula":
        "((Matchup FGA)/Matchup Possessions)/(Player’s Season Average FGA per Possession)",
    "Type": "Matchups "
  },
  "DFG%": {
    "Name": "Defended Field Goal Percentage",
    "Definition":
        "The opponents field goal percentage on shots when the player is defending the shot",
    "Formula": "(DFGM)/(DFGA)",
    "Type": "Defense ",
    "Labels": ["DFG%", "DFG %"]
  },
  "DFGA": {
    "Name": "Defended Field Goals Attempted",
    "Definition":
        "The number of opponents shots attempted when a player or team is defending the shot",
    "Type": "Defense "
  },
  "DFGM": {
    "Name": "Defended Field Goals Made",
    "Definition":
        "The number of opponents shots when a player or team is defending the shot",
    "Type": "Defense "
  },
  "DIFF%": {
    "Name": "Percentage Points Difference",
    "Definition":
        "The difference between the normal percentage of a shooter on shots throughout the season and the percentage on shots when the defensive player or team is guarding the shooter. A good defensive number will be negative because the defensive player holds their opponent to a lower percentage than normal",
    "Formula": "FG% - DFG%",
    "Type": "Defense ",
    "Labels": ["DIFF", "DIFF %"]
  },
  "DNP": {
    "Name": "Did Not Play",
    "Definition": "A notification that the player did not play in this game",
    "Type": "Defense ",
    "Labels": ["DNP"]
  },
  "Dist. Feet": {
    "Name": "Distance Feet",
    "Definition": "Distance run by a player or team measured in feet",
    "Type": "Tracking "
  },
  "Dist. Miles": {
    "Name": "Distance Miles",
    "Definition": "Distance run by a player or team measured in miles",
    "Formula": "(Dist. Feet)/5280",
    "Type": "Tracking "
  },
  "Dist. Miles Def": {
    "Name": "Distance Miles Defense",
    "Definition": "Miles run by a player or team while on defense",
    "Type": "Tracking "
  },
  "Dist. Miles Off": {
    "Name": "Distance Miles Offense",
    "Definition": "Miles run by a player or team while on offense",
    "Type": "Tracking "
  },
  "DREB": {
    "Name": "Defensive Rebounds",
    "Definition":
        "The number of rebounds a player or team has collected while they were on defense",
    "Type": "Traditional "
  },
  "DREB Chance%": {
    "Name": "Defensive Rebounds Chance Percentage",
    "Definition":
        "The percentage of defensive rebounds a player recovers compared to the number of defensive rebounding chances",
    "Formula": "(DREB)/(DREB Chances)",
    "Type": "Rebounding "
  },
  "DREB Chances": {
    "Name": "Defensive Rebound Chances",
    "Definition":
        "When on defense, a player has a defensive rebound chance if they are the closest player to the ball at any point in time between when the ball has crossed below the rim to when it is fully rebounded",
    "Type": "Rebounding "
  },
  "DREB%": {
    "Name": "Defensive Rebounding Percentage",
    "Definition":
        "The percentage of available defensive rebounds a player or team obtains while on the floor.",
    "Type": "Advanced ",
    "Labels": ["DREB%", "DREB %"]
  },
  "Drive FG%": {
    "Name": "Drive Field Goal Percentage",
    "Definition":
        "The field goal percentage of a player or team on drives to the basket",
    "Type": "Tracking "
  },
  "Drive PTS": {
    "Name": "Drive Points",
    "Definition":
        "The number of points scored by a player or team on drives to the basket",
    "Type": "Tracking "
  },
  "Drives": {
    "Name": "Drives",
    "Definition":
        "When a player attacks the basket off the dribble in the halfcourt offense. Does not include situations where the player starts close to the basket, catches on the move, or immediately gets cut off on the perimeter",
    "Type": "Tracking "
  },
  "eFG%": {
    "Name": "Effective Field Goal Percentage",
    "Definition":
        "Measures field goal percentage adjusting for made 3-point field goals being 1.5 times more valuable than made 2-point field goals.",
    "Formula": "((FGM + (0.5 * 3PM)) / FGA",
    "Type": "Traditional ",
    "Labels": ["eFG%", "eFG %"]
  },
  "Elbow Touch": {
    "Definition":
        "Any touch where the player receives the ball near the free throw line",
    "Type": "Tracking "
  },
  "Elbow Touch FG%": {
    "Name": "Elbow Touch FG%",
    "Definition":
        "The field goal percentage by a player or team on touches at the elbow",
    "Type": "Tracking "
  },
  "Elbow Touch PTS": {
    "Name": "Elbow Touch Points",
    "Definition":
        "The number of points scored by a player or team on touches at the elbow",
    "Type": "Tracking "
  },
  "FBPS": {
    "Name": "Fast Break Points",
    "Definition":
        "The number of points scored by a player or team while on a fast break",
    "Type": "Misc ",
    "Labels": ["FB PTS", "FBPS", "FBPTS", "PTS FB"]
  },
  "FG%": {
    "Name": "Field Goal Percentage",
    "Definition": "The percentage of field goal attempts that a player makes",
    "Formula": "(FGM)/(FGA)",
    "Type": "Traditional ",
    "Labels": ["FG%", "FG %", "FGPCT", "FG PCT", "FG_PCT"]
  },
  "FGA": {
    "Name": "Field Goals Attempted",
    "Definition":
        "The number of field goals that a player or team has attempted. This includes both 2 pointers and 3 pointers",
    "Type": "Traditional "
  },
  "FGA Per 100 Events": {
    "Definition":
        "Field Goal Attempts by the player off that event type divided by the number of events for that player, multiplied by 100",
    "Type": "Tracking"
  },
  "FGM": {
    "Name": "Field Goals Made",
    "Definition":
        "The number of field goals that a player or team has made. This includes both 2 pointers and 3 pointers",
    "Type": "Traditional "
  },
  "FGM %AST": {
    "Name": "Percent of Field Goals Made Assisted",
    "Definition":
        "The percentage of total field goals made by a player or team that are assisted by a teammate",
    "Type": "Scoring ",
    "Labels": ["FGM %AST", "FGM % AST", "% AST FGM"]
  },
  "FGM %UAST": {
    "Name": "Percent of Field Goals Made Unassisted",
    "Definition":
        "The percentage of total field goals made by a player or team that are not assisted by a teammate",
    "Type": "Scoring ",
    "Labels": ["FGM %UAST", "FGM % UAST", "% UAST FGM"]
  },
  "Fifteen Break Left": {
    "Name": "Fifteen Break Left",
    "Definition":
        "A player takes five shots from the left break and 15 feet away from the basket",
    "Type": "Combine "
  },
  "Fifteen Break Right": {
    "Name": "Fifteen Break Right",
    "Definition":
        "A player takes five shots from the right break and 15 feet away from the basket",
    "Type": "Combine "
  },
  "Fifteen Corner Left": {
    "Name": "Fifteen Corner Left",
    "Definition":
        "A player takes five shots from the left baseline and 15 feet away from the basket",
    "Type": "Combine "
  },
  "Fifteen Corner Right": {
    "Name": "Fifteen Corner Right",
    "Definition":
        "A player takes five shots from the right baseline and 15 feet away from the basket",
    "Type": "Combine "
  },
  "Fifteen Top Key": {
    "Name": "Fifteen Top Key",
    "Definition":
        "A player takes five shots from the top of the key and 15 feet away from the basket",
    "Type": "Combine "
  },
  "FP": {
    "Name": "Fantasy Points",
    "Definition": "The number of fantasy points a player accumulates",
    "Formula": "Pts: 1 Rebs: 1.2 Ast: 1.5 Stl: 3 Blocks: 3 TO: -1",
    "Type": "Traditional "
  },
  "Freq": {
    "Name": "Frequency",
    "Definition":
        "The number of events that occur that fit the specified criteria based on the number of events overall",
    "Type": "Play ",
  },
  "FRONT CT TOUCHES": {
    "Name": "Front Court Touches",
    "Definition":
        "The number of touches made by a player or team in the front court",
    "Type": "Tracking "
  },
  "FT Assists": {
    "Name": "Free Throw Assists",
    "Definition":
        "A player is awarded a free throw assist if they passed the ball to a player who drew a shooting foul within one dribble of receiving the pass",
    "Type": "Tracking "
  },
  "FT Freq": {
    "Name": "Free Throw Frequency",
    "Definition":
        "The percentage of plays where a player or team shoots free throws as the result of a foul",
    "Type": "Play ",
  },
  "FT%": {
    "Name": "Free Throw Percentage",
    "Definition":
        "The percentage of free throw attempts that a player or team has made",
    "Formula": "(FTM)/(FTA)",
    "Type": "Traditional ",
    "Labels": ["FT%", "FT %", "FTPCT", "FT PCT", "FT_PCT"]
  },
  "FTA": {
    "Name": "Free Throws Attempted",
    "Definition":
        "The number of free throws that a player or team has attempted",
    "Type": "Traditional ",
    "Labels": ["FTA"]
  },
  "FTA RATE": {
    "Name": "Free Throw Attempt Rate",
    "Definition":
        "The number of free throw attempts a team shoots in comparison to the number of field goal attempts that team shoots",
    "Formula": "(FTA)/(FGA)",
    "Type": "Four Factors "
  },
  "FTM": {
    "Name": "Free Throws Made",
    "Definition": "The number of free throws that a player or team has made",
    "Type": "Traditional ",
    "Labels": ["FTM"]
  },
  "G": {
    "Name": "Games",
    "Definition":
        "The number of games a player or team played where a specified criteria occured",
    "Type": "Traditional"
  },
  "GP": {
    "Name": "Games Played",
    "Definition": "The number of games played",
    "Type": "Traditional"
  },
  "Hand Length (inches)": {
    "Name": "Hand Length (inches)",
    "Definition":
        "Length of the Prospect's hand in inches. The measurement is taken from the bottom of the player's palm to the tip of their middle finger",
    "Type": "Combine "
  },
  "Hand Width (inches)": {
    "Name": "Hand Width (inches)",
    "Definition":
        "Width of the Prospects hand in inches. The measurement is taken from the player's outstretched hand from the tip of the thumb to tip of the pinky finger",
    "Type": "Combine "
  },
  "Height W/ Shoes": {
    "Name": "Height with Shoes",
    "Definition": "Height of the player while wearing shoes",
    "Type": "Combine "
  },
  "Height W/O Shoes": {
    "Name": "Height without Shoes",
    "Definition": "Height of the player without wearing shoes",
    "Type": "Combine "
  },
  "HELP BLK": {
    "Name": "Helped Blocks",
    "Definition":
        "The number of blocks a defensive player recorded on a different defensive player than the one they were matched up with",
    "Type": "Play ",
  },
  "HELP BLK REC": {
    "Name": "Helped Blocks Received",
    "Definition":
        "The number of times an offensive player’s shot was blocked by a different defensive player than the one they were matched up with",
    "Type": "Play ",
  },
  "L": {
    "Name": "Losses",
    "Definition": "The number of games lost by a player or team",
    "Type": "Traditional"
  },
  "Lane Agility Time (seconds)": {
    "Name": "Lane Agility (seconds)",
    "Definition":
        "The time result of the drill that measures lateral quickness and the player's agility",
    "Type": "Combine "
  },
  "Loose Balls Recovered": {
    "Name": "Loose Balls Recovered",
    "Definition":
        "The number of times a player or team gains sole possession of a live ball that is not in the control of either team",
    "Type": "Hustle "
  },
  "Max Bench Press (repetitions)": {
    "Name": "Max Bench Press (repetitions)",
    "Definition": "The number of bench press repetitions at 185 lbs",
    "Type": "Combine "
  },
  "Max Vertical Leap (inches)": {
    "Name": "Max Vertical Leap (inches)",
    "Definition":
        "The vertical leap of a player with a few steps to start and gather their leap",
    "Type": "Combine "
  },
  "MIN": {
    "Name": "Minutes Played",
    "Definition": "The number of minutes played by a player or team",
    "Type": "Traditional"
  },
  "NBA Break Left": {
    "Name": "NBA Break Left",
    "Definition":
        "A player takes five shots from the left break area of the court. The shot is from the distance of an NBA three pointer (23 ft. 9 in.)",
    "Type": "Combine "
  },
  "NBA Break Right": {
    "Name": "NBA Break Right",
    "Definition":
        "A player takes five shots from the right break area of the court. The shot is from the distance of an NBA three pointer (23 ft. 9 in.)",
    "Type": "Combine "
  },
  "NBA Corner Left": {
    "Name": "NBA Corner Left",
    "Definition":
        "A player takes five shots from the left corner area of the court. The shot is from the distance of an NBA three pointer (23 ft. 9 in.)",
    "Type": "Combine "
  },
  "NBA Corner Right": {
    "Name": "NBA Corner Right",
    "Definition":
        "A player takes five shots from the right corner area of the court. The shot is from the distance of an NBA three pointer (23 ft. 9 in.)",
    "Type": "Combine "
  },
  "NBA Top Key": {
    "Name": "NBA Top Key",
    "Definition":
        "A player takes five shots from top of the key. The shot is from the distance of an NBA three pointer (23 ft. 9 in.)",
    "Type": "Combine "
  },
  "NetRtg": {
    "Name": "Net Rating",
    "Definition":
        "Measures a team's point differential per 100 possessions. On player level this statistic is the team's point differential per 100 possessions while they are on court.",
    "Formula": "OFFRTG - DEFRTG",
    "Type": "Advanced ",
    "Labels": ["NetRTG", "NET RTG", "NET"]
  },
  "Off Dribble College Break Left": {
    "Name": "Off Dribble College Break Left",
    "Definition":
        "A player takes six shots coming off the dribble from the left break area of the court. The shot is from about the distance of a college three pointer (20 ft. 9 in.)",
    "Type": "Combine "
  },
  "Off Dribble College Break Right": {
    "Name": "Off Dribble College Break Right",
    "Definition":
        "A player takes six shots coming off the dribble from the right break area of the court. The shot is from about the distance of a college three pointer (20 ft. 9 in.)",
    "Type": "Combine "
  },
  "Off Dribble College Top Key": {
    "Name": "Off Dribble College Top Key",
    "Definition":
        "A player takes six shots coming off the dribble from the top of the key. The shot is from about the distance of a college three pointer (20 ft. 9 in.)",
    "Type": "Combine "
  },
  "Off Dribble Fifteen Break Left": {
    "Name": "Off Dribble Fifteen Break Left",
    "Definition":
        "A player takes six shots coming off the dribble from 15 feet away from the basket on the left break area of the court",
    "Type": "Combine "
  },
  "Off Dribble Fifteen Break Right": {
    "Name": "Off Dribble FIfteen Break Right",
    "Definition":
        "A player takes six shots coming off the dribble from 15 feet away from the basket on the right break area of the court",
    "Type": "Combine "
  },
  "Off Dribble Fifteen Top Key": {
    "Name": "Off Dribble Fifteen Top Key",
    "Definition":
        "A player takes six shots coming off the dribble from 15 feet out at the top of the key",
    "Type": "Combine "
  },
  "OFF FLS": {
    "Name": "Offensive Fouls",
    "Definition":
        "The number of offensive fouls an offensive player committed while being guarded by a specific defensive player",
    "Type": "Play ",
  },
  "OFF MU%": {
    "Name": "Offensive Matchup Percentage",
    "Definition":
        "The percentage of an offensive player’s overall possessions where they were guarded by a specific defensive player",
    "Type": "Play ",
  },
  "OffRtg": {
    "Name": "Offensive Rating",
    "Definition":
        "Measures a team's points scored per 100 possessions. On a player level this statistic is team points scored per 100 possessions while they are on court",
    "Formula": "100*((Points)/(POSS)",
    "Type": "Advanced ",
    "Labels": ["OffRtg", "ORTG", "OFF RTG"]
  },
  "On The Move College": {
    "Name": "On The Move College",
    "Definition":
        "35 seconds to attempt as many shots as time allows from college 3-pt range (20 ft. 9 in.) while moving between spots (corners and elbows from both sides)",
    "Type": "Combine "
  },
  "On The Move Fifteen": {
    "Name": "On The Move Fifteen",
    "Definition":
        "35 seconds to attempt as many shots as time allows from 15 feet while moving between spots (corners and elbows from both sides)",
    "Type": "Combine "
  },
  "OPP 2ND PTS": {
    "Name": "Opponent 2nd Chance Points",
    "Definition":
        "The number of points an opposing player or team scores on possessions where the opposing team rebounds the ball on offense",
    "Type": "Misc ",
    "Labels": [
      "OPP 2nd CHANCE PTS",
      "OPP 2ND PTS",
      "OPP PTS 2ND CH",
      "OPP PTS 2ND"
    ]
  },
  "Opp 3P%": {
    "Name": "Opponent Three Point Percentage",
    "Definition":
        "The percentage of 3 point attempts that are made by an opponent",
    "Type": "Opponent ",
    "Labels": ["OPP 3P%", "OPP 3P %"]
  },
  "Opp 3PA": {
    "Name": "Opponent Three Point Attempted",
    "Definition":
        "The number of 3 point field goals attempted by an opposing player or team",
    "Type": "Opponent "
  },
  "Opp 3PM": {
    "Name": "Opponent Three Point Made",
    "Definition":
        "The number of 3 point field goals made by an opposing player or team",
    "Type": "Opponent "
  },
  "Opp AST": {
    "Name": "Opponent Assists",
    "Definition": "Number of times an opponent has registered an assist",
    "Type": "Opponent "
  },
  "OPP BLK": {
    "Name": "Opponent Blocked Shots",
    "Definition":
        "Number of times an opponent has registered a block on the shot of a player or team",
    "Type": "Opponent "
  },
  "Opp BLKA": {
    "Name": "Opponent Blocks Against",
    "Definition": "An opponent's number of shot attempts that are blocked",
    "Type": "Opponent "
  },
  "Opp DREB": {
    "Name": "Opponent Defensive Rebounds",
    "Definition": "An opponent's number of defensive rebounds collected",
    "Type": "Opponent "
  },
  "Opp EFG %": {
    "Name": "Opponent Effective Field Goal Percentage",
    "Definition":
        "An opponent's field goal percentage that is adjusted for made 3 pointers being 1.5 times more valuable than a 2 point shot",
    "Formula": "((FGM + (0.5 * 3PM))/FGA",
    "Type": "Four Factors ",
    "Labels": ["OPP EFG%", "OPP EFG %"]
  },
  "OPP FBPs": {
    "Name": "Opponent Fast Break Points",
    "Definition":
        "The number of points scored by an opposing player or team while on a fast break",
    "Type": "Misc ",
    "Labels": ["OPP FBPs", "OPP FB PTS", "OPP PTS FB"]
  },
  "Opp FG %": {
    "Name": "Opponent Field Goal Percentage",
    "Definition":
        "The percentage of field goal attempts that are made by an opponent",
    "Type": "Opponent ",
    "Labels": ["OPP FG%", "OPP FG %"]
  },
  "Opp FGA": {
    "Name": "Opponent Field Goals Attempted",
    "Definition": "An opponent's number of field goals attempted",
    "Type": "Opponent "
  },
  "Opp FGM": {
    "Name": "Opponent Field Goals Made",
    "Definition": "An opponent's number of field goals made",
    "Type": "Opponent "
  },
  "Opp FT %": {
    "Name": "Opponent Free Throw Percentage",
    "Definition":
        "The percentage of free throw attempts that are made by an opponent",
    "Type": "Opponent ",
    "Labels": ["OPP FT%", "OPP FT %"]
  },
  "Opp FTA": {
    "Name": "Opponent Free Throw Attempted",
    "Definition": "An opponent's number of free throws attempted",
    "Type": "Opponent "
  },
  "Opp FTA Rate": {
    "Name": "Opponent Free Throw Attempt Rate",
    "Definition":
        "The number of free throw attempts a player or team allows in comparison to the number of shot attempts that player or team allows",
    "Formula": "(Opp FTA)/(Opp FGA)",
    "Type": "Four Factors "
  },
  "Opp FTM": {
    "Name": "Opponent Free Throw Made",
    "Definition": "An opponent's number of free throws made",
    "Type": "Opponent "
  },
  "Opp OREB": {
    "Name": "Opponent Offensive Rebounds",
    "Definition":
        "The number of offensive rebounds obtained by an opposing player or team",
    "Type": "Opponent "
  },
  "OPP OREB%": {
    "Name": "Opponent Offensive Rebounding Percentage",
    "Definition":
        "The percentage of available offensive rebounds an opponent obtains while a specific player is on the court",
    "Type": "Four Factors ",
    "Labels": ["OPP OREB%", "OPP OREB %"]
  },
  "Opp PF": {
    "Name": "Opponent Personal Fouls",
    "Definition":
        "The number of personal fouls committed by an opposing player or team",
    "Type": "Opponent "
  },
  "Opp PFD": {
    "Name": "Opponent Personal Fouls Drawn",
    "Definition":
        "The number of personal fouls drawn by an opposing player or team",
    "Type": "Opponent "
  },
  "OPP PITP": {
    "Name": "Opponent Points in the Paint",
    "Definition":
        "The number of points scored by an opposing player or team in the paint",
    "Type": "Misc ",
    "Labels": ["OPP PITP", "OPP PTS PAINT", "OPP PTS IN PAINT"]
  },
  "OPP PLUSMINUS": {
    "Name": "Opponent Plus-Minus",
    "Definition":
        "The point differential when the opposing team is on the floor",
    "Type": "Traditional ",
    "Labels": ["Opp +/-", "OPP PLUS MINUS", "OPP PLUSMINUS", "OPP PLUS-MINUS"]
  },
  "Opp PTS": {
    "Name": "Opponent Points",
    "Definition": "The number of points scored by an opposing player or team",
    "Type": "Opponent "
  },
  "OPP PTS OFF TO": {
    "Name": "Opponent Points off Turnovers",
    "Definition":
        "The number of points scored by an opposing player or team following a turnover",
    "Type": "Misc ",
    "Labels": [
      "OPP PTS OFF TO",
      "OPP PTS OFF TOS",
      "OPP PTS OFF TOVS",
      "OPP PTS OFF TOV",
      "OPP PTS TOV"
    ]
  },
  "Opp REB": {
    "Name": "Opponent Total Rebounds",
    "Definition":
        "The number of total rebounds obtained by an opposing player or team",
    "Type": "Opponent "
  },
  "Opp STL": {
    "Name": "Opponent Steals",
    "Definition": "The number of steals obtained by an opposing player or team",
    "Type": "Opponent "
  },
  "Opp TOV": {
    "Name": "Opponent Turnovers",
    "Definition":
        "The number of times an opponent on offense loses the ball to the defense",
    "Type": "Opponent "
  },
  "OPP TOV%": {
    "Name": "Opponent Turnover Percentage",
    "Definition":
        "The number of turnovers an opponent averages per 100 of their own possessions",
    "Type": "Four Factors ",
    "Labels": ["OPP TOV%", "OPP TO %", "OPP TOV %", "OPP TO%", "OPP TM TOV %"]
  },
  "OREB": {
    "Name": "Offensive Rebounds",
    "Definition":
        "The number of rebounds a player or team has collected while they were on offense",
    "Type": "Traditional "
  },
  "OREB Chance%": {
    "Name": "Offensive Rebound Chance Percentage",
    "Definition":
        "The percentage of offensive rebounds a player or team recovers compared to the number of offensive rebounding chances",
    "Formula": "(OREB)/(OREB Chances)",
    "Type": "Rebounding "
  },
  "OREB Chances": {
    "Name": "Offensive Rebound Chances",
    "Definition":
        "When on offense, a player has a offensive rebound chance if they are the closest player to the ball at any point in time between when the ball has crossed below the rim to when it is fully rebounded",
    "Type": "Rebounding "
  },
  "OREB%": {
    "Name": "Offensive Rebounding Percentage",
    "Definition":
        "The percentage of available offensive rebounds a player or team obtains while on the floor",
    "Type": "Advanced "
  },
  "OREB %": {
    "Name": "Offensive Rebounding Percentage",
    "Definition":
        "The percentage of available offensive rebounds a player or team obtains while on the floor",
    "Type": "Advanced "
  },
  "PACE": {
    "Name": "Pace",
    "Definition":
        "The number of possessions per 48 minutes for a team or player.",
    "Type": "Advanced ",
    "Labels": ["PACE"]
  },
  "PACE/40": {
    "Name": "Pace Per 40",
    "Definition":
        "The number of possessions per 40 minutes for a team or player.",
    "Type": "Advanced ",
    "Labels": ["PACE/40", "PACE / 40", "PACE per 40"]
  },
  "Paint Touch": {
    "Definition":
        "Any touch were the player receives the ball inside the 3-second lane",
    "Type": "Tracking "
  },
  "Paint Touch FG%": {
    "Name": "Paint Touch Field Goal Percentage",
    "Definition":
        "The field goal percentage by a player or team on touches in the paint",
    "Type": "Tracking "
  },
  "Paint Touch PTS": {
    "Name": "Paint Touch Points",
    "Definition":
        "The number of points scored by a player or team on touches in the paint",
    "Type": "Tracking "
  },
  "PASS": {
    "Name": "Passes",
    "Definition":
        "The number of passes made to or received from the given player or team",
    "Type": "Tracking "
  },
  "PASS%": {
    "Name": "Pass Percentage",
    "Definition": "Percentage of times a player passes",
    "Type": "Tracking "
  },
  "Passes Made": {
    "Name": "Passes Made",
    "Definition":
        "The number of total passes made by a player or team per game",
    "Type": "Tracking "
  },
  "Passes Received": {
    "Name": "Passes Received",
    "Definition":
        "The number of total passes received by a player or team per game",
    "Type": "Tracking "
  },
  "PASS Per 100 Events": {
    "Definition":
        "Passes by the player off that event type divided by the number of events for that player, multiplied by 100",
    "Type": "Tracking"
  },
  "Percentile": {
    "Name": "Percentile",
    "Definition":
        "A player or team's points per possession ranked against the rest of the league. The percentage value is the percent of eligible players with an inferior points per possession than the selected player or team. *10 Possession minimum",
    "Type": "Play ",
  },
  "PF": {
    "Name": "Personal Fouls",
    "Definition": "The number of personal fouls a player or team committed",
    "Type": "Traditional "
  },
  "PFD": {
    "Name": "Personal Fouls Drawn",
    "Definition":
        "The number of personal fouls that are drawn by a player or team",
    "Type": "Traditional "
  },
  "PIE": {
    "Name": "Player Impact Estimate",
    "Definition":
        "PIE measures a player's overall statistical contribution against the total statistics in games they play in. PIE yields results which are comparable to other advanced statistics (e.g. PER) using a simple formula.",
    "Formula":
        "(PTS + FGM + FTM - FGA - FTA + DREB + (.5 * OREB) + AST + STL + (.5 * BLK) - PF - TO) / (GmPTS + GmFGM + GmFTM - GmFGA - GmFTA + GmDREB + (.5 * GmOREB) + GmAST + GmSTL + (.5 * GmBLK) - GmPF - GmTO)",
    "Type": "Advanced "
  },
  "PITP": {
    "Name": "Points In The Paint",
    "Definition":
        "The number of points scored by a player or team in the paint",
    "Type": "Misc ",
    "Labels": ["PTS IN PAINT", "PITP", "PTS PAINT"]
  },
  "Player Points per 100 Events": {
    "Definition":
        "Points scored by the player off that event type divided by the number of events for that player, multiplied by 100",
    "Type": "Tracking"
  },
  "Player PTS DIFF": {
    "Name": "Player Points Difference",
    "Definition":
        "An offensive player’s Points per 100 Possessions in a specific matchup compared to their season average Points per 100 Possessions.",
    "Formula":
        "100*(Matchup Player Points/Matchup Possessions) – Player’s Season Average Points per 100 Possessions",
    "Type": "Matchups GAME "
  },
  "Poss": {
    "Name": "Possessions",
    "Definition":
        "The number of possessions played by a player or team. Please note: an Offensive Rebound does not create another possession, it simply makes the existing possession longer.",
    "Type": "Play ",
  },
  "Post Touch FG%": {
    "Name": "Post Touch Field Goal Percentage",
    "Definition":
        "The field goal percentage by a player or team on touches in the post",
    "Type": "Tracking "
  },
  "Post Touch PTS": {
    "Name": "Post Touch Points",
    "Definition":
        "The number of points scored by a player or team on touches in the post",
    "Type": "Tracking "
  },
  "Post Touches": {
    "Name": "Post Touches",
    "Definition": "The number of touches made by a player or team in the post",
    "Type": "Tracking "
  },
  "Potential AST": {
    "Name": "Potential Assists",
    "Definition":
        "Any pass to a teammate who shoots within 1 dribble of receiving the ball",
    "Type": "Tracking "
  },
  "PPP": {
    "Name": "Points Per Possession",
    "Definition": "The number of points a player or team scores per possession",
    "Type": "Play ",
  },
  "PTS": {
    "Name": "Points",
    "Definition": "The number of points scored",
    "Type": "Traditional "
  },
  "PTS OFF TO": {
    "Name": "Points off Turnovers",
    "Definition":
        "The number of points scored by a player or team following an opponent's turnover",
    "Type": "Misc ",
    "Labels": ["PTS OFF TO", "PTS OFF TOS", "PTS OFF TOV", "PTS OFF TOVS"]
  },
  "PTS PER ELBOW TOUCH": {
    "Name": "Points per Elbow Touch",
    "Definition":
        "The number of points scored by a player or team per elbow touch",
    "Type": "Tracking "
  },
  "PTS PER PAINT TOUCH": {
    "Name": "Points per Paint Touch",
    "Definition":
        "The number of points scored by a player or team per paint touch",
    "Type": "Tracking "
  },
  "PTS PER POST TOUCH": {
    "Name": "Points per Post Touch",
    "Definition":
        "The number of points scored by a player or team per post touch",
    "Type": "Tracking "
  },
  "PTS PER TOUCH": {
    "Name": "Points per Touch",
    "Definition": "The number of points scored by a player or team per touch",
    "Type": "Tracking "
  },
  "PTS%": {
    "Name": "Points Percentage",
    "Definition": "Percentage of points scored",
    "Type": "Tracking "
  },
  "Pull Up FG%": {
    "Name": "Pull Up Field Goal Percentage",
    "Definition":
        "The field goal percentage by a player or team on Pull Up shots",
    "Type": "Tracking "
  },
  "Pull Up PTS": {
    "Name": "Pull Up Points",
    "Definition":
        "The number of points scored by a player or team on Pull Up shots",
    "Type": "Tracking "
  },
  "REB": {
    "Name": "Rebounds",
    "Definition":
        "A rebound occurs when a player recovers the ball after a missed shot. This statistic is the number of total rebounds a player or team has collected on either offense or defense",
    "Type": "Traditional "
  },
  "REB Chance%": {
    "Name": "Rebound Chance Percentage",
    "Definition":
        "The percentage of rebounds a player or team recovers compared to the number of rebounding chances",
    "Formula": "(REB)/(REB Chances)",
    "Type": "Rebounding "
  },
  "REB Chances": {
    "Name": "Rebound Chances",
    "Definition":
        "A player has a rebound chance if they are the closest player to the ball at any point in time between when the ball has crossed below the rim to when it is fully rebounded",
    "Type": "Rebounding "
  },
  "REB%": {
    "Name": "Rebounding Percentage",
    "Definition":
        "The percentage of available rebounds a player or team grabbed while on the floor",
    "Type": "Advanced ",
    "Labels": ["REB%", "REB %"]
  },
  "SAST": {
    "Name": "Screen Assists",
    "Definition":
        "The number of times an offensive player or team sets a screen for a teammate that directly leads to a made field goal by that teammate",
    "Type": "Hustle "
  },
  "Score Freq": {
    "Name": "Score Frequency",
    "Definition":
        "The percentage of plays where a player or team scores at least 1 point",
    "Type": "Play ",
  },
  "Secondary Assist": {
    "Name": "Secondary Assist",
    "Definition":
        "A player is awarded a secondary assist if they passed the ball to a player who recorded an assist within 1 second and without dribbling",
    "Type": "Tracking "
  },
  "Shot At Rim": {
    "Definition": "Any shot with distance within 5 feet of the basket",
    "Type": "Tracking"
  },
  "SF Freq": {
    "Name": "Shooting Foul Frequency",
    "Definition":
        "The percentage of plays where a player or team shoots free throws as the result of a shooting foul",
    "Type": "Play ",
  },
  "SFL": {
    "Name": "Shooting Fouls",
    "Definition":
        "The number of shooting fouls a defensive player committed against their matchups",
    "Type": "Play ",
  },
  "SFL Per 100 Events": {
    "Definition":
        "Shooting Fouls Drawn by the player off that event type divided by the number of events for that player, multiplied by 100",
    "Type": "Tracking"
  },
  "Shuttle Run (seconds)": {
    "Name": "Shuttle Run (seconds)",
    "Definition":
        "The time result of the drill that measures a player's agility and ability to change directions",
    "Type": "Combine"
  },
  "Standing Reach": {
    "Name": "Standing Reach",
    "Definition":
        "The reach of the player while standing still. The player reaches straight up to their highest point",
    "Type": "Combine"
  },
  "Standing Vertical Leap (inches)": {
    "Name": "Standing Vertical Leap (inches)",
    "Definition": "The vertical leap of a player with no running start",
    "Type": "Combine"
  },
  "STL": {
    "Name": "Steals",
    "Definition":
        "Number of times a defensive player or team takes the ball from a player on offense, causing a turnover",
    "Type": "Traditional"
  },
  "STL%": {
    "Name": "Steals Percentage",
    "Definition":
        "The percentage of a team's steals that a player has while on the court",
    "Type": "Defense",
    "Labels": ["STL%", "STL %"]
  },
  "Team PTS DIFF": {
    "Name": "Team Points Difference",
    "Definition":
        "An offensive player’s Team Points per 100 Possessions in a specific matchup compared to their season average Points per 100 Possessions.",
    "Formula":
        "100*(Matchup Team Points/Matchup Possessions) – Team’s Season Average Points per 100 Possessions",
    "Type": "Matchups"
  },
  "Team Pts Per 100 Possessions": {
    "Name": "Team Points Per 100 Possessions (on an event)",
    "Definition":
        "Points scored by the team on possessions where there is an event for that player, divided by the number of unique possessions where there is an event for that player, multiplied by 100",
    "Type": "Tracking"
  },
  "TD3": {
    "Name": "Triple Doubles",
    "Definition":
        "The number of triple-doubles (double-digit number total in three of the five categories in a game) a player achieves",
    "Type": "Traditional"
  },
  "Three Quarter Sprint (seconds)": {
    "Name": "Three Quarter Sprint (seconds)",
    "Definition":
        "The time result of the drill where a player is timed in a sprint from the baseline to 3/4th the length of the court",
    "Type": "Combine"
  },
  "TIME OF POSS": {
    "Name": "Time of Possession",
    "Definition":
        "The number of minutes that a player or team possesses the ball",
    "Type": "Tracking"
  },
  "TO Freq": {
    "Name": "Turnover Frequency",
    "Definition":
        "The percentage of plays where a player or team commits a turnover",
    "Type": "Play ",
  },
  "TO Ratio": {
    "Name": "Turnover Ratio",
    "Definition":
        "The number of turnovers a player or team averages per 100 possessions used",
    "Formula": "(TO * 100) / (POSS)",
    "Type": "Advanced"
  },
  "Touches": {
    "Name": "Touches",
    "Definition":
        "The number of times a player or team touches and posseses the ball during the game",
    "Type": "Tracking"
  },
  "TOV": {
    "Name": "Turnovers",
    "Definition":
        "A turnover occurs when the player or team on offense loses the ball to the defense",
    "Type": "Traditional",
    "Labels": ["TOV", "TO"]
  },
  "TOV%": {
    "Name": "Turnover Percentage",
    "Definition": "Percentage of plays that end in a player or team's turnover",
    "Type": "Advanced",
    "Labels": ["TOV%", "TOV%", "TO%", "TO %", "TM TO %", "TM TOV %"]
  },
  "Tracking eFG%": {
    "Definition":
        "Effective Field Goal Percentage on shots off that event type",
    "Type": "Tracking"
  },
  "Tracking Player Points": {
    "Definition": "Points scored by the player off that event type",
    "Type": "Tracking"
  },
  "TS%": {
    "Name": "True Shooting Percentage",
    "Definition":
        "A shooting percentage that factors in the value of three-point field goals and free throws in addition to conventional two-point field goals",
    "Formula": "Points/ [2*(Field Goals Attempted+0.44*Free Throws Attempted)]",
    "Type": "Advanced",
    "Labels": ["TS%", "TS %"]
  },
  "Uncontested DREB": {
    "Name": "Uncontested Defensive Rebounds",
    "Definition":
        "The number of defensive rebounds gathered by a player or team while no opponent is within 3.5 feet",
    "Type": "Rebounding"
  },
  "Uncontested OREB": {
    "Name": "Uncontested Offensive Rebounds",
    "Definition":
        "The number of offensive rebounds gathered by a player or team while no opponent is within 3.5 feet",
    "Type": "Rebounding"
  },
  "Uncontested REB": {
    "Name": "Uncontested Rebounds",
    "Definition":
        "The number of rebounds gathered by a player or team while no opponent is within 3.5 feet",
    "Type": "Rebounding"
  },
  "USG%": {
    "Name": "Usage Percentage",
    "Definition":
        "The percentage of team plays used by a player when they are on the floor",
    "Formula": "(FGA + Possession Ending FTA + TO) / POSS",
    "Type": "Advanced",
    "Labels": ["USG%", "USG %", "Usage %"]
  },
  "W": {
    "Name": "Wins",
    "Definition": "The number of games won by a player or team",
    "Type": "Traditional"
  },
  "Win%": {
    "Name": "Win Percentage",
    "Definition":
        "The percentage of games played that a player or team has won",
    "Formula": "(W)/(GP)",
    "Type": "Traditional",
    "Labels": ["Win%", "W%", "W %", "Win %", "WPCT", "WINPCT", "WIN_PCT"]
  },
  "Wingspan": {
    "Name": "Wingspan",
    "Definition":
        "The player stretches their arms horizontally and a measure is made from the tip of their left hand to the tip of their right hand",
    "Type": "Combine"
  }
};

class StatHelper {
  static Stat getStat(String statKey) {
    print(statKey);
    Stat s = Stat();

    // Loops through all stats above and checks for a Labels array. If it finds it, it searches for a match in the array.
    // If the array doesn't exist, it tries to match the key value
    allStats.forEach((key, value) {
      //print(key);
      if (value["Labels"] != null) {
        for (var l in value["Labels"]) {
          if (statKey.toUpperCase() == l.toString().toUpperCase()) {
            s.name = StatHelper.formatJsonItem(value["Name"]);
            s.description = StatHelper.formatJsonItem(value["Definition"]);
            s.formula = StatHelper.formatJsonItem(value["Formula"]);
            s.type = StatHelper.formatJsonItem(value["Type"]);
          }
        }
      } else {
        if (key.toString().toUpperCase() == statKey.toUpperCase()) {
          s.name = StatHelper.formatJsonItem(value["Name"]);
          s.description = StatHelper.formatJsonItem(value["Definition"]);
          s.formula = StatHelper.formatJsonItem(value["Formula"]);
          s.type = StatHelper.formatJsonItem(value["Type"]);
        }
      }
    });

    return s;
  }

  static String formatJsonItem(dynamic json) {
    if (json == null) {
      return "";
    } else if (json == "null") {
      return "";
    } else {
      return json.toString();
    }
  }
}

class Stat {
  var name;
  var description;
  var formula;
  var type;
  var columnDisplay;

  Stat();
}
