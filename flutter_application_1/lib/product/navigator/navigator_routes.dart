import '../../navigation/lottiestart.dart';
import '../../navigation/personalweb.dart';

class NavigatorRouters {
  static const paragfh = "/";
  final items = {
    paragfh: (context) => const LottieWeb(),
    NavigateRouters.home.withParaf: (context) => const MyPortfolio(),
  };
}

enum NavigateRouters { start, home }

extension NavigateRoutersExtension on NavigateRouters {
  String get withParaf => "/$name";
}
