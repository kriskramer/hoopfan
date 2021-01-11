import "sort_key.dart";
import "team_sites_only.dart";

class Standing {
	String teamId;
	String win;
	String loss;
	String winPct;
	String winPctV2;
	String lossPct;
	String lossPctV2;
	String gamesBehind;
	String divGamesBehind;
	String clinchedPlayoffsCode;
	String clinchedPlayoffsCodeV2;
	String confRank;
	String confWin;
	String confLoss;
	String divWin;
	String divLoss;
	String homeWin;
	String homeLoss;
	String awayWin;
	String awayLoss;
	String lastTenWin;
	String lastTenLoss;
	String streak;
	String divRank;
	bool isWinStreak;
	TeamSitesOnly teamSitesOnly;
	String tieBreakerPts;
	SortKey sortKey;

	Standing({
		this.teamId,
		this.win,
		this.loss,
		this.winPct,
		this.winPctV2,
		this.lossPct,
		this.lossPctV2,
		this.gamesBehind,
		this.divGamesBehind,
		this.clinchedPlayoffsCode,
		this.clinchedPlayoffsCodeV2,
		this.confRank,
		this.confWin,
		this.confLoss,
		this.divWin,
		this.divLoss,
		this.homeWin,
		this.homeLoss,
		this.awayWin,
		this.awayLoss,
		this.lastTenWin,
		this.lastTenLoss,
		this.streak,
		this.divRank,
		this.isWinStreak,
		this.teamSitesOnly,
		this.tieBreakerPts,
		this.sortKey,
	});

	factory Standing.fromJson(Map<String, dynamic> json) {
		return Standing(
			teamId: json['teamId'] as String,
			win: json['win'] as String,
			loss: json['loss'] as String,
			winPct: json['winPct'] as String,
			winPctV2: json['winPctV2'] as String,
			lossPct: json['lossPct'] as String,
			lossPctV2: json['lossPctV2'] as String,
			gamesBehind: json['gamesBehind'] as String,
			divGamesBehind: json['divGamesBehind'] as String,
			clinchedPlayoffsCode: json['clinchedPlayoffsCode'] as String,
			clinchedPlayoffsCodeV2: json['clinchedPlayoffsCodeV2'] as String,
			confRank: json['confRank'] as String,
			confWin: json['confWin'] as String,
			confLoss: json['confLoss'] as String,
			divWin: json['divWin'] as String,
			divLoss: json['divLoss'] as String,
			homeWin: json['homeWin'] as String,
			homeLoss: json['homeLoss'] as String,
			awayWin: json['awayWin'] as String,
			awayLoss: json['awayLoss'] as String,
			lastTenWin: json['lastTenWin'] as String,
			lastTenLoss: json['lastTenLoss'] as String,
			streak: json['streak'] as String,
			divRank: json['divRank'] as String,
			isWinStreak: json['isWinStreak'] as bool,
			teamSitesOnly: json['teamSitesOnly'] == null
					? null
					: TeamSitesOnly.fromJson(json['teamSitesOnly'] as Map<String, dynamic>),
			tieBreakerPts: json['tieBreakerPts'] as String,
			sortKey: json['sortKey'] == null
					? null
					: SortKey.fromJson(json['sortKey'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'teamId': teamId,
			'win': win,
			'loss': loss,
			'winPct': winPct,
			'winPctV2': winPctV2,
			'lossPct': lossPct,
			'lossPctV2': lossPctV2,
			'gamesBehind': gamesBehind,
			'divGamesBehind': divGamesBehind,
			'clinchedPlayoffsCode': clinchedPlayoffsCode,
			'clinchedPlayoffsCodeV2': clinchedPlayoffsCodeV2,
			'confRank': confRank,
			'confWin': confWin,
			'confLoss': confLoss,
			'divWin': divWin,
			'divLoss': divLoss,
			'homeWin': homeWin,
			'homeLoss': homeLoss,
			'awayWin': awayWin,
			'awayLoss': awayLoss,
			'lastTenWin': lastTenWin,
			'lastTenLoss': lastTenLoss,
			'streak': streak,
			'divRank': divRank,
			'isWinStreak': isWinStreak,
			'teamSitesOnly': teamSitesOnly?.toJson(),
			'tieBreakerPts': tieBreakerPts,
			'sortKey': sortKey?.toJson(),
		};
	}

	Standing copyWith({
		String teamId,
		String win,
		String loss,
		String winPct,
		String winPctV2,
		String lossPct,
		String lossPctV2,
		String gamesBehind,
		String divGamesBehind,
		String clinchedPlayoffsCode,
		String clinchedPlayoffsCodeV2,
		String confRank,
		String confWin,
		String confLoss,
		String divWin,
		String divLoss,
		String homeWin,
		String homeLoss,
		String awayWin,
		String awayLoss,
		String lastTenWin,
		String lastTenLoss,
		String streak,
		String divRank,
		bool isWinStreak,
		TeamSitesOnly teamSitesOnly,
		String tieBreakerPts,
		SortKey sortKey,
	}) {
		return Standing(
			teamId: teamId ?? this.teamId,
			win: win ?? this.win,
			loss: loss ?? this.loss,
			winPct: winPct ?? this.winPct,
			winPctV2: winPctV2 ?? this.winPctV2,
			lossPct: lossPct ?? this.lossPct,
			lossPctV2: lossPctV2 ?? this.lossPctV2,
			gamesBehind: gamesBehind ?? this.gamesBehind,
			divGamesBehind: divGamesBehind ?? this.divGamesBehind,
			clinchedPlayoffsCode: clinchedPlayoffsCode ?? this.clinchedPlayoffsCode,
			clinchedPlayoffsCodeV2: clinchedPlayoffsCodeV2 ?? this.clinchedPlayoffsCodeV2,
			confRank: confRank ?? this.confRank,
			confWin: confWin ?? this.confWin,
			confLoss: confLoss ?? this.confLoss,
			divWin: divWin ?? this.divWin,
			divLoss: divLoss ?? this.divLoss,
			homeWin: homeWin ?? this.homeWin,
			homeLoss: homeLoss ?? this.homeLoss,
			awayWin: awayWin ?? this.awayWin,
			awayLoss: awayLoss ?? this.awayLoss,
			lastTenWin: lastTenWin ?? this.lastTenWin,
			lastTenLoss: lastTenLoss ?? this.lastTenLoss,
			streak: streak ?? this.streak,
			divRank: divRank ?? this.divRank,
			isWinStreak: isWinStreak ?? this.isWinStreak,
			teamSitesOnly: teamSitesOnly ?? this.teamSitesOnly,
			tieBreakerPts: tieBreakerPts ?? this.tieBreakerPts,
			sortKey: sortKey ?? this.sortKey,
		);
	}
}
