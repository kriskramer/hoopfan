class SortKey {
	int defaultOrder;
	int nickname;
	int win;
	int loss;
	int winPct;
	int gamesBehind;
	int confWinLoss;
	int divWinLoss;
	int homeWinLoss;
	int awayWinLoss;
	int lastTenWinLoss;
	int streak;

	SortKey({
		this.defaultOrder,
		this.nickname,
		this.win,
		this.loss,
		this.winPct,
		this.gamesBehind,
		this.confWinLoss,
		this.divWinLoss,
		this.homeWinLoss,
		this.awayWinLoss,
		this.lastTenWinLoss,
		this.streak,
	});

	factory SortKey.fromJson(Map<String, dynamic> json) {
		return SortKey(
			defaultOrder: json['defaultOrder'] as int,
			nickname: json['nickname'] as int,
			win: json['win'] as int,
			loss: json['loss'] as int,
			winPct: json['winPct'] as int,
			gamesBehind: json['gamesBehind'] as int,
			confWinLoss: json['confWinLoss'] as int,
			divWinLoss: json['divWinLoss'] as int,
			homeWinLoss: json['homeWinLoss'] as int,
			awayWinLoss: json['awayWinLoss'] as int,
			lastTenWinLoss: json['lastTenWinLoss'] as int,
			streak: json['streak'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'defaultOrder': defaultOrder,
			'nickname': nickname,
			'win': win,
			'loss': loss,
			'winPct': winPct,
			'gamesBehind': gamesBehind,
			'confWinLoss': confWinLoss,
			'divWinLoss': divWinLoss,
			'homeWinLoss': homeWinLoss,
			'awayWinLoss': awayWinLoss,
			'lastTenWinLoss': lastTenWinLoss,
			'streak': streak,
		};
	}

	SortKey copyWith({
		int defaultOrder,
		int nickname,
		int win,
		int loss,
		int winPct,
		int gamesBehind,
		int confWinLoss,
		int divWinLoss,
		int homeWinLoss,
		int awayWinLoss,
		int lastTenWinLoss,
		int streak,
	}) {
		return SortKey(
			defaultOrder: defaultOrder ?? this.defaultOrder,
			nickname: nickname ?? this.nickname,
			win: win ?? this.win,
			loss: loss ?? this.loss,
			winPct: winPct ?? this.winPct,
			gamesBehind: gamesBehind ?? this.gamesBehind,
			confWinLoss: confWinLoss ?? this.confWinLoss,
			divWinLoss: divWinLoss ?? this.divWinLoss,
			homeWinLoss: homeWinLoss ?? this.homeWinLoss,
			awayWinLoss: awayWinLoss ?? this.awayWinLoss,
			lastTenWinLoss: lastTenWinLoss ?? this.lastTenWinLoss,
			streak: streak ?? this.streak,
		);
	}
}
