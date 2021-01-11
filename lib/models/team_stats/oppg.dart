class Oppg {
	String avg;
	String rank;

	Oppg({this.avg, this.rank});

	factory Oppg.fromJson(Map<String, dynamic> json) {
		return Oppg(
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

	Oppg copyWith({
		String avg,
		String rank,
	}) {
		return Oppg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
