class FileInfo {
  final String fileName;
  final String fileUrl;

  const FileInfo({
    required this.fileName,
    required this.fileUrl,
  });
}

List<FileInfo> filesData = [
  const FileInfo(
    fileName: "For Bigger Meltdowns",
    fileUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  ),
  const FileInfo(
    fileName: 'For bigger fun',
    fileUrl: 'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
  ),
  const FileInfo(
    fileName: 'Big bunny',
    fileUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  ),
];
