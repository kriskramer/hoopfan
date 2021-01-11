class Apg {
	String avg;
	String rank;

	Apg({this.avg, this.rank});

	factory Apg.fromJson(Map<String, dynamic> json) {
		return Apg(
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

	Apg copyWith({
		String avg,
		String rank,
	}) {
		return Apg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
