class Pfpg {
	String avg;
	String rank;

	Pfpg({this.avg, this.rank});

	factory Pfpg.fromJson(Map<String, dynamic> json) {
		return Pfpg(
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

	Pfpg copyWith({
		String avg,
		String rank,
	}) {
		return Pfpg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
