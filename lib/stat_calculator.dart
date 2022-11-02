import 'package:hoop/models/game_data.dart';
import 'package:hoop/models/player_base_stat_and_rank.dart';

class StatCalculator {
  // True Shooting Percentage methods
  static double getTSPercentGame(GamePlayer player) {
    GamePlayerStatistics stats = player.statistics;

    var ts = 0.0;
    var tsa = 2 *
        (double.parse(stats.freeThrowsAttempted.toString()) * 0.44 +
            int.parse(stats.fieldGoalsAttempted.toString()));
    ts = int.parse(stats.points.toString()) / tsa;
    return ts;
  }

  static double getTSPercentSeason(PlayerBaseStatAndRank stats) {
    var ts = 0.0;
    var tsa = 2 * (stats.fta * 0.44 + stats.fga);
    ts = stats.pts / tsa;
    return ts;
  }

  static double getTSPercent(int fta, int fga, int pts) {
    var ts = 0.0;
    var tsa = 2 * (fta * 0.44 + fga);
    ts = pts / tsa;
    return ts;
  }

  // Effective Field Goal Percent methods

  // Usage Rate methods

}
