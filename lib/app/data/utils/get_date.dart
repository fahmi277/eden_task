
class GetDatetime {
  var hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
  var bulan = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Ags',
    'Sep',
    'Okt',
    'Nov',
    'Des'
  ];
  final now = DateTime.now();

  String result() {
    String dataTanggal = now.day.toString();

    if (now.day < 9) {
      dataTanggal = '0 ${now.day}';
    }
    String dateNow = hari[now.weekday - 1] +
        ', $dataTanggal ${bulan[now.month]} ${now.year}';

    return dateNow;
  }
}
