delayThings(
    {Duration duration: const Duration(milliseconds: 1500),
    dynamic Function() func}) {
  Future.delayed(duration, func);
}
