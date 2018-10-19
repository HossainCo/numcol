// Copyright (C) 2018 Alberto Varela Sánchez <alberto@berriart.com>
// Use of this source code is governed by the version 3 of the
// GNU General Public License that can be found in the LICENSE file.

abstract class SettingsScreenViewContract {
  void navigateBack();
}

class SettingsScreenPresenter {
  SettingsScreenPresenter(this._view);

  final SettingsScreenViewContract _view;

  void onBackButtonPressed() {
    _view.navigateBack();
  }
}
