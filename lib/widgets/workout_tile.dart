import 'package:flutter/material.dart';

import '../models/workout.dart';
import '../screens/workout_detail_page.dart';

class WorkoutTile extends StatelessWidget {
  final Workout workout;

  const WorkoutTile({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),


          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    WorkoutDetailPage(workout: workout),
              ),
            );
          },

          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Kotak ikon latihan.
                Container(
                  width: 58,
                  height: 58,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F5E9),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Text(
                    workout.icon,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),

                const SizedBox(width: 13),

                // Informasi latihan.
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF17231F),
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        workout.subtitle,
                        style: const TextStyle(
                          color: Color(0xFF7D8981),
                          fontSize: 11,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: 13,
                            color: Color(0xFF7D8981),
                          ),
                          const SizedBox(width: 4),

                          Text(
                            workout.duration,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF7D8981),
                            ),
                          ),

                          const SizedBox(width: 10),

                          const Icon(
                            Icons.fitness_center,
                            size: 13,
                            color: Color(0xFF7D8981),
                          ),
                          const SizedBox(width: 4),

                          Text(
                            '${workout.exercises} gerakan',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF7D8981),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF7D8981),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
