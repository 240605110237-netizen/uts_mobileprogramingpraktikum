import 'package:flutter/material.dart';

import '../data/dummy_workouts.dart';
import '../widgets/stat_card.dart';
import '../widgets/workout_tile.dart';
import 'workout_detail_page.dart';
import 'progress_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
      children: [
        // HEADER APLIKASI
        Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF17231F),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.bolt_rounded,
                color: Color(0xFFB9F36A),
                size: 28,
              ),
            ),

            const SizedBox(width: 10),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GymTrack',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF17231F),
                  ),
                ),
                Text(
                  'YOUR FITNESS COMPANION',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1.2,
                    color: Color(0xFF7D8981),
                  ),
                ),
              ],
            ),

            const Spacer(),

            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_outline_rounded,
                color: Color(0xFF17231F),
              ),
            ),
          ],
        ),

        const SizedBox(height: 28),

        // SAPAAN
        const Text(
          "LET'S GET MOVING",
          style: TextStyle(
            color: Color(0xFF7D8981),
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            fontSize: 11,
          ),
        ),

        const SizedBox(height: 7),

        const Text(
          'Small steps.',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Color(0xFF17231F),
            height: 1.05,
          ),
        ),

        const Text(
          'Strong results.',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Color(0xFF17231F),
            height: 1.05,
          ),
        ),

        const SizedBox(height: 20),

        // KARTU LATIHAN UTAMA
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF17231F),
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFB9F36A),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "TODAY'S PLAN",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF17231F),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Full Body Reset',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Latihan singkat untuk membangun kebiasaan.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 20),

              const Row(
                children: [
                  Icon(
                    Icons.schedule_rounded,
                    size: 16,
                    color: Color(0xFFB9F36A),
                  ),
                  SizedBox(width: 6),
                  Text(
                    '35 menit',
                    style: TextStyle(color: Colors.white),
                  ),

                  SizedBox(width: 18),

                  Icon(
                    Icons.local_fire_department_rounded,
                    size: 16,
                    color: Color(0xFFB9F36A),
                  ),
                  SizedBox(width: 6),
                  Text(
                    '210 kcal',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFB9F36A),
                    foregroundColor: const Color(0xFF17231F),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WorkoutDetailPage(
                              workout: workouts[0],
                            ),
                      ),
                    );
                  },
                  child: const Text(
                    'Mulai latihan  →',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 26),

        // JUDUL STATISTIK
        Row(
          children: [
            const Expanded(
              child: Text(
                'Ringkasan minggu ini',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF17231F),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const ProgressPage(),
                  ),
                );
              },
              child: const Text('Lihat semua'),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // KARTU STATISTIK
        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.check_circle_outline,
                value: '4',
                label: 'Sesi selesai',
                tint: const Color(0xFFE6F5D3),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: StatCard(
                icon: Icons.timer_outlined,
                value: '120',
                label: 'Menit aktif',
                tint: const Color(0xFFE4ECFF),
              ),
            ),
          ],
        ),

        const SizedBox(height: 25),

        // REKOMENDASI LATIHAN
        const Text(
          'Rekomendasi untukmu',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Color(0xFF17231F),
          ),
        ),

        const SizedBox(height: 12),

        ...workouts
            .take(2)
            .map((workout) => WorkoutTile(
          workout: workout,
        )),
      ],
    );
  }
}
