enum LottieItems { themeChange }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.themeChange:
        return 'webprofile';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
