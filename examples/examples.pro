QT             += core qml quick
CONFIG         += c++17
DESTDIR         = $$PWD

debug {
CONFIG += console
}

SOURCES += \
    main.cpp

HEADERS += \
    AssetUrlHandler.h

RESOURCES += \
    examples.qrc
