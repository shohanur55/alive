#!/bin/bash

# ============================================================
# Clean Architecture Template — New Project Setup Script
# Usage: bash setup_new_project.sh /path/to/new/flutter/project
# ============================================================

TEMPLATE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$1"

if [ -z "$TARGET_DIR" ]; then
  echo "❌ Error: Please provide the target project path."
  echo "Usage: bash setup_new_project.sh /path/to/new/flutter/project"
  exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "❌ Error: Target directory does not exist: $TARGET_DIR"
  exit 1
fi

echo "🚀 Setting up Clean Architecture in: $TARGET_DIR"
echo ""

# 1. Copy the entire lib/src folder
echo "📁 Step 1: Copying lib/src folder..."
cp -r "$TEMPLATE_DIR/lib/src" "$TARGET_DIR/lib/"
echo "   ✅ lib/src copied!"

# 2. Copy main.dart
echo "📁 Step 2: Copying main.dart..."
cp "$TEMPLATE_DIR/lib/main.dart" "$TARGET_DIR/lib/main.dart"
echo "   ✅ main.dart copied!"

# 3. Copy AGENTS.md (so agent understands the structure)
echo "📁 Step 3: Copying AGENTS.md for AI agent..."
mkdir -p "$TARGET_DIR/.agents"
cp "$TEMPLATE_DIR/.agents/AGENTS.md" "$TARGET_DIR/.agents/AGENTS.md"
echo "   ✅ .agents/AGENTS.md copied!"

# 4. Copy build.yaml
echo "📁 Step 4: Copying build.yaml..."
cp "$TEMPLATE_DIR/build.yaml" "$TARGET_DIR/build.yaml"
echo "   ✅ build.yaml copied!"

# 5. Copy l10n.yaml
echo "📁 Step 5: Copying l10n.yaml..."
cp "$TEMPLATE_DIR/l10n.yaml" "$TARGET_DIR/l10n.yaml"
echo "   ✅ l10n.yaml copied!"

# 6. Copy packages folder
echo "📁 Step 6: Copying packages folder (flutter_guardian)..."
cp -r "$TEMPLATE_DIR/packages" "$TARGET_DIR/"
echo "   ✅ packages copied!"

# 7. Copy analysis_options.yaml
echo "📁 Step 7: Copying analysis_options.yaml..."
cp "$TEMPLATE_DIR/analysis_options.yaml" "$TARGET_DIR/analysis_options.yaml"
echo "   ✅ analysis_options.yaml copied!"

echo ""
echo "============================================================"
echo "✅ All files copied successfully!"
echo ""
echo "📋 NEXT STEPS:"
echo ""
echo "1. Open pubspec.yaml in your new project and add these dependencies:"
echo ""
echo "   dependencies:"
echo "     gap: ^3.0.1"
echo "     flutter_riverpod: ^3.1.0"
echo "     go_router: ^17.0.1"
echo "     shared_preferences: ^2.3.1"
echo "     riverpod_annotation: ^4.0.0"
echo "     freezed_annotation: ^3.0.0"
echo "     flutter_svg: ^2.0.10+1"
echo "     logger: ^2.4.0"
echo "     pretty_dio_logger: ^1.4.0"
echo "     dart_mappable:"
echo "     retrofit: ^4.4.0"
echo "     dio: ^5.8.0+1"
echo "     flutter_localizations:"
echo "       sdk: flutter"
echo "     intl: ^0.20.2"
echo ""
echo "   dev_dependencies:"
echo "     build_runner:"
echo "     custom_lint:"
echo "     flutter_guardian:"
echo "       path: packages/flutter_guardian/"
echo "     riverpod_generator:"
echo "     riverpod_lint:"
echo "     flutter_gen_runner:"
echo "     dart_mappable_builder:"
echo "     retrofit_generator: ^10.2.1"
echo "     freezed: ^3.0.6"
echo ""
echo "   flutter:"
echo "     generate: true"
echo ""
echo "   flutter_gen:"
echo "     output: lib/src/presentation/core/gen"
echo "     line_length: 80"
echo "     integrations:"
echo "       flutter_svg: true"
echo ""
echo "2. Run: flutter pub get"
echo "3. Run: dart run build_runner build --delete-conflicting-outputs"
echo "4. Update your app name and package name in Android/iOS folders"
echo "5. Change the brand color in:"
echo "   lib/src/presentation/core/theme/src/theme_extensions/src/colors/primitive.dart"
echo "6. Update the base API URL in:"
echo "   lib/src/data/services/network/endpoints.dart"
echo ""
echo "🎉 Happy coding!"
echo "============================================================"
