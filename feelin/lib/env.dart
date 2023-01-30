
enum BuildFlavor { production, development, staging }

BuildEnvironment get env => _env!;
BuildEnvironment? _env;

class BuildEnvironment {
  /// The backend server.
  final String socialBaseUrl;
  final String coreBaseUrl;
  final BuildFlavor flavor;

  BuildEnvironment._init({required this.flavor, required this.socialBaseUrl, required this.coreBaseUrl});

  /// Sets up the top-level [env] getter on the first call only.
  static void init({required flavor, required socialBaseUrl, required coreBaseUrl}) =>
      _env ??= BuildEnvironment._init(flavor: flavor, socialBaseUrl: socialBaseUrl, coreBaseUrl: coreBaseUrl);
}