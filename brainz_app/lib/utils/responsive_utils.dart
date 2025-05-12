import 'package:flutter/material.dart';

/// A utility class that provides responsive sizing and device detection
class ResponsiveUtils {
  // Device type detection
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  // Get screen dimensions
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Check device orientation
  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  /// Get a responsive value based on screen size
  ///
  /// Example:
  /// ```
  /// fontSize: ResponsiveUtils.responsiveValue(
  ///   context: context,
  ///   mobile: 16.0,
  ///   tablet: 18.0,
  ///   desktop: 20.0,
  /// ),
  /// ```
  static T responsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }

  /// Get responsive padding
  static EdgeInsets responsivePadding(BuildContext context) {
    return EdgeInsets.all(
      responsiveValue(
        context: context,
        mobile: 16.0,
        tablet: 24.0,
        desktop: 32.0,
      ),
    );
  }

  /// Get responsive horizontal spacing
  static Widget horizontalSpace(BuildContext context,
      {double multiplier = 1.0}) {
    final baseSpace = responsiveValue(
      context: context,
      mobile: 8.0,
      tablet: 12.0,
      desktop: 16.0,
    );

    return SizedBox(width: baseSpace * multiplier);
  }

  /// Get responsive vertical spacing
  static Widget verticalSpace(BuildContext context, {double multiplier = 1.0}) {
    final baseSpace = responsiveValue(
      context: context,
      mobile: 8.0,
      tablet: 12.0,
      desktop: 16.0,
    );

    return SizedBox(height: baseSpace * multiplier);
  }

  /// Responsive text style
  static TextStyle responsiveTextStyle(
    BuildContext context, {
    required double mobileFontSize,
    double? tabletFontSize,
    double? desktopFontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: responsiveValue(
        context: context,
        mobile: mobileFontSize,
        tablet: tabletFontSize,
        desktop: desktopFontSize,
      ),
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Create a responsive layout with different widgets for different screen sizes
  static Widget responsiveLayout({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }

  /// Create a responsive grid layout
  static Widget responsiveGridView({
    required BuildContext context,
    required List<Widget> children,
    double? spacing,
    EdgeInsets? padding,
  }) {
    final crossAxisCount = responsiveValue(
      context: context,
      mobile: 2,
      tablet: 3,
      desktop: 4,
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.0,
        crossAxisSpacing: spacing ?? 10,
        mainAxisSpacing: spacing ?? 10,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

/// ResponsiveBuilder widget to build responsive layouts
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints)
      builder;

  // ignore: use_super_parameters
  const ResponsiveBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return builder(context, constraints);
          },
        );
      },
    );
  }
}

/// Widget wrapper that makes a child widget responsive
class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final double? minWidth;

  // ignore: use_super_parameters
  const ResponsiveWrapper({
    Key? key,
    required this.child,
    this.maxWidth = 1200,
    this.minWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          minWidth: minWidth ?? 0,
        ),
        child: child,
      ),
    );
  }
}
