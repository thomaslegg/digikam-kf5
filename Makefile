# Created by: Arjan van Leeuwen <avleeuwen@piwebs.com>
# $FreeBSD: branches/plasma5/PORTS/graphics/digikam-kde4/Makefile 12735 2016-06-16 19:13:21Z tcberner $

PORTNAME=	digikam
PORTVERSION=	5.1.0
#PORTEPOCH=	2
CATEGORIES=	graphics kde

MAINTAINER=	kde@FreeBSD.org
COMMENT=	KDE digital photo management application

.include "${.CURDIR}/Makefile.common"

BUILD_DEPENDS=	${LOCALBASE}/include/eigen3/Eigen/Eigen:math/eigen3
LIB_DEPENDS=	libtiff.so:graphics/tiff \
		liblcms.so:graphics/lcms \
		libpng.so:graphics/png \
		libjasper.so:graphics/jasper \
		liblqr-1.so:graphics/liblqr-1 \
		liblensfun.so:graphics/lensfun \
		libKF5KFace.so:graphics/libkface \
		libpgf.so:graphics/libpgf \
		libboost_graph.so:devel/boost-libs \
		libKF5KGeoMap.so:astro/libkgeomap \


USES+=		pkgconfig shebangfix 
#USE_KDE+=	libkdcraw4 libkexiv24 libkipi4 runtime_run
USE_QT5+=	sql-sqlite3_run
USE_LDCONFIG=	yes
CMAKE_ARGS+=	-DWITH_Sqlite2:BOOL=OFF

WRKSRC=		${WRKDIR}/${DISTNAME}/core
SHEBANG_FILES=	data/scripts/digitaglinktree/digitaglinktree

OPTIONS_DEFINE=		DOCS NLS GPHOTO2 PIMLIBS MYSQL
OPTIONS_DEFAULT=	GPHOTO2 PIMLIBS
NO_OPTIONS_SORT=	yes
OPTIONS_SUB=		yes # MYSQL

#DOCS_RUN_DEPENDS=	digikam-doc>=${DIGIKAM_VER}:graphics/digikam-kde4-doc

#NLS_RUN_DEPENDS=	digikam-l10n>=${DIGIKAM_VER}:graphics/digikam-kde4-l10n

GPHOTO2_DESC=		Gphoto2 camera support
GPHOTO2_LIB_DEPENDS=	libgphoto2.so:graphics/libgphoto2
GPHOTO2_CMAKE_ON=	-DWITH_Gphoto2:BOOL=ON
GPHOTO2_CMAKE_OFF=	-DWITH_Gphoto2:BOOL=OFF

PIMLIBS_DESC=		Address book support
PIMLIBS_USE=		KDE=pimlibs baloo
PIMLIBS_CMAKE_ON=	-DENABLE_KDEPIMLIBSSUPPORT:BOOL=ON
PIMLIBS_CMAKE_OFF=	-DENABLE_KDEPIMLIBSSUPPORT:BOOL=OFF

MYSQL_USE=		MYSQL=server QT5=sql-mysql_run
MYSQL_BUILD_DEPENDS=	${LOCALBASE}/lib/mysql/libmysqld.a:${_MYSQL_SERVER}
MYSQL_CMAKE_ON= 	-DMYSQLD_PATH:PATH=${LOCALBASE}/libexec \
			-DMYSQL_TOOLS_PATH:PATH=${LOCALBASE}/bin \
			-DENABLE_INTERNALMYSQL:BOOL=ON \
			-DENABLE_MYSQLSUPPORT:BOOL=ON
MYSQL_CMAKE_OFF=	-DENABLE_INTERNALMYSQL:BOOL=OFF \
			-DENABLE_MYSQLSUPPORT:BOOL=OFF

.include <bsd.port.mk>
