import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightModeColors {
  static const lightPrimary = Color(0xFFD4AF37); // Gold accent
  static const lightOnPrimary = Color(0xFFFFFFFF);
  static const lightPrimaryContainer = Color(0xFFFFF6D6); // Soft gold tint
  static const lightOnPrimaryContainer = Color(0xFF1F1F1F);
  static const lightSecondary =
      Color(0xFF8C6A1E); // Deep gold/brown for accents
  static const lightOnSecondary = Color(0xFFFFFFFF);
  static const lightTertiary = Color(0xFFB58E2A);
  static const lightOnTertiary = Color(0xFFFFFFFF);
  static const lightError = Color(0xFFB3261E);
  static const lightOnError = Color(0xFFFFFFFF);
  static const lightErrorContainer = Color(0xFFF9DEDC);
  static const lightOnErrorContainer = Color(0xFF410E0B);
  static const lightInversePrimary = Color(0xFF3B2E09);
  static const lightShadow = Color(0xFF000000);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightOnSurface = Color(0xFF1A1A1A);
  static const lightAppBarBackground = Color(0xFFFFFFFF);
}

class DarkModeColors {
  static const darkPrimary = Color(0xFFD4AF37); // Gold stays primary
  static const darkOnPrimary = Color(0xFF1B1B1B);
  static const darkPrimaryContainer = Color(0xFF3A300C); // Deep gold container
  static const darkOnPrimaryContainer = Color(0xFFFFF1C8);
  static const darkSecondary = Color(0xFFE0C164);
  static const darkOnSecondary = Color(0xFF1A1A1A);
  static const darkTertiary = Color(0xFFB58E2A);
  static const darkOnTertiary = Color(0xFF111111);
  static const darkError = Color(0xFFFFB4AB);
  static const darkOnError = Color(0xFF690005);
  static const darkErrorContainer = Color(0xFF93000A);
  static const darkOnErrorContainer = Color(0xFFFFDAD6);
  static const darkInversePrimary = Color(0xFFFFD67A);
  static const darkShadow = Color(0xFF000000);
  static const darkSurface = Color(0xFF0E0E0E);
  static const darkOnSurface = Color(0xFFEAEAEA);
  static const darkAppBarBackground = Color(0xFF0E0E0E);
}

class AppTokens {
// Spacing
  static const double s2 = 2;
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s40 = 40;

// Radii
  static const double r8 = 8;
  static const double r12 = 12;
  static const double r16 = 16;
  static const double r24 = 24;
}

