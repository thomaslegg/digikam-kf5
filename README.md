This is a FreeBSD ports skeleton for digikam-kf5. It's designed to be built against the plasma5 branch of the area51 repository.

A few of the patches added in the files directory handle c++11 compiler errors as default compiler on FreeBSD 11 is c++11. I should probably add a USES compiler switch to mandate c++11.

I doubt I've added all the necessary USES for kde5 or qt5.

Many libraries which digikam considers optional, like LQR, are listed as required here since they were listed as required in the digikam-kde4 port. Currently I don't have multimedia enabled and the gphoto2 use is disabled due to gphoto2 requiring usb1.


