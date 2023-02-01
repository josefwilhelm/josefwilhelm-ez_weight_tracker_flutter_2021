import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

@freezed
class Statistics with _$Statistics {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory Statistics({
    @Default(0) int currentStreak,
    @Default(0) int maxStreak,
    @Default(0) int averageSession,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}
