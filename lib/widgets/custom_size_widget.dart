part of 'custom_widget_helper.dart';

double customHeight(context,{double percentage =1.0})=> MediaQuery.of(context).size.height * percentage;
double customWidth(context,{double percentage =1.0})=> MediaQuery.of(context).size.width * percentage;