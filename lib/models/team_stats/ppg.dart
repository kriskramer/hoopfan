class Ppg {
	String avg;
	String rank;

	Ppg({this.avg, this.rank});

	factory Ppg.fromJson(Map<String, dynamic> json) {
		return Ppg(
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

	Ppg copyWith({
		String avg,
		String rank,
	}) {
		return Ppg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
