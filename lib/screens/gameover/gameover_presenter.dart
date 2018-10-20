// Copyright (C) 2018 Alberto Varela Sánchez <alberto@berriart.com>
// Use of this source code is governed by the version 3 of the
// GNU General Public License that can be found in the LICENSE file.

import '../../domain/index.dart';

abstract class GameoverScreenViewContract implements NavigatorContract {}

class GameoverScreenPresenter {
  GameoverScreenPresenter(this._view);

  final GameoverScreenViewContract _view;

  void onTryAgainButtonPressed() {
    _view.redirectTo(Routes.countdown);
  }

  void onBackButtonPressed() {
    _view.navigateBack();
  }
}
