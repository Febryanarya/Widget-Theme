import 'package:flutter/material.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data profil
  String name = 'Tekno';
  String title = 'Scrolling Engineer';
  String description = 'Scroll Fesnuk, Yapping Everyday';
  String email = 'tekno@test.com';
  String phone = '+62 812 3456 7890';

  // Controller untuk form
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Mode tampilan (lihat atau edit)
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
  }

  // Simpan perubahan data profil
  void saveChanges() {
    setState(() {
      name = nameController.text;
      email = emailController.text;
      phone = phoneController.text;
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Card(
          elevation: 4,
          color: theme.colorScheme.surface,
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: isEditing ? _buildEditForm(context) : _buildProfileView(context),
          ),
        ),
      ),
    );
  }

  // 🔹 Mode Tampilan Profil
  Widget _buildProfileView(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.asset(
            'assets/images/profil.png',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        const Divider(height: 30),
        Text('📧 $email', style: theme.textTheme.bodyMedium),
        Text('📞 $phone', style: theme.textTheme.bodyMedium),
        const SizedBox(height: 20),

        ElevatedButton.icon(
          onPressed: () => setState(() => isEditing = true),
          icon: const Icon(Icons.edit),
          label: const Text('Edit Profil'),
        ),
        const SizedBox(height: 8),

        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPage()),
            );
          },
          icon: const Icon(Icons.info_outline),
          label: const Text('Tentang Aplikasi'),
        ),
      ],
    );
  }

  // 🔹 Mode Edit Profil
  Widget _buildEditForm(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Edit Profil',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Nama',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(
            labelText: 'Telepon',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: saveChanges,
              icon: const Icon(Icons.save),
              label: const Text('Simpan'),
            ),
            OutlinedButton.icon(
              onPressed: () => setState(() => isEditing = false),
              icon: const Icon(Icons.close),
              label: const Text('Batal'),
            ),
          ],
        ),
      ],
    );
  }
}
