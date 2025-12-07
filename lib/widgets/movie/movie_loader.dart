import 'package:flutter/material.dart';

class MovieLoader extends StatelessWidget {
  const MovieLoader({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = theme.colorScheme.surfaceContainerHighest;
    final fg = theme.colorScheme.onSurface.withValues(alpha: 0.08);

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, _) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                _shimmerBox(bg, fg, width: 92, height: 138, borderRadius: 8),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 138,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _shimmerBox(
                          bg,
                          fg,
                          width: double.infinity,
                          height: 20,
                          borderRadius: 6,
                        ),
                        const SizedBox(height: 8),
                        _shimmerBox(
                          bg,
                          fg,
                          width: 120,
                          height: 14,
                          borderRadius: 6,
                        ),
                        const SizedBox(height: 12),
                        _shimmerBox(
                          bg,
                          fg,
                          width: double.infinity,
                          height: 12,
                          borderRadius: 6,
                        ),
                        const SizedBox(height: 6),
                        _shimmerBox(
                          bg,
                          fg,
                          width: double.infinity,
                          height: 12,
                          borderRadius: 6,
                        ),
                        const SizedBox(height: 6),
                        _shimmerBox(
                          bg,
                          fg,
                          width: 180,
                          height: 12,
                          borderRadius: 6,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _shimmerBox(
    Color bg,
    Color fg, {
    required double width,
    required double height,
    double borderRadius = 8,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: fg,
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
