class Song {
  int? id;
  String? title;
  String? scale;
  String? style;
  String? marefiya;
  String? transpose;
  int? isFavorite;
  String? typesong;
  String? keysong;
  int? songcolor;
  songMap() {
    var mapping = <String, dynamic>{};
    mapping['title'] = title;
    mapping['scale'] = scale;
    mapping['style'] = style;
    mapping['marefiya'] = marefiya;
    mapping['transpose'] = transpose;
    mapping['isFavorite'] = isFavorite;
    mapping['typesong'] = typesong;
    mapping['keysong'] = keysong;
    mapping['songcolor'] = songcolor;
    return mapping;
  }

  songUpdateMap() {
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['scale'] = scale;
    mapping['style'] = style;
    mapping['marefiya'] = marefiya;
    mapping['transpose'] = transpose;
    mapping['isFavorite'] = isFavorite;
    mapping['typesong'] = typesong;
    mapping['keysong'] = keysong;
    mapping['songcolor'] = songcolor;
    return mapping;
  }
}
