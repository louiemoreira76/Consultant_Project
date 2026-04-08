import 'package:flutter/material.dart';

enum Trend { up, down, neutral }

class KPICard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Trend? trend;
  final String? trendValue;
  final bool showChart;
  final List<ChartDataPoint> chartData;
  final bool alert;

  const KPICard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.trend,
    this.trendValue,
    this.showChart = false,
    this.chartData = const [],
    this.alert = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = alert ? Colors.red.shade600 : const Color(0xFF0A2540);
    final Color iconBgColor = alert ? Colors.red.shade50 : const Color(0xFFF0F4F8);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: title/value and icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                    if (trendValue != null) ...[
                      const SizedBox(height: 8),
                      _buildTrendIndicator(),
                    ],
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          // Chart (if enabled)
          if (showChart && chartData.isNotEmpty) ...[
            const SizedBox(height: 16),
            SizedBox(
              height: 48,
              child: _MiniLineChart(data: chartData, lineColor: primaryColor),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTrendIndicator() {
    String arrowSymbol;
    Color color;

    switch (trend) {
      case Trend.up:
        arrowSymbol = '↑';
        color = Colors.green.shade600;
        break;
      case Trend.down:
        arrowSymbol = '↓';
        color = Colors.red.shade600;
        break;
      default:
        arrowSymbol = '→';
        color = Colors.grey.shade600;
    }

    return Row(
      children: [
        Text(
          '$arrowSymbol $trendValue',
          style: TextStyle(
            fontSize: 14,
            color: color,
          ),
        ),
      ],
    );
  }
}

// Data point for the chart
class ChartDataPoint {
  final double value;
  const ChartDataPoint({required this.value});
}

// Simple mini line chart using CustomPaint
class _MiniLineChart extends StatelessWidget {
  final List<ChartDataPoint> data;
  final Color lineColor;

  const _MiniLineChart({required this.data, required this.lineColor});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LineChartPainter(data: data, lineColor: lineColor),
      size: const Size(double.infinity, 48),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  final List<ChartDataPoint> data;
  final Color lineColor;

  _LineChartPainter({required this.data, required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final values = data.map((d) => d.value).toList();
    final maxValue = values.reduce((a, b) => a > b ? a : b);
    final minValue = values.reduce((a, b) => a < b ? a : b);
    final range = maxValue - minValue;

    final double stepX = size.width / (values.length - 1);

    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    for (int i = 0; i < values.length; i++) {
      final x = i * stepX;
      // Map value to Y coordinate (inverted because canvas y=0 is top)
      final normalizedY = range == 0 ? 0.5 : (values[i] - minValue) / range;
      final y = size.height - (normalizedY * (size.height - 4) + 2);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}