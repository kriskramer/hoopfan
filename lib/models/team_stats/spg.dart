class Spg {
	String avg;
	String rank;

	Spg({this.avg, this.rank});

	factory Spg.fromJson(Map<String, dynamic> json) {
		return Spg(
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

	Spg copyWith({
		String avg,
		String rank,
	}) {
		return Spg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
