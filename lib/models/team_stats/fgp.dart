class Fgp {
	String avg;
	String rank;

	Fgp({this.avg, this.rank});

	factory Fgp.fromJson(Map<String, dynamic> json) {
		return Fgp(
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

	Fgp copyWith({
		String avg,
		String rank,
	}) {
		return Fgp(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
