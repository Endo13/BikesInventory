# Target Definition

TARGET = BikeEquipmentManager
TEMPLATE = app


# Directories Definition

PROJECTDIR = ../../../..
Debug::DESTDIR = ../DELIVERY/win-msvc2015-x86-QT5.9.6/debug
Release::DESTDIR = ../DELIVERY/win-msvc2015-x86-QT5.9.6/release

DEFINES = _WIN32_PLATEFORM_ 
DEFINES +=_CRT_SECURE_NO_WARNINGS
DEFINES += WIN32_LEAN_AND_MEAN

QT       += core gui sql widgets charts

RESOURCES     = ressources/ressources.qrc
RC_FILE = BEM.rc

SOURCES += main.cpp\
        mainwindow.cpp \
		Equipments\gearsdialog.cpp \
		Equipments\gearsSqlModel.cpp \
		Equipments\gearsEdit.cpp \
		Equipments\gearsview.cpp \		
		Bikes\bikedialog.cpp \
		Bikes\bikesview.cpp \
		Bikes\bikesSqlModel.cpp \
		Bikes\bikesEdit.cpp \
		Workouts\workoutdialog.cpp \
		Workouts\workoutview.cpp \
		Workouts\workoutSqlModel.cpp \
		Workouts\workoutEdit.cpp \
		Common\tableUtilities.cpp \
		Common/coordinates.cpp \
		Common/rectc.cpp \
		Common/greatcircle.cpp \
		Common/savedialog.cpp \
		Common/dondialog.cpp \
		Common/servicebook.cpp \
		Data/data.cpp \
		Data/poi.cpp \
		Data/track.cpp \
		Data/route.cpp \
		Data/path.cpp \
		Data/gpxparser.cpp \
		Data/tcxparser.cpp \
		Data/fitparser.cpp \
		Data/dem.cpp \
		Data/polygon.cpp \
		Statistics/statisticsdialog.cpp

HEADERS  += mainwindow.h \
			Equipments\gearsdialog.h \
			Equipments\gearsSqlModel.h \
			Equipments\gearsview.h \
			Equipments\gearsEdit.h \			
			Bikes\bikedialog.h \
			Bikes\bikesSqlModel.h \
			Bikes\bikesview.h \
			Bikes\bikesEdit.h \
			Workouts\workoutdialog.h \
			Workouts\workoutview.h \
			Workouts\workoutSqlModel.h \
			Workouts\workoutEdit.h \
			Common\tableUtilities.h \
			Common/staticassert.h \
			Common/coordinates.h \
			Common/rectc.h \
			Common/rtree.h \
			Common/greatcircle.h \
			Common/wgs84.h \
			Common/savedialog.h \
			Common/dondialog.h \
			Common/servicebook.h \
			Data/address.h \
			Data/link.h \
			Data/graph.h \
			Data/poi.h \
			Data/waypoint.h \
			Data/track.h \
			Data/route.h \
			Data/trackpoint.h \
			Data/data.h \
			Data/parser.h \
			Data/trackdata.h \
			Data/routedata.h \
			Data/path.h \
			Data/link.h \
			Data/gpxparser.h \
			Data/tcxparser.h \
			Data/fitparser.h \
			Data/dem.h \
			Data/polygon.h \
			Data/area.h \
			Data/imageinfo.h \
			Statistics/statisticsdialog.h			

FORMS    += mainwindow.ui \			
			Bikes\bikedialog.ui \
			Bikes\bikesview.ui \
			Equipments\gearsdialog.ui \
			Equipments\gearsview.ui \
			Workouts\workoutdialog.ui \
			Common/savedialog.ui \
			Common/dondialog.ui \
			Common/servicebook.ui \
			Workouts\workoutview.ui \
			Statistics/statisticsdialog.ui
	
TRANSLATIONS += BikeEquipmentManager_en.ts \
				BikeEquipmentManager_es.ts
	