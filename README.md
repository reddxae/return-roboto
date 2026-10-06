# Return Roboto

Forces the use of AOSP fonts and restores the intended font weights in newer Android versions.

## A bit on current Google state
### Why some text loses its bold weight in Android 16 QPR1+

Well, you know, Google won't be Google if they're not retarded. So, what's the deal: since Android 16 QPR1 (Material 3 Expressive update), AOSP SystemUI and some default apps such as Settings reference to font families such as `variable-label-large-emphasized`, `google-sans`, and their derivatives. These families are just **missing** from AOSP's font configuration and only provided in Google's Pixel OS through additional vendor assets. All of that stuff are separate from base AOSP, but they are hardcoded in AOSP components for some lazy or greedy reason.

That's why most of AOSP-based ROMs or aftermarket OSes, such as LineageOS or GrapheneOS, have this problem with broken font styles — requested resources are missing in the system, falling back to Roboto at weight 400 (regular).

Some custom ROMs (often called "Pixel-like" ROMs), which include Google Sans font family with Pixel's font configuration, aren't affected by this. However, you still can use this module there, as well as on Pixel OS itself; the provided configuration fits universally on Android builds that haven't been heavily modified.

### Fixing

The module adds the missing names to `/product/etc/fonts_customization.xml`, which is read by Android, even if that config file isn't originally included in your build. The existing Roboto variable font is being reused with aliases to required font families with the correct weights.

<details>

<summary>Screenshots</summary>

### SystemUI

| Before | After |
| --- | --- |
| <img src="preview/SystemUI_light_before.png#gh-light-mode-only" alt="SystemUI before, light theme" width="100%"><img src="preview/SystemUI_dark_before.png#gh-dark-mode-only" alt="SystemUI before, dark theme" width="100%"> | <img src="preview/SystemUI_light_after.png#gh-light-mode-only" alt="SystemUI after, light theme" width="100%"><img src="preview/SystemUI_dark_after.png#gh-dark-mode-only" alt="SystemUI after, dark theme" width="100%"> |

### Settings

| Before | After |
| --- | --- |
| <img src="preview/Settings_light_before.png#gh-light-mode-only" alt="Settings before, light theme" width="100%"><img src="preview/Settings_dark_before.png#gh-dark-mode-only" alt="Settings before, dark theme" width="100%"> | <img src="preview/Settings_light_after.png#gh-light-mode-only" alt="Settings after, light theme" width="100%"><img src="preview/Settings_dark_after.png#gh-dark-mode-only" alt="Settings after, dark theme" width="100%"> |

</details>

## Downloads

Grab the relevant module from Releases or directly from the table below.

Pixel OS (and Pixel-like ROMs) users should pick the `pixel` variant of the module to save Google Sans on the lockscreen, since its metrics are hardcoded in the framework, and another font will most likely not be centered correctly.

| Module name | Compatible Android version | Source files |
| --- | --- | --- |
| [`return-roboto-v17.0.zip`](https://github.com/reddxae/return-roboto/releases/download/v17.0/return-roboto-v17.0.zip) <br> [`return-roboto-v17.0-pixel.zip`](https://github.com/reddxae/return-roboto/releases/download/v17.0/return-roboto-v17.0-pixel.zip) for Pixel OS | Android 16 QPR2 / Android 17 QRP0 | [`modules/17.0`](modules/17.0/) |
| [`return-roboto-v16.1.zip`](https://github.com/reddxae/return-roboto/releases/download/v16.1/return-roboto-v16.1.zip) <br> [`return-roboto-v16.1-pixel.zip`](https://github.com/reddxae/return-roboto/releases/download/v16.1/return-roboto-v16.1-pixel.zip) for Pixel OS | Android 16 QPR1 | [`modules/16.1`](modules/16.1/) |
| [`return-roboto-v16.0.zip`](https://github.com/reddxae/return-roboto/releases/download/v16.0/return-roboto-v16.0.zip) <br> [`return-roboto-v16.0-pixel.zip`](https://github.com/reddxae/return-roboto/releases/download/v16.0/return-roboto-v16.0-pixel.zip) for Pixel OS | Android 16 QPR0 | [`modules/16.0`](modules/16.0/) |
| [`return-roboto-v15.0.zip`](https://github.com/reddxae/return-roboto/releases/download/v15.0/return-roboto-v15.0.zip) <br> [`return-roboto-v15.0-pixel.zip`](https://github.com/reddxae/return-roboto/releases/download/v15.0/return-roboto-v15.0-pixel.zip) for Pixel OS | Android 15 QPR0/QPR1/QPR2 | [`modules/15.0`](modules/15.0/) |

Android 15 QPR0/QPR1/QPR2 module automatically adapts CJK entries when an older static font is installed. This is not needed on newer versions since Android 15 QPR2, but I kept the module unified for convenience.

Android <14 is untested and therefore unsupported; PRs are welcome.

It's highly unlikely to work with OEM stock ROMs, like One UI, HyperOS, ColorOS, etc.
