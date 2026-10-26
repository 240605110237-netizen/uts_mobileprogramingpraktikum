import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutDetailPage extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailPage({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> exercises = [
      'Pemanasan',
      'Gerakan utama 1',
      'Gerakan utama 2',
      'Gerakan utama 3',
      'Gerakan utama 4',
      'Pendinginan',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F2),
      appBar: AppBar(
        title: const Text(
          'Detail Workout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF5F7F2),
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Kartu utama workout
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF17231F),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 75,
                  height: 75,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB9F36A),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text(
                    workout.icon,
                    style: const TextStyle(fontSize: 38),
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  workout.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  workout.subtitle,
                  style: const TextStyle(
                    color: Color(0xFFD0D8D1),
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Color(0xFFB9F36A),
                      size: 20,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      workout.duration,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 20),

                    const Icon(
                      Icons.local_fire_department,
                      color: Color(0xFFB9F36A),
                      size: 20,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      '${workout.calories} kkal',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          const Text(
            'Rangkaian Latihan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFF17231F),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            '${workout.exercises} gerakan • Level ${workout.level}',
            style: const TextStyle(
              color: Color(0xFF7D8981),
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 16),

          // Daftar gerakan latihan
          ...List.generate(
            workout.exercises,
                (index) {
              String exerciseName;

              if (index < exercises.length) {
                exerciseName = exercises[index];
              } else {
                exerciseName = 'Gerakan tambahan ${index + 1}';
              }

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F5E9),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF537D28),
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Text(
                        exerciseName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF17231F),
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFF78A83C),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          // Tombol mulai latihan
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      title: const Text('Workout Siap!'),
                      content: Text(
                        'Kamu siap memulai ${workout.title}? '
                            'Pastikan melakukan pemanasan terlebih dahulu.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(dialogContext);
                          },
                          child: const Text('Kembali'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(dialogContext);

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Sesi latihan dimulai!',
                                ),
                              ),
                            );
                          },
                          child: const Text('Mulai'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Mulai Sesi Latihan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB9F36A),
                foregroundColor: const Color(0xFF17231F),
                padding: const EdgeInsets.symmetric(
                  vertical: 17,
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
