class Project {
  final String id;
  final String name;
  final String type;
  final String desc;
  final String imgUrl;
  final String githubLink;
  final String dribbbleLink;
  final String externalLink;
  final List<dynamic> images;

  Project({
    required this.id,
    required this.name,
    required this.type,
    required this.imgUrl,
    required this.githubLink,
    required this.externalLink,
    required this.dribbbleLink,
    required this.desc,
    required this.images,
  });
}
