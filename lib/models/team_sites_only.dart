class TeamSitesOnly {
	String teamKey;
	String teamName;
	String teamCode;
	String teamNickname;
	String teamTricode;
	String clinchedConference;
	String clinchedDivision;
	String clinchedPlayoffs;
	String streakText;

	TeamSitesOnly({
		this.teamKey,
		this.teamName,
		this.teamCode,
		this.teamNickname,
		this.teamTricode,
		this.clinchedConference,
		this.clinchedDivision,
		this.clinchedPlayoffs,
		this.streakText,
	});

	factory TeamSitesOnly.fromJson(Map<String, dynamic> json) {
		return TeamSitesOnly(
			teamKey: json['teamKey'] as String,
			teamName: json['teamName'] as String,
			teamCode: json['teamCode'] as String,
			teamNickname: json['teamNickname'] as String,
			teamTricode: json['teamTricode'] as String,
			clinchedConference: json['clinchedConference'] as String,
			clinchedDivision: json['clinchedDivision'] as String,
			clinchedPlayoffs: json['clinchedPlayoffs'] as String,
			streakText: json['streakText'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'teamKey': teamKey,
			'teamName': teamName,
			'teamCode': teamCode,
			'teamNickname': teamNickname,
			'teamTricode': teamTricode,
			'clinchedConference': clinchedConference,
			'clinchedDivision': clinchedDivision,
			'clinchedPlayoffs': clinchedPlayoffs,
			'streakText': streakText,
		};
	}

	TeamSitesOnly copyWith({
		String teamKey,
		String teamName,
		String teamCode,
		String teamNickname,
		String teamTricode,
		String clinchedConference,
		String clinchedDivision,
		String clinchedPlayoffs,
		String streakText,
	}) {
		return TeamSitesOnly(
			teamKey: teamKey ?? this.teamKey,
			teamName: teamName ?? this.teamName,
			teamCode: teamCode ?? this.teamCode,
			teamNickname: teamNickname ?? this.teamNickname,
			teamTricode: teamTricode ?? this.teamTricode,
			clinchedConference: clinchedConference ?? this.clinchedConference,
			clinchedDivision: clinchedDivision ?? this.clinchedDivision,
			clinchedPlayoffs: clinchedPlayoffs ?? this.clinchedPlayoffs,
			streakText: streakText ?? this.streakText,
		);
	}
}
