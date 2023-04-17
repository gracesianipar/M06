import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cobacoba/pertemuan06/pertemuan06_provider.dart';

class Pertemuan06Screen extends StatefulWidget {
  const Pertemuan06Screen({super.key});

  @override
  State<Pertemuan06Screen> createState() => _Pertemuan06Screen();
}

class _Pertemuan06Screen extends State<Pertemuan06Screen> {
  // String? _selectedCita;

  // Map<String, Map<String, String>> _citaCitaDetails = {
  //   'Pengusaha': {
  //     'gambar': 'https://i.imgur.com/F2tJZOO.png',
  //     'detail': 'Membangun dan mengembangkan bisnis yang sukses'
  //   },
  //   'Dokter': {
  //     'gambar': 'https://i.imgur.com/4EMsF4D.png',
  //     'detail': 'Menyembuhkan penyakit dan menyelamatkan nyawa orang lain'
  //   },
  //   'Pengajar': {
  //     'gambar': 'https://i.imgur.com/7PZWWKf.png',
  //     'detail':
  //         'Memberikan ilmu pengetahuan dan membentuk generasi penerus yang berkualitas'
  //   },
  //   'Seniman': {
  //     'gambar': 'https://i.imgur.com/9iVPLFY.png',
  //     'detail': 'Mengekspresikan ide dan emosi melalui seni'
  //   },
  //   'Atlet': {
  //     'gambar': 'https://i.imgur.com/hGxIjS8.png',
  //     'detail':
  //         'Mencapai prestasi tertinggi di bidang olahraga dan membanggakan negara'
  //   }
  // };

  String? value;
  String _selectedCita = 'Belum dipilih';

  List<String> _citaCitaList = [
    "Belum dipilih",
    "Menjadi programmer",
    "Menjadi development",
    "Menjadi fullstack",
    "Menjadi dokter hewan",
    "Menjadi seniman",
  ];

  Map<String, String> _detailCita = {
    "Menjadi programmer":
        "Membuat solusi teknologi yang bermanfaat bagi orang lain, dari aplikasi mobile hingga perangkat lunak bisnis. Menjadi programmer dapat memberikan penghasilan yang tinggi, terutama jika Anda ahli dalam bidang yang diminati oleh perusahaan.",
    "Menjadi development":
        "Development adalah suatu proses dalam menciptakan suatu produk, aplikasi, atau sistem komputer yang meliputi seluruh tahapan dari perencanaan, desain, implementasi, hingga pengujian dan pemeliharaan. Tugas utama adalah untuk membuat dan mengembangkan software atau aplikasi dengan menggunakan bahasa pemrograman yang tepat serta mengikuti standar dan metode yang telah ditentukan.",
    "Menjadi fullstack":
        "Full stack development adalah pengembangan aplikasi yang melibatkan pengembangan baik pada sisi front-end (tampilan pengguna) maupun back-end (logika bisnis dan database). Seorang full stack developer dapat merancang, membangun, dan mengelola seluruh aplikasi web atau mobile dari awal hingga akhir. Mereka memiliki pengetahuan dan keterampilan di beberapa bidang seperti HTML, CSS, JavaScript, pemrograman server-side, pengembangan database, dan sebagainya.",
    "Menjadi dokter hewan":
        "Tugas utama dokter hewan adalah melakukan pemeriksaan, diagnosis, dan pengobatan untuk menjaga kesehatan hewan, mencegah dan mengobati penyakit, serta mempromosikan kesejahteraan hewan. Dokter hewan juga dapat melakukan penelitian dan pengembangan terkait dengan kesehatan dan kesejahteraan hewan.",
    "Menjadi seniman":
        "Seniman dapat menciptakan karya seni yang menyenangkan untuk dinikmati oleh orang lain, seperti film, musik, atau pertunjukan panggung.dan menghasilkan karya seni yang memukau",
  };

  Map<String, String> _citaCitaImage = {
    "Menjadi programmer":
        'https://global-uploads.webflow.com/6100d0111a4ed76bc1b9fd54/6193dca3e8165c52e89c7f2b_florian-olivo-4hbJ-eymZ1o-unsplash.jpg',
    "Menjadi development":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ4LSxgrD7MXmnVHA1Ly6gso4lWNFocSzqaw&usqp=CAU',
    "Menjadi fullstack":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB-xD8VY9AsKeVedHQyvGzLjqTB_Gh_lcK1m_mC_to6heVi13uXRo21TgZmQXM6l6hihk&usqp=CAU',
    "Menjadi dokter hewan":
        'https://i0.wp.com/jejakpiknik.com/wp-content/uploads/2022/07/dokter-hewan-palembang-terdekat-630x380.jpg?resize=630%2C380&ssl=1',
    "Menjadi seniman": 'https://assets.indozone.news/local/5d6f7fe0b3d84.jpg',
  };

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan06Provider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Switches | DropdownB.')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark mode theme'),
                Switch(
                    value: prov.enableDarkMode,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      prov.setBrightness = val;
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cita-Cita'),
                DropdownButton(
                    value: _selectedCita,
                    items: _citaCitaList.map((citaCita) {
                      return DropdownMenuItem(
                        child: Text(citaCita),
                        value: citaCita,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCita = value as String;
                      });
                    })
              ],
            ),
            SizedBox(height: 16.0),
            Text("Rincian cita-cita:"),
            Text('Cita-cita yang anda pilih:'),
            Text('$_selectedCita',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            // Text('Cita-cita yang dipilih: $_selectedCita',
            //     style:
            //         const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Image.network(
              _citaCitaImage[_selectedCita] ?? '',
              width: 200,
              fit: BoxFit.cover,
            ),
            Text(_detailCita[_selectedCita] ?? "Belum ada rincian",
                style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
