part of 'custom_widget_helper.dart';

customRequestButton(BuildContext context, title, VoidCallback request) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(customHeight(context, percentage: 0.2)),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(AppColor.appColorGreenBlue),
      ),
      onPressed: () {
        request();
      },
      child: AutoSizeText(
        title,
        style: TextStyle(
            fontSize: customHeight(context, percentage: 0.02),
            fontWeight: FontWeight.w300,
            color: AppColor.appColorWhite),
        maxLines: 1,
      ),
    ),
  );
}
