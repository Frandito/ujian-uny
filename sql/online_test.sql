-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Feb 2020 pada 13.50
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_test`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nip` char(12) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `matkul_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nip`, `nama_dosen`, `email`, `matkul_id`) VALUES
(1, '11111111', 'Ina', 'ina@gmail.com', 1),
(2, '22222222', 'Anu', 'anu@gmail.com', 2),
(3, '33333333', 'Itu', 'itu@gmail.com', 3);

--
-- Trigger `dosen`
--
DELIMITER $$
CREATE TRIGGER `edit_user_dosen` BEFORE UPDATE ON `dosen` FOR EACH ROW UPDATE `users` SET `email` = NEW.email, `username` = NEW.nip WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hapus_user_dosen` BEFORE DELETE ON `dosen` FOR EACH ROW DELETE FROM `users` WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'dosen', 'Pembuat Soal dan ujian'),
(3, 'mahasiswa', 'Peserta Ujian');

-- --------------------------------------------------------

--
-- Struktur dari tabel `h_ujian`
--

CREATE TABLE `h_ujian` (
  `id` int(11) NOT NULL,
  `ujian_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `list_soal` longtext NOT NULL,
  `list_jawaban` longtext NOT NULL,
  `jml_benar` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL,
  `nilai_bobot` decimal(10,2) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `h_ujian`
--