class FontSizes {
  static const double displayLarge = 57.0;
  static const double displayMedium = 45.0;
  static const double displaySmall = 36.0;
  static const double headlineLarge = 32.0;
  static const double headlineMedium = 24.0;
  static const double headlineSmall = 22.0;
  static const double titleLarge = 22.0;
  static const double titleMedium = 18.0;
  static const double titleSmall = 16.0;
  static const double labelLarge = 16.0;
  static const double labelMedium = 14.0;
  static const double labelSmall = 12.0;
  static const double bodyLarge = 16.0;
  static const double bodyMedium = 14.0;
  static const double bodySmall = 12.0;
}

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: LightModeColors.lightPrimary,
        onPrimary: LightModeColors.lightOnPrimary,
        primaryContainer: LightModeColors.lightPrimaryContainer,
        onPrimaryContainer: LightModeColors.lightOnPrimaryContainer,
        secondary: LightModeColors.lightSecondary,
        onSecondary: LightModeColors.lightOnSecondary,
        tertiary: LightModeColors.lightTertiary,
        onTertiary: LightModeColors.lightOnTertiary,
        error: LightModeColors.lightError,
        onError: LightModeColors.lightOnError,
        errorContainer: LightModeColors.lightErrorContainer,
        onErrorContainer: LightModeColors.lightOnErrorContainer,
        inversePrimary: LightModeColors.lightInversePrimary,
        shadow: LightModeColors.lightShadow,
        surface: LightModeColors.lightSurface,
        onSurface: LightModeColors.lightOnSurface,
      ),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: LightModeColors.lightAppBarBackground,
        foregroundColor: LightModeColors.lightOnPrimaryContainer,
        elevation: 0,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.displayLarge,
            fontWeight: FontWeight.w600,
            height: 1.1),
        displayMedium: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.displayMedium,
            fontWeight: FontWeight.w600,
            height: 1.1),
        displaySmall: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.displaySmall,
            fontWeight: FontWeight.w600,
            height: 1.1),
        headlineLarge: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.headlineLarge,
            fontWeight: FontWeight.w600,
            height: 1.2),
        headlineMedium: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.headlineMedium,
            fontWeight: FontWeight.w600,
            height: 1.2),
        headlineSmall: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.headlineSmall,
            fontWeight: FontWeight.w600,
            height: 1.2),
        titleLarge: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.titleLarge,
            fontWeight: FontWeight.w600,
            height: 1.2),
        titleMedium: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.titleMedium,
            fontWeight: FontWeight.w600,
            height: 1.2),
        titleSmall: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.titleSmall,
            fontWeight: FontWeight.w600,
            height: 1.2),
        labelLarge: GoogleFonts.inter(
            fontSize: FontSizes.labelLarge,
            fontWeight: FontWeight.w600,
            height: 1.2),
        labelMedium: GoogleFonts.inter(
            fontSize: FontSizes.labelMedium,
            fontWeight: FontWeight.w600,
            height: 1.2),
        labelSmall: GoogleFonts.inter(
            fontSize: FontSizes.labelSmall,
            fontWeight: FontWeight.w600,
            height: 1.2),
        bodyLarge: GoogleFonts.inter(
            fontSize: FontSizes.bodyLarge,
            fontWeight: FontWeight.w400,
            height: 1.5),
        bodyMedium: GoogleFonts.inter(
            fontSize: FontSizes.bodyMedium,
            fontWeight: FontWeight.w400,
            height: 1.5),
        bodySmall: GoogleFonts.inter(
            fontSize: FontSizes.bodySmall,
            fontWeight: FontWeight.w400,
            height: 1.5),
      ),
      scaffoldBackgroundColor: LightModeColors.lightSurface,
      cardTheme: CardThemeData(
        color: LightModeColors.lightSurface,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 0.06),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTokens.r16)),
        margin: const EdgeInsets.all(0),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: LightModeColors.lightSurface,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.12),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTokens.r16)),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: LightModeColors.lightOnSurface,
        unselectedLabelColor: Colors.grey,
        indicatorColor: LightModeColors.lightPrimary,
        dividerColor: Colors.black.withValues(alpha: 0.06),
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(LightModeColors.lightPrimary),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTokens.r12))),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: DarkModeColors.darkPrimary,
        onPrimary: DarkModeColors.darkOnPrimary,
        primaryContainer: DarkModeColors.darkPrimaryContainer,
        onPrimaryContainer: DarkModeColors.darkOnPrimaryContainer,
        secondary: DarkModeColors.darkSecondary,
        onSecondary: DarkModeColors.darkOnSecondary,
        tertiary: DarkModeColors.darkTertiary,
        onTertiary: DarkModeColors.darkOnTertiary,
        error: DarkModeColors.darkError,
        onError: DarkModeColors.darkOnError,
        errorContainer: DarkModeColors.darkErrorContainer,
        onErrorContainer: DarkModeColors.darkOnErrorContainer,
        inversePrimary: DarkModeColors.darkInversePrimary,
        shadow: DarkModeColors.darkShadow,
        surface: DarkModeColors.darkSurface,
        onSurface: DarkModeColors.darkOnSurface,
      ),
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: DarkModeColors.darkAppBarBackground,
        foregroundColor: DarkModeColors.darkOnPrimaryContainer,
        elevation: 0,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.displayLarge,
            fontWeight: FontWeight.w600,
            height: 1.1),
        displayMedium: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.displayMedium,
            fontWeight: FontWeight.w600,
            height: 1.1),
        displaySmall: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.displaySmall,
            fontWeight: FontWeight.w600,
            height: 1.1),
        headlineLarge: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.headlineLarge,
            fontWeight: FontWeight.w600,
            height: 1.2),
        headlineMedium: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.headlineMedium,
            fontWeight: FontWeight.w600,
            height: 1.2),
        headlineSmall: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.headlineSmall,
            fontWeight: FontWeight.w600,
            height: 1.2),
        titleLarge: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.titleLarge,
            fontWeight: FontWeight.w600,
            height: 1.2),
        titleMedium: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.titleMedium,
            fontWeight: FontWeight.w600,
            height: 1.2),
        titleSmall: GoogleFonts.playfairDisplay(
            fontSize: FontSizes.titleSmall,
            fontWeight: FontWeight.w600,
            height: 1.2),
        labelLarge: GoogleFonts.inter(
            fontSize: FontSizes.labelLarge,
            fontWeight: FontWeight.w600,
            height: 1.2),
        labelMedium: GoogleFonts.inter(
            fontSize: FontSizes.labelMedium,
            fontWeight: FontWeight.w600,
            height: 1.2),
        labelSmall: GoogleFonts.inter(
            fontSize: FontSizes.labelSmall,
            fontWeight: FontWeight.w600,
            height: 1.2),
        bodyLarge: GoogleFonts.inter(
            fontSize: FontSizes.bodyLarge,
            fontWeight: FontWeight.w400,
            height: 1.5),
        bodyMedium: GoogleFonts.inter(
            fontSize: FontSizes.bodyMedium,
            fontWeight: FontWeight.w400,
            height: 1.5),
        bodySmall: GoogleFonts.inter(
            fontSize: FontSizes.bodySmall,
            fontWeight: FontWeight.w400,
            height: 1.5),
      ),
    );
