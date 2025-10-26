import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String? photoPath;
  final ValueChanged<Map<String, dynamic>> onSave;

  const EditProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.onSave,
    this.photoPath,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _phoneController = TextEditingController(text: widget.phone);
    if (widget.photoPath != null && widget.photoPath!.isNotEmpty) {
      _imageFile = File(widget.photoPath!);
    }
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : (widget.photoPath != null && widget.photoPath!.isNotEmpty
                              ? FileImage(File(widget.photoPath!))
                              : const AssetImage('assets/images/profile.png')
                                  as ImageProvider),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Telepon'),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Simpan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {
                      widget.onSave({
                        'name': _nameController.text,
                        'email': _emailController.text,
                        'phone': _phoneController.text,
                        'photo': _imageFile?.path ?? widget.photoPath,
                      });
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.cancel),
                    label: const Text('Batal'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
