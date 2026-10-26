import 'package:flutter/material.dart';
import '../data/dummy_workouts.dart';
import '../widgets/workout_tile.dart';
import '../models/workout.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  String searchText = '';
  String selectedCategory = 'Semua';

  final List<String> categories = [
    'Semua',
    'Pemula',
    'Menengah',
  ];

  @override
  Widget build(BuildContext context) {
    // Filter data berdasarkan pencarian dan kategori.
    final List<Workout> filteredWorkouts =
    workouts.where((workout) {
      final matchesSearch = workout.title
          .toLowerCase()
          .contains(searchText.toLowerCase()) ||
          workout.subtitle
              .toLowerCase()
              .contains(searchText.toLowerCase());

      final matchesCategory =
          selectedCategory == 'Semua' ||
              workout.level == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
      children: [
        // JUDUL HALAMAN
        const Text(
          'Workout library',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w900,
            color: Color(0xFF17231F),
          ),
        ),

        const SizedBox(height: 7),

        const Text(
          'Pilih latihan yang cocok dengan energimu hari ini.',
          style: TextStyle(
            color: Color(0xFF7D8981),
          ),
        ),

        const SizedBox(height: 22),

        // KOLOM PENCARIAN
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.search_rounded),
              hintText: 'Cari latihan...',
              border: InputBorder.none,
            ),
          ),
        ),

        const SizedBox(height: 18),

        // FILTER KATEGORI
        Wrap(
          spacing: 8,
          children: categories.map((category) {
            final isSelected =
                selectedCategory == category;

            return ChoiceChip(
              label: Text(category),
              selected: isSelected,
              selectedColor: const Color(0xFFB9F36A),
              backgroundColor: Colors.white,
              side: BorderSide.none,
              labelStyle: TextStyle(
                color: const Color(0xFF17231F),
                fontWeight: isSelected
                    ? FontWeight.w900
                    : FontWeight.w500,
              ),
              onSelected: (selected) {
                setState(() {
                  selectedCategory = category;
                });
              },
            );
          }).toList(),
        ),

        const SizedBox(height: 22),

        // JUMLAH HASIL
        Text(
          '${filteredWorkouts.length} latihan tersedia',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Color(0xFF7D8981),
          ),
        ),

        const SizedBox(height: 12),

        // DAFTAR LATIHAN
        if (filteredWorkouts.isEmpty)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Icon(
                  Icons.search_off_rounded,
                  size: 42,
                  color: Color(0xFF7D8981),
                ),
                SizedBox(height: 10),
                Text(
                  'Latihan tidak ditemukan.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7D8981),
                  ),
                ),
              ],
            ),
          )
        else
          ...filteredWorkouts.map(
                (workout) => WorkoutTile(
              workout: workout,
            ),
          ),
      ],
    );
  }
}
