class Globals {
  static const String repositoryLink =
      'https://github.com/Gold872/elastic-dashboard';
  static const String releasesLink = '$repositoryLink/releases/latest';

  static String ipAddress = '127.0.0.1';
  static int teamNumber = 353;
  static int gridSize = 128;
  static double cornerRadius = 15.0;
  static bool snapToGrid = true;
  static bool showGrid = false;

  static const double defaultPeriod = 0.1;
  static const double defaultGraphPeriod = 0.033;
}

class PrefKeys {
  static String layout = 'layout';
  static String ipAddress = 'ip_address';
  static String useTeamNumberForIP = 'ip_from_team_number';
  static String teamNumber = 'team_number';
  static String teamColor = 'team_color';
  static String gridSize = 'grid_size';
  static String cornerRadius = 'corner_radius';
  static String snapToGrid = 'snap_to_grid';
  static String showGrid = 'show_grid';
}
