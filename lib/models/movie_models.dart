class Movie {
  final String movieImage;
  final String bannerTrailer;
  final String linkTrailer;
  final String title;
  final int year;
  final String typeMovie;
  final int duration;
  final String sinopsis;
  final List<Cast> cast;

  Movie({
    required this.movieImage,
    required this.bannerTrailer,
    required this.linkTrailer,
    required this.title,
    required this.year,
    required this.typeMovie,
    required this.duration,
    required this.sinopsis,
    required this.cast,
  });
}

class Cast {
  final String name;
  final String peran;
  final String image;

  Cast({
    required this.name,
    required this.peran,
    required this.image,
  });
}