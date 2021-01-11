class Tpp {
	String avg;
	String rank;

	Tpp({this.avg, this.rank});

	factory Tpp.fromJson(Map<String, dynamic> json) {
		return Tpp(
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

	Tpp copyWith({
		String avg,
		String rank,
	}) {
		return Tpp(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
