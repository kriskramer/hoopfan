# Core Features

Hoop Fan is an NBA companion app. The home screen is a date-based scoreboard. From a game, team, or player, the app opens stats, news, and live discussion. Accounts are optional and are used to identify chat participants.

## Home scoreboard

`DashboardMain` is the screen after startup. A blue title bar shows the Hoop Fan mark, player search, a notifications icon (not wired), and the account button. The account icon turns orange when an email is stored on the user.

`TodaysGamesDashboard` lists that day's games in three groups: final, in progress, and not started. The user moves a day at a time or picks a date. The heading reads "Game(s) Today" or "Game(s) on {date}".

Each card is one of:

- Upcoming — scheduled tip, teams, and a compact header from Firebase `gameHeader22`
- In progress — live score header from the same path
- Completed — final score header

A timer refreshes the scoreboard. The interval lengthens when no game is live and shortens when any game is in progress. The timer stops when every game that day is final. Tapping a card opens the game screen.

Startup must already have loaded league standings, the full schedule, the player and team lists, and league team stats. If that load fails, the app shows a no-connection view instead of the dashboard.

## Game view

`GameView` is the live (or archived) game page. It streams `gameData22/{gameId}` from Firebase Realtime Database.

The pinned header depends on status:

| Status | Header |
| --- | --- |
| 1, scheduled | Scheduled matchup |
| 2, in progress | Score header plus a win-probability chart from NBA Stats |
| 3, final | Final score header |

If the database has no document yet, the page shows the scheduled header and "No game data yet...".

The bottom bar switches the body and opens related pages:

- Play-by-play feed, with a count of feed items
- Fan chat, with a message count
- Game stats (separate page)
- Game news (separate page)
- Compose a chat message

### Play-by-play

`GameFeedMain` listens to `gamePbp22/{gameId}` and `gameReactions22`. Plays render in order. A play can open a popup. Where NBA Stats marks an event as having video, the app requests the video asset and plays it with `video_player`.

### Chat

`ChatFeed` listens to `gameChat22/{gameId}`. An empty node shows "No one's talking yet...". The compose dialog writes a new message under that game. Chat is the social layer of a single game; it is not a league-wide room.

### Game stats

`GameStatsView` is a five-tab page:

- Game — who is on the court, arena, officials
- Stats — shared game stat widgets
- Away team box score
- Home team box score
- Video

Each team box score (`GameBoxScoreMain`) switches among summary, advanced, defensive, and four factors. Those tables are filled from NBA Stats box-score endpoints (traditional, advanced, defensive, four factors) and from the live CDN box score when that feed is used.

### Game news

`GameNewsView` collects preview and recap articles from `data.nba.net` (`{gameId}_preview_article.json` and `{gameId}_recap_article.json`) plus related news search results. Separate article screens (`game_preview_article`, `game_recap_article`) render the story body.

## Teams

`TeamDetails` is the team hub. The app bar and accents use the team's colors from `constant.dart`. The header shows logo, conference, division, record, games back, and streak from the cached league standings.

Sections on the page:

- Team info — profile facts from the NBA team profile feed
- Stats snapshot, with a button into the full team stats page
- Social — a short Twitter-style search feed for the team name, plus a full feed page
- Schedule — upcoming and recent games, plus the full team schedule
- Roster — players on the team; a row opens the player page
- Leaders — team leaders in points, rebounds, assists, field-goal percentage, blocks, steals, turnovers, and personal fouls

### Team stats

`TeamStatsView` has six tabs:

| Tab | What it shows |
| --- | --- |
| Summary | Season team stat cards (base, advanced, and related measures) |
| Games | Game log and trend charts (base, scoring, opponent, advanced, four factors, misc) |
| Last N | The same measures limited to a recent game window |
| Shooting | Charts for general shooting, closest defender, dribbles, and touch time |
| Splits | General, game-situation, and shooting splits |
| Lineups | Five-man lineup stats |

Data comes from NBA Stats team dashboards (`leaguedashteamstats`, `teamgamelogs`, `teamdashboardbylastngames`, `teamdashptshots`, shooting and general splits, `teamdashlineups`). Measure type and per-mode (totals versus per game) follow the controls on each screen.

## Players

Search is opened from the title bar. `PlayerSearch` filters the cached league player list as the user types and lists matches. A result opens `PlayerDetail`.

The player page shows the NBA headshot, name, jersey, and position, then bio fields: height, weight, country, years pro, age, birthday, draft pick, and college. Below that are three season stat blocks:

- Base counting stats and ranks
- Advanced stats and ranks
- Defense stats and ranks

Detailed stats (`PlayerDetailedStats`) add:

- Year-over-year summary (base and advanced)
- Shooting tables and charts: general, closest defender, dribble, shot clock, touch time
- Clutch splits
- Game splits, general splits, and shooting splits

Those views call NBA Stats player dashboards (`playerdashboardbyyearoveryear`, `playerdashptshots`, `playerdashboardbyclutch`, shooting and game splits) and the player game log. Shot charts use `shotchartdetail`.

## Standings

`Standings` reads the standings list loaded at startup (`leaguestandingsv3`). Three modes, stored on `SeasonProv`, change the table:

- League
- Conference
- Division

`SeasonProv` also holds a season list from `2022-23` back to `2013-14`. The standings widget renders wins, losses, and related columns from `LeagueStandingList`. A smaller standings widget exists for embedding the same table in other layouts.

## League stats and leaders

`LeadersMain` is a three-tab browser:

- Today — daily leaders
- Teams — team leaderboards
- Players — player leaderboards

`LeagueStats` is a sortable league table. The user picks a measure (base, advanced, misc, four factors, opponent, scoring), a per-mode, and a last-N-games window. Each measure has its own grid widget. Column headers can open a short stat explanation. Definitions for those abbreviations live in `stat_definition.dart`.

`StatCalculator` derives true shooting percentage from field goals, free throws, and points when a display needs a rate the feed does not already include.

## News and media

`NewsMainScreen` has four tabs:

- News — NBA news search results
- Video — video search for NBA basketball, including a team video feed
- Injuries — injury report (Fantasy Nerds JSON, with an XML injury feed converted by `Network.getJsonFromXml`)
- Transactions — NBA player-movement feed (signings, waivers, trades)

Team pages embed a shorter social feed and can open the full feed for that club. Game pages link news and video beside the box score.

## Accounts

`AccountMain` has two tabs: User and Updates.

The user tab shows initials and either a signed-out prompt or the display name and email. Signed-out users get Login and Sign up. Signed-in users can log out.

- Sign up (`Auth.registerUser`) creates an email/password Firebase Auth user and writes display name, email, and favorite team to Firestore `users/{uid}`.
- Login (`Auth.loginUser`) signs in, loads that Firestore document, and stores the user locally.
- The next cold start restores the local user so the app treats them as logged in.

Favorite team is collected on the account model. Updates is a separate tab on the account screen for in-app notices.

## Help

`HelpGlossary` is a route titled Help/Glossary. The body is a placeholder ("Coming soon..."). The stat copy it would show is already compiled in `stat_definition.dart` and is used by stat-info dialogs on league tables.

## What the app does not do

These paths exist in the tree but are not part of the running product:

- The dashboard floating menu that jumped to standings, leaders, league stats, and news is commented out. Those screens remain reachable from other widgets.
- `lib/old_files/` holds earlier game and schedule screens that `main.dart` does not mount.
- The notifications button in the title bar has no action.
- The app does not compute its own live scoreboard. Live headers, play-by-play, and chat depend on Firebase documents being written by an external process.
