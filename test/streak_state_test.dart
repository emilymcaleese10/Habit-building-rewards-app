import 'package:flutter_test/flutter_test.dart';
import 'package:habitus/providers/streak_state.dart';

void main() {
  group('StreakNotifier', () {
    test('should increment streak if difference is exactly one day', () {
      final streakNotifier = StreakNotifier(lastScan: DateTime(2025, 1, 1));
      // Simulate a scan on a day
      streakNotifier.updateStreak(currentDateTime: DateTime(2025, 1, 1));
      expect(streakNotifier.streak, 1);

      // Fast forward time by 1 day
      streakNotifier.updateStreak(currentDateTime: DateTime(2025, 1, 2));

      // Expect the streak to increment
      expect(streakNotifier.streak, 2);
    });

    test('should reset streak if difference is more than one day', () {
      final streakNotifier = StreakNotifier(lastScan: DateTime(2025, 1, 1));

      // Simulate a scan today
      streakNotifier.updateStreak(currentDateTime: DateTime(2025, 1, 1));
      expect(streakNotifier.streak, 1);

      // Fast forward time by 2 days
      streakNotifier.updateStreak(currentDateTime: DateTime(2025, 1, 3)); 

      // Expect the streak to reset but still increment
      expect(streakNotifier.streak, 1);
    });
  });
}
