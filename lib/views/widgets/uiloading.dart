part of 'widgets.dart';

/*
** Ui Loading Widget
*/

class UiLoading {
  static Container loading() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black54,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Colors.blue,
      ),
    );
  }

  static Container loadingSmallCircle() {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      color: Colors.transparent,
      child: const SpinKitFadingCircle(
        size: 30,
        color: Colors.blue,
      ),
    );
  }
}
