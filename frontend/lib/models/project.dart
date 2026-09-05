class Project {
  final String id;
  final String number;
  final String name;
  final String category;
  final String stage;
  final String tagline;
  final String overview;
  final String role;
  final List<String> outcomes;
  final List<String> technologies;
  final List<String> architecture;
  final List<String> approach;
  final List<String> challenges;
  final List<String> roadmap;
  final String? webUrl;
  final String? androidUrl;
  final String? iosUrl;
  final String? githubUrl;

  const Project({
    required this.id,
    required this.number,
    required this.name,
    required this.category,
    required this.stage,
    required this.tagline,
    required this.overview,
    required this.role,
    required this.outcomes,
    required this.technologies,
    required this.architecture,
    required this.approach,
    required this.challenges,
    required this.roadmap,
    this.webUrl,
    this.androidUrl,
    this.iosUrl,
    this.githubUrl,
  });
}
