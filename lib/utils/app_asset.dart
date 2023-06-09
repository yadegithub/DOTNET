class AppAsset {
  static String icon(String s) {
    return 'assets/icons/$s';
  }

  static String logo(String s) {
    return 'assets/logos/$s';
  }

  static String image(String s) {
    return 'assets/images/$s';
  }

  static String logoAirline(String airlineCode) {
    if (airlineCode.contains('QZ')) {
      return 'assets/logos/logo_air_asia.png';
    } else if (airlineCode.contains('ID')) {
      return 'assets/logos/logo_batik_air.png';
    } else if (airlineCode.contains('QG')) {
      return 'assets/logos/logo_citilink.png';
    } else if (airlineCode.contains('GA')) {
      return 'assets/logos/logo_garuda_indonesia.png';
    } else if (airlineCode.contains('MR')) {
      return 'assets/logos/mauritanei.png';
    } else if (airlineCode.contains('SJ')) {
      return 'assets/logos/logo_sriwijaya_air.png';
    } else if (airlineCode.contains('IU')) {
      return 'assets/logos/mauritanei.png';
    } else if (airlineCode.contains('IW')) {
      return 'assets/logos/mauritanei.png';
    } else {
      return 'assets/logos/mauritanei.png';
    }
  }
}
