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
    fileName: 'Scratch',
    fileUrl:
        'https://firebasestorage.googleapis.com/v0/b/book-store-41f5d.appspot.com/o/scratch_programming_playground.pdf?alt=media&token=7f3213a8-6a82-4e71-adfa-6fa97a23c94e',
  ),
  const FileInfo(
    fileName: 'Einstein',
    fileUrl:
        'http://www.relativitycalculator.com/pdfs/abraham_pais_subtle_is_the_lord.pdf',
  ),
  const FileInfo(
    fileName: 'Big bunny',
    fileUrl:
        "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  ),
];
