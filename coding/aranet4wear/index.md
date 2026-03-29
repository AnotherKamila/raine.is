---
title: Aranet4Wear
subtitle: Displays Aranet4 sensor data on a smartwatch.
---

Displays Aranet4 sensor data on a smartwatch (Android Wear).

It is lightweight and runs entirely on the watch. There is no phone app, no cloud, and no tracking.

[**Source Code on sr.ht**](https://sr.ht/~raine/aranet4wear) |
[**Join the Beta Test**](#-installation-amp-testing) |
[**Privacy Policy**](https://raine.is/coding/aranet4wear/privacy/) |
[**Bug tracker**](https://todo.sr.ht/~raine/aranet4wear) |
[**Send feedback**](contact)

---

## ✨ Features

* **Shows the data, duh:** Shows CO₂, temperature and humidity. No extra bullshit.
* **Ambient mode:** Stays open and does not go back to the watch face, so it's always right where 
  you left it.
* **Haptic alerts:** Get haptic notifications when CO₂ levels cross customizable thresholds. Even
  when you're not in the app -- it stays active until you tell it to stop.
* **100% local:** Data is pulled via Bluetooth Low Energy (BLE) directly to the watch.
* **Privacy-friendly:** No cloud, no analytics, no ads. I don't want your data, I'm just nice.

## 🔒 Privacy First

This app follows a "Zero Data" philosophy:

* **No cloud:** Your data never leaves your device.
* **No shady money-making schemes:** Unlike way too many mobile apps these days, this will not turn
  your device into
  an ["ethically sourced" proxy](https://en.wikipedia.org/wiki/Proxy_server#Residential_proxy_(RESIP)).
* **No unnecessary permissions:** Only needs Bluetooth (to talk to the sensor) and Notifications (to
  alert you).
* **Open Source:** The code is right here to audit. You're looking at it.

## 🛠️ Installation & Testing

Google Play requires a 14-day closed testing period for new apps. To help get this app into the
public store:

1. **Join the Google Group:** https://groups.google.com/g/aranet4wear-testers
2. **Opt-in to testing:** https://play.google.com/apps/testing/is.raine.aranet4wear
3. **Download:** Use the direct link provided in the opt-in page. _Note that this only works on
   the web version of Google play, not in the app!_

[Contact me](~raine/dev@lists.sr.ht) if you need help!

[Known Issues](https://todo.sr.ht/~raine/aranet4wear?search=status%3Aopen+label%3Abug) |
[Feature Requests and Enhancements](https://todo.sr.ht/~raine/aranet4wear?search=status%3Aopen+!label%3Abug)

### APKs

If you are of the "no Google" variety, you can get APKs on
the [releases page](https://git.sr.ht/~raine/aranet4wear/refs) and install via ADB. (No F-Droid for
watches, I wish there was.)

## 🤝 Contributing

Contributions are welcome!

* **Found a bug? Have a feature request?** Open a [ticket](https://todo.sr.ht/~raine/aranet4wear).
* **Want to code?** Submit a patch.
* **Want to help with translations?** I'm still figuring this out,
  but [contact me](~raine/dev@lists.sr.ht), we can figure it out together :D

Testing also really helps.

---

### Technical Requirements

* **Watch:** Wear OS 3.0 (Android 11) or higher.
* **Hardware:** Aranet4 Home or Aranet4 Pro sensor. (I don't own other Aranet sensors, but if you
  want me to add support for another one, [file a ticket](https://todo.sr.ht/~raine/aranet4wear) and
  I'll see what I can do.)
* **Smart Home Integration:** Must be enabled on the Aranet4 sensor, this is what allows the app to
  see the data without pairing. (Check this via the Aranet Home app. This only works on recent
  firmware versions, so if you don't see it, update to v1.2.0 or later.)

---

*Disclaimer: Aranet4Wear is a 3rd-party utility and is not affiliated with SAF Tehnika. It is not a
medical device.*
