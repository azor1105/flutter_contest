part of 'download_cubit.dart';

class DonwloadState extends Equatable {
  const DonwloadState({
    this.fileInfo,
    this.progress = 0.0,
    this.isPaused,
  });

  final FileInfo? fileInfo;
  final double progress;
  final bool? isPaused;

  DonwloadState copyWith({
    FileInfo? fileInfo,
    double? progress,
    bool? isPaused,
  }) =>
      DonwloadState(
        fileInfo: fileInfo ?? this.fileInfo,
        progress: progress ?? this.progress,
        isPaused: isPaused ?? this.isPaused,
      );

  @override
  List<Object?> get props => [
        fileInfo,
        progress,
        isPaused,
      ];
}
