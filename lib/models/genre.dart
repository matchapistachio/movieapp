class Genre {
  final String slug;
  final String nama;
  final int jumlah;

  Genre({
    required this.slug,
    required this.nama,
    required this.jumlah,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      slug: '',
      nama: '',
      jumlah: 0,

    );
  }
}