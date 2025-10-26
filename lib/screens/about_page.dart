import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.person_pin,
                    size: 90,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Profile Card App',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Versi 1.0.0',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Tentang Aplikasi
            const Text(
              '📖 Tentang Aplikasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Aplikasi ini merupakan mini proyek Flutter yang dibuat '
              'untuk menampilkan kartu profil sederhana. Kamu dapat mengubah data seperti '
              'nama, email, dan telepon langsung di dalam aplikasi menggunakan form interaktif. '
              'Selain itu, aplikasi ini mendukung mode tema otomatis (terang/gelap) '
              'dan memiliki tampilan responsif di berbagai perangkat.',
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 24),

            // Fitur
            const Text(
              '✨ Fitur:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('• Melihat dan mengedit data profil'),
            const Text('• Navigasi ke halaman Tentang'),
            const Text('• Mode tema otomatis (Light / Dark / System)'),
            const Text('• Tampilan modern dan responsif'),
            const Text('• Data disimpan sementara di state aplikasi'),

            const SizedBox(height: 32),

            // Tombol Kembali
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  'Kembali ke Profil',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white, // 🔹 teks tombol selalu putih
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
