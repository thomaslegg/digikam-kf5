# Created by: Thomas Legg <tjlegg@gmail.com>
# $FreeBSD$

PORTNAME=	digikam
PORTVERSION=	5.3.0
CATEGORIES=	graphics kde
MASTER_SITES=   KDE/stable/digikam

MAINTAINER=	kde@FreeBSD.org
COMMENT=	KDE digital photo management application

LICENSE=       GPLv2

BUILD_DEPENDS=	${LOCALBASE}/include/eigen3/Eigen/Eigen:math/eigen3 \
		${LOCALBASE}/bin/msgfmt:devel/gettext-tools 
LIB_DEPENDS=	libboost_graph.so:devel/boost-libs \
				libjasper.so:graphics/jasper \
				libKF5KFace.so:graphics/libkface-kf5 \
				liblcms2.so:graphics/lcms2 \
				liblensfun.so:graphics/lensfun \
				liblqr-1.so:graphics/liblqr-1 \
				libopencv_core.so:graphics/opencv2 \
				libpgf.so:graphics/libpgf \
				libpng.so:graphics/png \
				libtiff.so:graphics/tiff

USES=		cmake compiler:c++11-lib kde:5 pkgconfig shebangfix  tar:xz
USE_KDE=	akonadicalendar akonadi-contacts archive config coreaddons  \
		ecm filemetadata5 kio  notifyconfig notifications \
		solid service threadweaver windowsystem xmlgui
USE_QT5=	buildtools_build concurrent  core gui opengl printsupport \
		qmake_build sql-sqlite3_run widgets xml x11extras 
USE_LDCONFIG=	yes
CMAKE_ARGS=	-DDIGIKAMSC_COMPILE_KIPIPLUGINS:BOOL=OFF
SHEBANG_FILES=	core/data/scripts/digitaglinktree/digitaglinktree

OPTIONS_DEFINE=		DOCS GEOLOCATION GPHOTO2 MULTIMEDIA MYSQL NLS PIMLIBS  
OPTIONS_DEFAULT=	DOCS GEOLOCATION
OPTIONS_SUB=		yes # MYSQL

DOCS_DESC=		Digikam documentation
DOCS_USES=	KDE=doctools
DOCS_CMAKE_ON=	-DDIGIKAMSC_COMPILE_DOC:BOOL=ON
DOCS_CMAKE_OFF= -DDIGIKAMSC_COMPILE_DOC:BOOL=OFF

NLS_DESC=	Digikam i18n translations
NLS_USES=	gettext 
NLS_USES+=	KDE=i18n
NLS_CMAKE_ON=	-DDIGIKAMSC_COMPILE_PO:BOOL=ON
NLS_CMAKE_OFF=	-DDIGIKAMSC_COMPILE_PO:BOOL=OFF

PIMLIBS_DESC=		KMail contact  support
PIMLIBS_USE=		KDE= contacts
PIMLIBS_CMAKE_ON=	-DENABLE_AKONADICONTACTSUPPORT:BOOL=ON
PIMLIBS_CMAKE_OFF=	-DENABLE_AKONADICONTACTSUPPORT:BOOL=OFF

MYSQL_USE=		MYSQL=server QT5=sql-mysql_run
MYSQL_BUILD_DEPENDS=	${LOCALBASE}/lib/mysql/libmysqld.a:${_MYSQL_SERVER}
MYSQL_CMAKE_ON=		-DMYSQLD_PATH:PATH=${LOCALBASE}/libexec \
			-DMYSQL_TOOLS_PATH:PATH=${LOCALBASE}/bin \
			-DENABLE_INTERNALMYSQL:BOOL=ON \
			-DENABLE_MYSQLSUPPORT:BOOL=ON
MYSQL_CMAKE_OFF=	-DENABLE_INTERNALMYSQL:BOOL=OFF \
			-DENABLE_MYSQLSUPPORT:BOOL=OFF

GPHOTO2_DESC=		Gphoto2 camera support
GPHOTO2_LIB_DEPENDS=	libgphoto2.so:graphics/libgphoto2

GEOLOCATION_DESC=	Geolocation support
GEOLOCATION_LIB_DEPENDS=	libKF5KGeoMap.so:astro/libkgeomap-kf5
GEOLOCATION_USE=	KDE=bookmarks

MULTIMEDIA_DESC=	Multimedia support (experimental)
MULTIMEDIA_USE=		QT5=multimedia
MULTIMEDIA_CMAKE_ON=	-DENABLE_MEDIAPLAYER:BOOL=ON
MULTIMEDIA_CMAKE_OFF=	-DENABLE_MEDIAPLAYER:BOOL=OFF

.include <bsd.port.mk>
