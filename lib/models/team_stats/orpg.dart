class Orpg {
	String avg;
	String rank;

	Orpg({this.avg, this.rank});

	factory Orpg.fromJson(Map<String, dynamic> json) {
		return Orpg(
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

	Orpg copyWith({
		String avg,
		String rank,
	}) {
		return Orpg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
