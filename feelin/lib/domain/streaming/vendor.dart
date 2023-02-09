enum Vendor {
  none('Nothing'),
  spotify('Spotify'),
  appleMusic('Apple Music');

  const Vendor(this.name);

  final String name;

  static Vendor strToVendor(String str) {
    switch(str){
      case 'spotify': return Vendor.spotify;
      case 'applemusic': return Vendor.appleMusic;
      default: return Vendor.none;
    }
  }
}