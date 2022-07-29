abstract class SeriesDetailsEvent {}

class LoadSeriesDetails extends SeriesDetailsEvent {
  final int tvId;
  LoadSeriesDetails({required this.tvId});
}
