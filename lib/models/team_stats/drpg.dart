class Drpg {
	String avg;
	String rank;

	Drpg({this.avg, this.rank});

	factory Drpg.fromJson(Map<String, dynamic> json) {
		return Drpg(
			avg: json['avg'] as String,
			rank: json['rank'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'avg': avg,
			'rank': rank,
		};
	}

	Drpg copyWith({
		String avg,
		String rank,
	}) {
		return Drpg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
