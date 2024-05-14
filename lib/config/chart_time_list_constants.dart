class ChartTime {
  final String label;
  final int value;

  ChartTime(this.label, this.value);
}

class ChartTimeListConstants {
  List<ChartTime> timeList = [
    ChartTime('1h', 1),
    ChartTime('3h', 3),
    ChartTime('12h', 12),
    ChartTime('1d', 24),
  ];
}
