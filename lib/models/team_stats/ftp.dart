class Ftp {
	String avg;
	String rank;

	Ftp({this.avg, this.rank});

	factory Ftp.fromJson(Map<String, dynamic> json) {
		return Ftp(
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

	Ftp copyWith({
		String avg,
		String rank,
	}) {
		return Ftp(
			avg: avg ?? this.avg,
			rank: rank ?? this.rank,
		);
	}
}
