class Bpg {
	String avg;
	String rank;

	Bpg({this.avg, this.rank});

	factory Bpg.fromJson(Map<String, dynamic> json) {
		return Bpg(
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

	Bpg copyWith({
		String avg,
		String rank,
	}) {
		return Bpg(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