INSERT INTO `h_ujian` (`id`, `ujian_id`, `mahasiswa_id`, `list_soal`, `list_jawaban`, `jml_benar`, `nilai`, `nilai_bobot`, `tgl_mulai`, `tgl_selesai`, `status`) VALUES
(1, 1, 1, '1,3,2,4,5', '1:B:N,3:B:N,2:B:N,4:A:N,5:C:N', 1, '20.00', '100.00', '2020-02-20 19:47:47', '2020-02-20 20:17:47', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'Pendidikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan_matkul`
--

CREATE TABLE `jurusan_matkul` (
  `id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jurusan_matkul`
--

INSERT INTO `jurusan_matkul` (`id`, `matkul_id`, `jurusan_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `jurusan_id`) VALUES
(1, 'Bahasa Indonesia', 1),
(2, 'Bahasa Inggris', 1),
(3, 'Matematika', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_dosen`
--

CREATE TABLE `kelas_dosen` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kelas_dosen`
--

INSERT INTO `kelas_dosen` (`id`, `kelas_id`, `dosen_id`) VALUES
(2, 1, 1),
(3, 2, 2),
(4, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(7, '::1', 'ina@ina@gmail.com', 1582139268),
(8, '::1', 'ina@ina@gmail.com', 1582139272);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nim` char(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kelas_id` int(11) NOT NULL COMMENT 'kelas&jurusan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `nim`, `email`, `jenis_kelamin`, `kelas_id`) VALUES
(1, 'Alex', '11223344', 'alex@gmail.com', 'L', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `jenis_nilai` int(1) NOT NULL COMMENT '1 : dikotomus 2: politomus'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `nama_matkul`, `jenis_nilai`) VALUES
(1, 'Pedagogik', 1),
(2, 'Profesional', 1),
(3, 'Sosial', 2),
(4, 'Kepribadian', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_nilai`
--

CREATE TABLE `m_nilai` (
  `id_m` int(11) NOT NULL,
  `nama_nilai` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_nilai`
--

INSERT INTO `m_nilai` (`id_m`, `nama_nilai`) VALUES
(1, 'Dikotomus'),
(2, 'Politomus');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_ujian`
--

CREATE TABLE `m_ujian` (
  `id_ujian` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `nama_ujian` varchar(200) NOT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `waktu` int(11) NOT NULL,
  `jenis` enum('acak','urut') NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `terlambat` datetime NOT NULL,
  `token` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_ujian`
--

INSERT INTO `m_ujian` (`id_ujian`, `dosen_id`, `matkul_id`, `nama_ujian`, `jumlah_soal`, `waktu`, `jenis`, `tgl_mulai`, `terlambat`, `token`) VALUES
(1, 1, 1, '1', 5, 30, 'acak', '2020-02-20 19:37:15', '2020-02-20 21:37:16', 'UHVCZ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `bobot` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tipe_file` varchar(50) NOT NULL,
  `soal` longtext NOT NULL,
  `opsi_a` longtext NOT NULL,
  `opsi_b` longtext NOT NULL,
  `opsi_c` longtext NOT NULL,
  `opsi_d` longtext NOT NULL,
  `opsi_e` longtext NOT NULL,
  `file_a` varchar(255) NOT NULL,
  `file_b` varchar(255) NOT NULL,
  `file_c` varchar(255) NOT NULL,
  `file_d` varchar(255) NOT NULL,
  `file_e` varchar(255) NOT NULL,
  `jawaban` varchar(5) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_soal`
--

INSERT INTO `tb_soal` (`id_soal`, `dosen_id`, `matkul_id`, `bobot`, `file`, `tipe_file`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `file_a`, `file_b`, `file_c`, `file_d`, `file_e`, `jawaban`, `created_on`, `updated_on`) VALUES
(1, 1, 1, 1, '', '', '<p>Ketika  seorang   guru akan mengajarkan apresiasi sasatra tentang  cerita pendek kepada peserta didik kelas VII, Semester 2 SMP,  dengan bertitik tolak pada kompetensi dasar (KD), “Menangkap makna teks hasil observasi, tanggapan deskriptif, eksposisi, eksplanasi, dan ceritra   pendek, baik secara lisan maupun tulisan ,” rumusan indikator pencapaian kompetensi (IPK) pembelajaran yang relevan adalah ....</p>', '<p>menjelaskan kalimat-kalimat yang terdapat dalam  cerita pendek;</p>', '<p>menemukan keterkaitan isi teks cerita pendek dengan kehidupan sehari-hari;</p>', '<p>mengidentifikasi  ciri   kebahasaan yang digunakan dalam cerita pendek;  </p>', '<p>menjelaskan  makna ungkapan-ungkapan  yang terdapat dalam cerita pendek;  </p>', '<p>mengidentifikasi struktur teks yang terdapat dalam cerita pendek.</p>', '', '', '', '', '', 'B', 1582139383, 1582155865),
(2, 1, 1, 1, '', '', '<p>Jika seorang guru akan mengajarkan hikayat kepada peserta didik kelas X, Semester 1 SMK, dengan bertitik tolak dari kompetensi dasar (KD), “Menceritakan kembali isi cerita rakyat (hikayat) yang didengar dan dibaca,” dan indikator pencapaian kompetensi (IPK) pembelajaran, “menentukan pokok-pokok isi cerita rakyat, menentukan alur peristiwa cerita rakyat, menyusun sinopsis cerita rakyat, dan menceritakan kembali isi cerita rakyat,” komponen materi pembelajaran yang  harus disiapkan oleh guru adalah ....</p>', '<p>teks hikayat , sejarah hikayat, jenis hikayat, komparasi hikayat dengan cerita pendek, apresiasi hikayat, dan kaitan hikayat dengan masyarakatnya; </p>', '<p>teks hikayat,  apresiasi hikayat, hikayat dan cerita pendek, perbandingan alur hikayat dan prosa, dan tema yang terdapat dalam hikayat;  </p>', '<p>teks hikayat, tema dan topik hikayat, pemeran dalam hikayat, alur progresif dan regresif, dan anonim terhadap hikayat-hikayat yang ada;  </p>', '<p>teks hikayat, perbandingan hikayat dengan karya   sastra prosa yang lain, alur yang sering terdapat dalam hikayat, dan tema dalam hikayat;</p>', '<p>teks hikayat,  pengertian hikayat, pokok-pokok isi hikayat, nilai-nilai dalam hikayat , dan kaitan  nilai-nilai hikayat dengan kehidupan sehari-hari.</p>', '', '', '', '', '', 'E', 1582139445, 1582139445),
(3, 1, 1, 1, '', '', '<p>Pembelajaran menulis esai dapat dilakukan dengan pendekatan proses. Beriku ini adalah aspek kegiatan pembelajaran  menulis berdasarkan pendekatan proses secara  acak, yakni   (1) menulis draf  secara kasar atas dasar ide-ide pemikiran tentatif; (2) melakukan penyuntingan terhadap aspek mekanik tulisan  agar lebih mudah dan dipahami pihaklain; (3) menggali dan menentukan ide dan arah tulisan, serta bahan dan  referensi yang diperlukan; (4) melakukan koresksi untuk menambah, mengurangi, menghilangkan, atau menata kembali isi tulisan sesuaidengan kebutuhan; dan   (5) mempublikasikan tulisan kepada pihak lain  melalui diskusi, jurnal, buletin, majalah, dll.  </p><p>Tahapan yang runtut dalam pembelajaran menulis dengan pendekatan  proses   adalah ....</p>', '<p>(3) (2) (4) (1) (5) </p>', '<p>(1) (3) (4) (2) (5)  </p>', '<p>(3) (1) (4) (2) (5) </p>', '<p>(1) (4) (2) (3) (5)</p>', '<p>(3) (4) (1) (2) (5) </p>', '', '', '', '', '', 'C', 1582139509, 1582139509),
(4, 1, 1, 1, '', '', '<p>Teknik  <em>ECOLA (Extending Concept  through Language Activities)</em> merupakan salah satu teknik membaca yang mengintegrasikannya dengan kegiatan menulis, berbicara, dan menyimak untuk memperoleh pemahaman bacaan secara kritis dan komprehensif. Berikut ini merupakan aspek kegiatan membaca dengan teknik  ICOLA secara acak, yakni  (1) membaca dalam hati untuk memahami bacaan sesuai dengan tujuan berdasarkan pengetahuan; (2) menulis dan membandingkan interpretasi antara individu atau kelompok;   (3) mewujudkan pemahaman melalui aktivitas menulis atas dasar pemahaman bagi setiap individu; (4) menentukan tujuan membaca sesuai dengan keperluan atau kebutuhan pembaca; dan (5) mendiskusikan hasil penafsiran, membandingkan tanggapan, dan merevisi simpulan masing-masing. </p><p>Tahapan yang runtut dalam pembelajaran membaca pemahaman secara kritis dan komprehensif dengan teknik  <em>ICOLA  </em>adalah .... </p>', '<p>(4) (2) (1) (3) (5) </p>', '<p>(1) (4) (3) (2) (5)</p>', '<p>(2) (1) (4) (5) (3)</p>', '<p>(4) (1) (3) (5) (2)</p>', '<p>(1) (5) (4) (3) (2)</p>', '', '', '', '', '', 'D', 1582139580, 1582139580),
(5, 1, 1, 1, '', '', '<p>Ketika seorang guru akan mengajarkan apresiasi sastra tentang cerita pendek kepada peserta didik Kelas VII, Semester 2, dengan indikator pencapaian kompetensi (IPK) pembelajaran   “mengidentifikasi  isi cerpen,  struktur cerpen, dan ciri bahasa cerpen,” media yang paling tepat untuk melaksanakan pembelajaran materi  tersebut   adalah  ....</p>', '<p>beberapa teks cerita pendek pemenang lomba;</p>', '<p>beberapa sinopsis cerpen pemenang lomba;</p>', '<p>teori tentang struktur cerita pendek;</p>', '<p>jenis gaya bahasa dalam fiksi;</p>', '<p>unsur pembangun cerpen.</p>', '', '', '', '', '', 'A', 1582139639, 1582155840),
(6, 1, 2, 1, '', '', '<p>Cermati kalimat-kalimat dalam wacana berikut!</p><p>(1) Manusia belum menemukan planet lain yang dapat menggantikan bumi. (2) Hingga kini hanya bumi yang bisa menjadi tempat tinggal manusia. (3) Jared Diamond dalam buku Collapse memberikan penjelasan kerusakan planit. (4) Salah satu penyebab utamanya ialah kerusakan lingkungan. (5) Ia mengemukakan contoh kerusakan peradaban di Pulau Paskah. (6) Kerusakan lingkungan mengakibatkan kehancuran pulau tersebut. (7) Pulau yang kini bagian dari Chile itu dulu hijau dan makmur. (8) Kondisinya berubah setelah pembangunan <em>moai</em> (patung batu bersosok manusia) dilakukan secara intensif. (9) Penduduk di pulau itu menebangi pohoh-pohon untuk membantu pengangkutan batu dari lokasi pembuatan ke tempat patung diletakkan. (10) Eksploitasi sumber daya alam terjadi besar-besaran. (11) Hal tersebut dilakukan demi ambisi persaingan antarkelompok masyarakat Pulau Paskah. (12) Saat pulau itu tak mampu lagi mendukung kehidupan, warga tidak bisa berpindah tempat ke pulau lain karena kayu-material utama perahu- sudah habis.</p><p>Dari dua belah kalimat dalam wacana tersebut yang mengandung struktur kalimat bertipe S-P-O adalah  ....</p>', '<p>(1)  (2)   (6)  (7)   (9)</p>', '<p>(2)  (5)   (9)  (11)  (12) </p>', '<p>(1)  (3)  (7)  (10)  (12)</p>', '<p>(2)  (4)   (6)  (9)  (11)  </p>', '<p>(1)  (3)  (5)  (6)  (9) </p>', '', '', '', '', '', 'E', 1582163827, 1582163827),
(7, 1, 2, 1, '', '', '<p>Perhatikan kalimat kompleks berikut!</p><p>“Untuk menjaga bumi agar tetap lestari, hal pertama yang perlu dilakukan oleh komunitas dunia ialah menciptakan pembangunan berkeadilan dan menghapus institusi yang tidak bertanggung jawab yang hanya bisa mengisap sumber daya sebesar-besarnya.”</p><p>Frekuensi jenis morfem bebas dan morfem terikat dalam kalimat tersebut adalah ....</p>', '<p>33  morfem bebas  dan  10  morfem terikat</p>', '<p>30  morfem bebas  dan  7  morfem terikat </p>', '<p>34  morfem bebas  dan  9  morfem terikat</p>', '<p>31  morfem bebas  dan  11 morfemterikat</p>', '<p>32 morfem bebas  dan 12 morfem terikat</p>', '', '', '', '', '', 'B', 1582164581, 1582164581),
(8, 1, 2, 1, '', '', '<p>Perhatikan penggunaan fonem vokal dan fonem konsonan dalam kalimat kompleks berikut!</p><p>“Terdapat beberapa hasil penelitian tentang perubahan mutu pada minyak goreng dan produk selama penyimpanan, antara lain penelitian yang menunjukkan lamanya pemanasan minyak akan mempercepat destruksi minyak akibatnya peroksida menjadi meningkat.”</p><p>Frekuensi jenis fonem konsonan yang digunakan dalam kalimat tersebut adalah  ....</p>', '<p>13   fonem  konsonan</p>', '<p>15   fonem  konsonan  </p>', '<p>17   fonem  konsonan</p>', '<p>19   fonem  konsonan</p>', '<p>21   fonem  konsonan </p>', '', '', '', '', '', 'D', 1582164875, 1582164875),
(9, 1, 2, 1, '', '', '<p>Perhatikan empat kalimat sederhana berikut!</p><p> (1) Ayah akan membeli komputer.</p><p> (2) Toni   akan  membeli  buku. </p><p> (3) * Meja akan membeli komputer.  </p><p> (4)  * Rumah akan membeli  buku. </p><p>Apabila keempat kalimat tersebut dianalisis berdasarkan teori tata bahasa Trasnsfrormasional,  simpulan yang dapat dinyatakan adalah  .;..</p>', '<p>Kata  <em>ayah</em>   dan <em>Toni</em> memiliki  ciri semantik   /+ makhluk/ sehingga kalimat (1) dan (2) berterima , sedangkan kata <em>meja</em> dan <em>rumah</em> memiliki  ciri   semantik  /- makhluk/ sehingga kalimat (3) dan (4) tidak berterima. </p>', '<p>Kata  <em>ayah</em> dan <em>Toni</em> merupakan  kata ganti orang  sehingga kalimat (1) dann (2) masuk akal, sedangkan  kata <em>meja</em> dan <em>rumah</em> bukan kata ganti sehingga kalimat (3) dan(4) tidak  logis.</p>', '<p>Kata <em>ayah</em> dan <em>Toni</em> berfungsi sebagai subjek kalimkat sehingga kalimat (1) dan (2) dapat dipahami, sedangkan kata <em>meja</em> dan <em>rumah</em> tidak dapat menjadi subjek kalimat sehingga  kalimat  (3) dan (4) tidak berterima.</p>', '<p>Kata <em>ayah</em> dan <em>Toni</em> berpotensi sebagai pelengkap pelaku pada kalimat pasif sehingga kalimat (1) dan (2) masuk  akal, sedangkan kata meja dan <em>rumah</em>  tidak berpotensi menjadi  pelengkap pelaku sehingga kalimat (3) dan(4) tidak logis.</p>', '<p>Kata <em>ayah</em> dan <em>Toni</em> berpotensi sebagai pelaku sehingga kalimat (1) dan (2) berterima,  sedangkan   kata <em>meja</em> dan <em>rumah</em> tidak berpotensi sebagai  subjek kalimat sehingga kalimat (3) dan (4) tidak berterima.</p>', '', '', '', '', '', 'A', 1582168135, 1582168135),
(10, 1, 2, 1, '', '', '<p>Perhatikan kalimat-kalimat dalam wacana  berikut! </p><p>“(1) Masalah  Toxsis sudah saya rasakan sejak awal. (2) Ada supervisor baru, perempuan muda cantik dan cerdas, cekatan dalam kerja. (3) Bisa Anda bayangkan bagaimana dalam waktu singkat Pak Manajer percaya penuh kepada supervisor baru tersebut. (4) Beberapa bulan lalu, suasana yang semula sejuk penuh keriangan, tersebarlah suasana penuh rumor. (5) Tak tahu dari mana awalnya, mulai muncul gosip tentang supervisor yang tidak baik, curang, jadi anak emas atasan, bahkan punya hubungan khusus dengan manajer. (6) Berita yang semakin santer tentang kisah asmara antara manajer dan supervisornya itu tercium istri manajer. (7) Pecah perang dalam keluarga tak terelakkan. (8) Masalah tersebut berakhir dengan dimutasikannya supervisor itu ke kantor pusat. (9) Meski begitu,  bau busuk pasti tak bisa dipertahankan dalam waktu lama.”</p><p>Kaimat-kalimat dalam wacana tersebut yang mengandung strutur pasif adalah ....</p>', '<p>(1)  (2)  (5)   (6)  (8)  (9)</p>', '<p>(2)   (4)  (5)  (6)   (7)  (8)</p>', '<p>(3)   (5)  (6)  (7)   (8)  (9)</p>', '<p>(2)   (4)  (5)  (6)   (7)  (9)   </p>', '<p>(1)  (3)  (4)   (6)  (7)  (9)</p>', '', '', '', '', '', 'E', 1582170395, 1582170395);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal_poli`
--

CREATE TABLE `tb_soal_poli` (
  `id_soal` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tipe_file` varchar(50) NOT NULL,
  `soal` longtext NOT NULL,
  `opsi_a` longtext NOT NULL,
  `opsi_b` longtext NOT NULL,
  `opsi_c` longtext NOT NULL,
  `opsi_d` longtext NOT NULL,
  `opsi_e` longtext NOT NULL,
  `bobot_a` int(11) NOT NULL,
  `bobot_b` int(11) NOT NULL,
  `bobot_c` int(11) NOT NULL,
  `bobot_d` int(11) NOT NULL,
  `bobot_e` int(11) NOT NULL,
  `file_a` varchar(255) NOT NULL,
  `file_b` varchar(255) NOT NULL,
  `file_c` varchar(255) NOT NULL,
  `file_d` varchar(255) NOT NULL,
  `file_e` varchar(255) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_soal_poli`
--

INSERT INTO `tb_soal_poli` (`id_soal`, `dosen_id`, `matkul_id`, `file`, `tipe_file`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `bobot_a`, `bobot_b`, `bobot_c`, `bobot_d`, `bobot_e`, `file_a`, `file_b`, `file_c`, `file_d`, `file_e`, `created_on`, `updated_on`) VALUES
(1, 1, 3, '', '', '<p>Sebagai seorang guru, Anda menginginkan siswa terbiasa bekerja dalam kelompok. Hari ini, tujuan pembelajaran yang ingin adalah setelah melakukan diskusi kelompok siswa dapat menemukan informasi tentang budaya Indonesia secara lengkap. Untuk membentuk kelompok, yang dilakukan guru adalah….</p>', '<p>Menawarkan kepada kelas untuk membentuk kelompok sendiri</p>', '<p>Membagi kelas berdasarkan undian </p>', '<p>Membagi kelas berdasarkan tempat duduk terdekat</p>', '<p>Membagi kelas berdasarkan nomer urut</p>', '<p>Menawarkan anggota kelompok yang sudah Anda susun sendiri</p>', 5, 4, 3, 2, 1, '', '', '', '', '', 1582196512, 1582196512),
(2, 1, 3, '', '', '<p>Seorang siswa mengeluh karena  salah satu anggota kelompok tidak mau mengerjakan tugas sesuai pembagian kerja yang sudah disepakati. Sebagai seorang guru, seharusnya yang Anda lakukan …..</p>', '<p>Memanggil semua anggota kelompok untuk menyelesaikan masalah mereka sendiri</p>', '<p>Memanggil anggota kelompok yang bermasalah untuk menyelesaikan masalah mereka sendiri</p>', '<p>Memanggil ketua kelompok dan siswa yang mengeluh</p>', '<p>Memanggil ketua kelompok untuk mendapatkan penjelasan</p>', '<p>Membiarkan kelompok untuk menyelesaikan masalah mereka sendiri</p>', 5, 4, 3, 2, 1, '', '', '', '', '', 1582196614, 1582196614),
(3, 1, 3, '', '', '<p>Salah satu siswa Anda meminta waktu untuk konsultasi. Pada saat yang bersamaan, Anda sudah berjanji untuk menemani rekan Anda menyelesaikan masalah pribadi. Maka Anda….</p>', '<p>Memberitahu rekan Anda, untuk membuat jadwal lain</p>', '<p>Memberitahu rekan Anda untuk menunggu, hingga kegiatan konsultasi selesai </p>', '<p>Meminta siswa tersebut untuk menunggu, sampai Anda pulang dengan rekan Anda</p>', '<p>Meminta siswa tersebut untuk membuat jadwal konsultasi pada hari lain</p>', '<p>Menyarankan kepada siswa tersebut untuk mencari guru yang lain</p>', 5, 4, 3, 2, 1, '', '', '', '', '', 1582196674, 1582196674),
(4, 1, 3, '', '', '<p>Kepala Sekolah membuat program kunjungan rumah, sebagai salah satu cara mengantisipasi permasalahan belajar pada siswa. Maka Anda…..</p>', '<p>Membuat jadwal kunjungan rumah untuk peserta didik, sesuai arahan Kepala Sekolah dan jumlah peserta didik yang harus saya kunjungi</p>', '<p>Membuat jadwal kunjungan rumah untuk beberapa peserta didik secara acak, tidak semua harus saya kunjungi </p>', '<p>Membuat jadwal kunjungan rumah untuk peserta didik yang rumahnya dapat saya jangkau</p>', '<p>Membuat jadwal kunjungan rumah untuk peserta didik yang rumahnya dekat dengan rumah saya</p>', '<p>Membuat jadwal kunjungan rumah untuk peserta didik, yang rumahnya dekat dengan rumah dan mudah dijangkau</p>', 5, 4, 3, 2, 1, '', '', '', '', '', 1582196745, 1582196745),
(5, 1, 3, '', '', '<p>Salah satu siswa Anda, yang sering membuat kegaduhan di kelas, mengalami kecelakaan. Berdasarkan informasi, siswa tersebut harus istirahat di rumah sakit selama satu bulan. Maka Anda …..</p>', '<p>Menerima informasi dan membiarkan situasi sedikit tenang, karena tidak ada yang membuat kegaduhan</p>', '<p>Menerima informasi dan menyarankan kepada siswa lain untuk menjenguknya </p>', '<p>Menerima informasi dan mengajak siswa-siswa lain untuk menjenguknya</p>', '<p>Menerima informasi dan mengajak siswa-siswa lain untuk membawakan catatan matapelajaran yang tertinggal</p>', '<p>Menerima informasi dan mengajak siswa-siswa lain untuk bergantian membantunya mengejar ketinggalan matapelajaran</p>', 1, 2, 3, 4, 5, '', '', '', '', '', 1582196804, 1582196804),
(6, 1, 4, '', '', '<p>Pada saat proses pembelajaran di sekolah sedang berlangsung, terdapat salah satu peserta didik yang memiliki latar belakang agama berbeda dengan Anda hendak meminta izin untuk menjalankan kegiatan ibadah. Sikap yang akan Anda lakukan…</p>', '<p>Tetap menyuruh peserta didik untuk di kelas terlebih dahulu sampai jam pelajaran berakhir </p>', '<p>Acuh dengan permintaan izin dari peserta didik </p>', '<p>Mengizinkan peserta didik untuk melaksanakan ibadahnya dan meminta segera kembali ke dalam kelas</p>', '<p>Memberitahu bahwa materi pelajaran saat ini penting untuk ujian</p>', '<p>Mempersilahkan peserta didik untuk melaksanakan ibadah</p>', 2, 1, 5, 3, 4, '', '', '', '', '', 1582196949, 1582196949),
(7, 1, 4, '', '', '<p>Jika suatu hari Anda di mutasi ke sekolah yang berada di daerah 3T dan kebetulan di kelas yang Anda ampu terdapat peserta didik yang berasal dari daerah asal Anda. Sikap yang akan Anda lakukan…</p>', '<p>Mengistimewakan peserta didik tersebut karena berasal dari daerah yang sama</p>', '<p>Memperlakukan semua peserta didik sama saat proses pembelajaran</p>', '<p>Bersikap biasa saja saat mengajar</p>', '<p>Melakukan proses belajar mengajar sesuai dengan aturan sekolah</p>', '<p>Berlaku sebisa dan semau saya saat pembelajaran</p>', 2, 5, 3, 4, 1, '', '', '', '', '', 1582197080, 1582197080),
(8, 1, 4, '', '', '<p>Pada saat upacara bendera hari Senin, ada beberapa peserta didik yang terlambat. Saat itu Anda ditugasi sebagai guru pengawas. Sikap yang akan Anda lakukan adalah….</p>', '<p>Memberikan izin kepada peserta didik perempuan untuk masuk barisan karena merasa kasihan</p>', '<p>Memisahkan barisan untuk peserta didik yang terlambat agar tidak mengganggu jalannya ketertiban upacara</p>', '<p>Langsung menghukum peserta didik saat berlangsungnya upacara</p>', '<p>Memisahkan barisan peserta didik yang terlambat dan memberikan hukuman yang setara setelah upacara selesai</p>', '<p>Mencatat nama peserta didik yang telat dan memberikan poin kesalahan</p>', 2, 4, 1, 5, 3, '', '', '', '', '', 1582197227, 1582197227),
(9, 1, 4, '', '', '<p>Setelah selesai mengajar di kelas, Anda kembali ke kantor untuk istirahat karena lelah. Seorang guru mendatangi Anda untuk bercerita mengenai permasalahan pribadi guru lain. Sikap yang Anda lakukan adalah…</p>', '<p>Menanggapi ceritanya agar dan ikut membesar-besarkan masalah</p>', '<p>Menanggapi ceritanya untuk menghibur diri</p>', '<p>Tidak mau ikut campur dalam permasalahan pribadi guru tersebut</p>', '<p>Menasehati teman saya agar tidak ikut campur dalam permasalahan tersebut</p>', '<p>Tidak menanggapi cerita yang disampaikan teman saya karena hal tersebut tidak baik</p>', 1, 2, 3, 5, 4, '', '', '', '', '', 1582197280, 1582197280),
(10, 1, 4, '', '', '<p>Pagi ini Anda sangat terburu-buru karena sedang mengejar waktu untuk berangkat ke sekolah agar tidak terlambat. Sedangkan kondisi di jalan sangat padat dan banyak yang menerobos lampu merah.  Hal yang akan Anda lakukan adalah…</p>', '<p>Saya ikut menerobos lampu merah agar tidak terlambat datang ke sekolah</p>', '<p>Saya tetap mentaati rambu lalu lintas dengan konsekuensi terlambat</p>', '<p>Saya akan lebih memacu kecepatan kendaraan yang saya pakai</p>', '<p>Saya menerobos rambu lalu lintas ketika tidak ada polisi </p>', '<p>Saya memilih untuk mencari jalan alternatif agar cepat sampai ke sekolah</p>', 1, 4, 3, 2, 5, '', '', '', '', '', 1582197340, 1582197340);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'Administrator', '$2y$12$tGY.AtcyXrh7WmccdbT1rOuKEcTsKH6sIUmDr0ore1yN4LnKTTtuu', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1582202758, 1, 'Administrator', 'Aplikasi', 'ADMIN', '0'),
(11, '::1', '11111111', '$2y$10$6KTwrhfjXbmOl66WPitkfOZ9TsQEkuDTSgnKIckFIvr0xHbJtMyJW', 'ina@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1582130786, 1582202855, 1, 'Ina', 'Ina', NULL, NULL),
(12, '::1', '22222222', '$2y$10$t1KkF9l4O4LusRx9tnUKru/LdToFZ9Bc.mtVuI/QtzRHwDRfrptTO', 'anu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1582130789, NULL, 1, 'Anu', 'Anu', NULL, NULL),
(13, '::1', '33333333', '$2y$10$TtOEktWjMxX1YYTvVPpwPOPQSxmNe.u9nDmdLGQ2vAmfNXBINWyE2', 'itu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1582130793, NULL, 1, 'Itu', 'Itu', NULL, NULL),
(14, '::1', '11223344', '$2y$10$8x9sP0ZEuEGoCWUYZaquIu2ijniB2XTZGpOrfr.jlWFU2iwygri7K', 'alex@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1582156063, 1582202830, 1, 'Alex', 'Alex', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, 1),
(13, 11, 2),
(14, 12, 2),
(15, 13, 2),
(16, 14, 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `matkul_id` (`matkul_id`) USING BTREE;

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ujian_id` (`ujian_id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurusan_id` (`jurusan_id`),
  ADD KEY `matkul_id` (`matkul_id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `jurusan_id` (`jurusan_id`);

--
-- Indeks untuk tabel `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`),
  ADD KEY `matkul_ibfk_1` (`jenis_nilai`);

--
-- Indeks untuk tabel `m_nilai`
--
ALTER TABLE `m_nilai`
  ADD PRIMARY KEY (`id_m`);

--
-- Indeks untuk tabel `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indeks untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indeks untuk tabel `tb_soal_poli`
--
ALTER TABLE `tb_soal_poli`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD UNIQUE KEY `uc_email` (`email`) USING BTREE;

--
-- Indeks untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `h_ujian`
--
ALTER TABLE `h_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `m_nilai`
--
ALTER TABLE `m_nilai`
  MODIFY `id_m` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `m_ujian`
--
ALTER TABLE `m_ujian`
  MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_soal_poli`
--
ALTER TABLE `tb_soal_poli`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD CONSTRAINT `h_ujian_ibfk_1` FOREIGN KEY (`ujian_id`) REFERENCES `m_ujian` (`id_ujian`),
  ADD CONSTRAINT `h_ujian_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Ketidakleluasaan untuk tabel `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD CONSTRAINT `jurusan_matkul_ibfk_1` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `jurusan_matkul_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Ketidakleluasaan untuk tabel `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD CONSTRAINT `kelas_dosen_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `kelas_dosen_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`jenis_nilai`) REFERENCES `m_nilai` (`id_m`);

--
-- Ketidakleluasaan untuk tabel `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD CONSTRAINT `m_ujian_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `m_ujian_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Ketidakleluasaan untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`),
  ADD CONSTRAINT `tb_soal_ibfk_2` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`);

--
-- Ketidakleluasaan untuk tabel `tb_soal_poli`
--
ALTER TABLE `tb_soal_poli`
  ADD CONSTRAINT `tb_soal_poli_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`),
  ADD CONSTRAINT `tb_soal_poli_ibfk_2` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`);

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
