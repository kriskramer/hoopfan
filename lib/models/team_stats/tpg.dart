class Tpg {
	String avg;
	String rank;

	Tpg({this.avg, this.rank});

	factory Tpg.fromJson(Map<String, dynamic> json) {
		return Tpg(
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

	Tpg copyWith({
		String avg,
		String rank,
	}) {
		return Tpg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
