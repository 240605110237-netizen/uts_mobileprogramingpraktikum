import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> weeklyProgress = [
      {'day': 'Sen', 'done': true},
      {'day': 'Sel', 'done': true},
      {'day': 'Rab', 'done': false},
      {'day': 'Kam', 'done': true},
      {'day': 'Jum', 'done': false},
      {'day': 'Sab', 'done': true},
      {'day': 'Min', 'done': false},
    ];

    final List<Map<String, dynamic>> activities = [
      {
        'title': 'Full Body Reset',
        'date': 'Senin, 08.00',
        'duration': '35 menit',
        'icon': Icons.bolt_rounded,
      },
      {
        'title': 'Upper Body Focus',
        'date': 'Selasa, 16.30',
        'duration': '25 menit',
        'icon': Icons.fitness_center_rounded,
      },
      {
        'title': 'Leg Day Starter',
        'date': 'Kamis, 17.00',
        'duration': '30 menit',
        'icon': Icons.directions_run_rounded,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F2),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Judul halaman
            const Text(
              'Progress',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17231F),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Pantau perkembangan latihanmu.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF7D8981),
              ),
            ),

            const SizedBox(height: 24),

            // Kartu statistik
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    icon: Icons.fitness_center_rounded,
                    value: '12',
                    label: 'Total Workout',
                    tint: const Color(0xFFB9F36A),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: StatCard(
                    icon: Icons.local_fire_department_rounded,
                    value: '1.240',
                    label: 'Kalori (kkal)',
                    tint: const Color(0xFFFFD9A8),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: StatCard(
                    icon: Icons.schedule_rounded,
                    value: '8,5',
                    label: 'Jam Latihan',
                    tint: const Color(0xFFD9D0FF),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: StatCard(
                    icon: Icons.flag_rounded,
                    value: '3 hari',
                    label: 'Target Mingguan',
                    tint: const Color(0xFFAEE9E4),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Aktivitas mingguan
            const Text(
              'Aktivitas Mingguan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17231F),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Target latihan 3 kali seminggu',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF7D8981),
              ),
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),

              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: weeklyProgress.map((item) {
                  final bool done = item['done'] as bool;

                  return Column(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: done
                              ? const Color(0xFFB9F36A)
                              : const Color(0xFFF0F2ED),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          done
                              ? Icons.check_rounded
                              : Icons.circle_outlined,
                          size: 18,
                          color: const Color(0xFF17231F),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        item['day'] as String,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF7D8981),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 28),

            // Riwayat latihan
            const Text(
              'Riwayat Latihan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17231F),
              ),
            ),

            const SizedBox(height: 16),

            ...activities.map((activity) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F5E9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        activity['icon'] as IconData,
                        color: const Color(0xFF537D28),
                      ),
                    ),

                    const SizedBox(width: 13),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity['title'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                              color: Color(0xFF17231F),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            activity['date'] as String,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF7D8981),
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            activity['duration'] as String,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF537D28),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.check_circle_rounded,
                      color: Color(0xFF78A83C),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
