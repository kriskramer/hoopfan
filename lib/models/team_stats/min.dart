class Min {
	String avg;
	String rank;

	Min({this.avg, this.rank});

	factory Min.fromJson(Map<String, dynamic> json) {
		return Min(
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

	Min copyWith({
		String avg,
		String rank,
	}) {
		return Min(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
