import 'package:flutter/cupertino.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/pages/splash/splash_page.dart';

import './splash_view.dart';

abstract class SplashViewImpl extends State<SplashPage>
    with Loader<SplashPage>
    implements SplashView {
  @override
  void initState() {
    widget.presenter.view =
        this; // * Linkando o splash view com splash presenter
    super.initState();
  }

  @override
  void logged(bool isLogged) {
    hideLoader(); // fecha o loader
    if (isLogged) {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/auth/login', (route) => false);
    }
  }
}
