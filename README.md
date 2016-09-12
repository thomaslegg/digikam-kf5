This is a FreeBSD ports skeleton for digikam-kf5. It's designed to be built against the plasma5 branch of the area51 repository.

The second revision brings docs and nls support into the digikam-kf5 port, which eliminates the digikam-kf5-doc and digikam-kf5-l10n ports. It also updates the other options and brings in a new option for multimedia playback from digikam. This has been tested and works with qt5.6.1-multimedia.

This second revision also updates the qt5 and kde:5 requirements as per digikam 5.1.0's DEPENDENCIES file, so it might just build from a bare poudriere using the area51 kf5 branch (except for the kmail contacts integration as 16.08 kde contacts requires qt5-webengine which is an incomplete port).

The third revision brings back the ghoto2 option.
