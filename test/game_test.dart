import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_kurma_tahtasi/oyun_kelime_kurma_tahtasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeTahtasiConfig.title.length, 33);
    expect(kelimeTahtasiConfig.tagline.length, 33);
    for (final s in kelimeTahtasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeTahtasiConfig.gameId, kelimeTahtasiId);
    expect(kelimeTahtasiRules.gameId, kelimeTahtasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeTahtasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeTahtasiId, optionalMechanics: kelimeTahtasiRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kelimeTahtasiRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kelimeTahtasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
