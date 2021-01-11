class Eff {
	String avg;
	String rank;

	Eff({this.avg, this.rank});

	factory Eff.fromJson(Map<String, dynamic> json) {
		return Eff(
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

	Eff copyWith({
		String avg,
		String rank,
	}) {
		return Eff(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
