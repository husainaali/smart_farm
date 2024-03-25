part of 'custom_widget_helper.dart';

customHorizontalListItem(context, backgroundColor, text, model, index,requestName) {
  return SizedBox(
    width: customWidth(context, percentage: 0.32),
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: backgroundColor)),
        backgroundColor: MaterialStateProperty.all(AppColor.appColorWhite),
      ),
      onPressed: () {
        if(requestName =='selectMethod'){
        model.shipmentInformation(index, 'selectedMethodId');
        model.shippingMethodSelectedIndex = index;
        model.notifyListeners();
        print(index);}
      },
      child: LimitedBox(
        maxWidth: customWidth(context, percentage: 0.32),
        child: AutoSizeText(
          text,
          textAlign: TextAlign.center,
          maxFontSize: 15,
          minFontSize: 8,
          style: TextStyle(fontWeight: FontWeight.w400, color: backgroundColor),
          maxLines: 2,
        ),
      ),
    ),
  );
}
