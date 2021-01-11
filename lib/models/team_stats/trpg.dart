class Trpg {
	String avg;
	String rank;

	Trpg({this.avg, this.rank});

	factory Trpg.fromJson(Map<String, dynamic> json) {
		return Trpg(
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

	Trpg copyWith({
		String avg,
		String rank,
	}) {
		return Trpg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
