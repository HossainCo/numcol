// Copyright (C) 2018 Alberto Varela Sánchez <alberto@berriart.com>
// Use of this source code is governed by the version 3 of the
// GNU General Public License that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../../../lib/routes.dart';
import '../../../lib/screens/countdown/countdown_presenter.dart';
import '../../../lib/view/index.dart';

class MockCountdownScreenView extends Mock implements CountdownScreenViewContract {}
class MockAnimator extends Mock implements Animator {}

void main() {
  MockCountdownScreenView _mockCountdownScreenView;
  MockAnimator _mockAnimator;
  CountdownScreenPresenter _countdownScreenPresenter;

  setUp(() async {
    _mockCountdownScreenView = MockCountdownScreenView();
    _mockAnimator = MockAnimator();
    _countdownScreenPresenter = CountdownScreenPresenter(_mockCountdownScreenView, _mockAnimator);
  });

  group('Countdown Screen:', () {
    group('On load', () {
      test('it starts the countdown animation', () {
        _countdownScreenPresenter.onLoad();

        verify(_mockAnimator.forward());
      });
    });
    group('On animation completed', () {
      test('it redirects to the game screen', () {
        _countdownScreenPresenter.onAnimationCompleted();

        verify(_mockCountdownScreenView.redirectTo(Routes.game));
      });
    });

    group('On game end', () {
      test('Destroys the countdown timer', () {
        _countdownScreenPresenter.dispose();

        verify(_mockAnimator.dispose());
      });
    });
  });
}
