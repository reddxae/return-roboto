#!/system/bin/sh

font_sdk=$(getprop ro.build.version.sdk)
font_build_id=$(getprop ro.build.id)
case "$font_sdk" in
  37) ;;
  36)
    case "$font_build_id" in
      BP1*|BP2*|BP3*)
        abort "- Use the Return Roboto module for your Android QPR version."
        ;;
    esac
    ;;
  *) abort "- This module supports Android 16 QPR2 and Android 17! Aborting." ;;
esac

# Check whether the font file is available
[ -f /system/fonts/Roboto-Regular.ttf ] ||
  abort "- Roboto-Regular.ttf is missing from system assets! Aborting."

# Select the Pixel typography table for this Android version.
# QPR2 and Android 17 share default weights, but Android 17 adds bold slots.
if [ "$font_sdk" -eq 37 ]; then
  sed -i \
    -e 's/to="roboto-ui-400"/to="roboto-ui-400-700-1000"/g' \
    -e 's/to="roboto-ui-500"/to="roboto-ui-500-800-1000"/g' \
    -e 's/to="roboto-ui-600"/to="roboto-ui-600-900-1000"/g' \
    -e 's/to="roboto-ui-500-700"/to="roboto-ui-500-700-800-1000"/g' \
    "$MODPATH/system/product/etc/fonts_customization.xml" ||
    abort "- Failed to select the Android 17 font profiles! Aborting."
fi

# Set permissions
ui_print "- Setting permissions"
set_perm_recursive "$MODPATH" 0 0 0755 0644
