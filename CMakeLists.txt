cmake_minimum_required(VERSION 3.15)
project(plasma_feedreader)

find_package(ECM REQUIRED NO_MODULE)
# Needed by find_package(KF5Plasma) below.
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR} ${CMAKE_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings)

# Locate plasma_install_package macro.
find_package(KF5Plasma REQUIRED)
find_package(Qt5 ${REQUIRED_QT_VERSION} CONFIG REQUIRED Quick)
find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS Plasma)

add_subdirectory(process)

# Add installatation target ("make install").
plasma_install_package(plasmoid eu.naraesk.feedreader)
