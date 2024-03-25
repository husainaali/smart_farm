part of 'custom_widget_helper.dart';

class Diamond extends StatelessWidget {
  final double size;
  final Color color;
  final VoidCallback onTap;

  Diamond({this.size = 100, this.color = Colors.blue, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        size: Size(size, size),
        painter: DiamondPainter(color),
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
  final Color color;

  DiamondPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;

    Path path = Path();
    path.moveTo(69.9264,0.499986);
    path.cubicTo(106.337,0.499986,135.853,34.9264,135.853,34.9264);
    path.cubicTo(135.853,34.9264,99,100.853,69.9264,100.853);
    path.cubicTo(40.8528,100.853,3.99997,34.9264,3.99997,34.9264);
    path.cubicTo(3.99997,34.9264,33.5162,0.499986,69.9264,0.499986);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(DiamondPainter oldDelegate) => color != oldDelegate.color;
}
