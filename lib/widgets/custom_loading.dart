part of 'custom_widget_helper.dart';

Scaffold customLoading() {
  return const Scaffold(
    body: Center(
      child: CircularProgressIndicator(
        color: AppColor.appColorGreenBlue,
      ),
    ),
  );
}
