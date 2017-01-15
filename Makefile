# Created by: Thomas Legg <tjlegg@gmail.com>
# $FreeBSD$

PORTNAME=	digikam
PORTVERSION=	5.3.0
CATEGORIES=	graphics kde

MAINTAINER=	kde@FreeBSD.org
COMMENT=	KDE digital photo management application

DIGIKAM_VER=    5.3.0
MASTER_SITES=   KDE/stable/digikam
LICENSE?=       GPLv2

BUILD_DEPENDS=	${LOCALBASE}/include/eigen3/Eigen/Eigen:math/eigen3
LIB_DEPENDS=	libtiff.so:graphics/tiff \
		libpng.so:graphics/png \
		libopencv_core.so:graphics/opencv2 \
		liblcms.so:graphics/lcms \
		libjasper.so:graphics/jasper \
		liblqr-1.so:graphics/liblqr-1 \
		liblensfun.so:graphics/lensfun \
		libKF5KFace.so:graphics/libkface-kf5 \
		libpgf.so:graphics/libpgf \
		libboost_graph.so:devel/boost-libs

USES+=		cmake pkgconfig shebangfix kde:5 compiler:c++11-lib tar:xz
USE_KDE=	ecm solid xmlgui i18n config service windowsystem kio \
		notifications notifyconfig archive coreaddons \
		threadweaver
USE_QT5+=	buildtools_build core gui qmake_build widgets xml \
		concurrent sql-sqlite3_run printsupport x11extras \
		opengl
USE_LDCONFIG=	yes
CMAKE_ARGS+=	-DDIGIKAMSC_COMPILE_KIPIPLUGINS:BOOL=OFF

WRKSRC=		${WRKDIR}/${DISTNAME}
SHEBANG_FILES=	core/data/scripts/digitaglinktree/digitaglinktree

OPTIONS_DEFINE=		DOCS NLS PIMLIBS MYSQL MULTIMEDIA GEOLOCATION GPHOTO2
OPTIONS_DEFAULT=	DOCS GEOLOCATION
NO_OPTIONS_SORT=	yes
OPTIONS_SUB=		yes # MYSQL

DOCS_DESC=		Digikam documentation
USES+=		gettext
USE_KDE+=	doctools
DOCS_CMAKE_ON=	-DDIGIKAMSC_COMPILE_DOC:BOOL=ON
DOCS_CMAKE_OFF=	-DDIGIKAMSC_COMPILE_DOC:BOOL=OFF

NLS_DESC=	Digikam i18n translations
NLS_USES=		gettext 
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
GEOLOCATION_LIB_DEPENDS=	libKF5KGeoMap.so:astro/libkgeomap
GEOLOCATION_KDE_USE=	bookmarks

MULTIMEDIA_DESC=	Multimedia support (experimental)
USE_QT5+=		multimedia
MULTIMEDIA_CMAKE_ON=	-DENABLE_MEDIAPLAYER:BOOL=ON
MULTIMEDIA_CMAKE_OFF=	-DENABLE_MEDIAPLAYER:BOOL=OFF

.include <bsd.port.mk>
