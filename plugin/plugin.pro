TEMPLATE        = lib
CONFIG         += plugin c++17
DEFINES        += QT_DEPRECATED_WARNINGS
QT             += qml quick
TARGET          = xbqmlplugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = net.xavib.xbqmlplugin

DESTDIR = $$PWD/$$replace(uri, \., /)

SOURCES += \
        xbqmlplugin_plugin.cpp \
        speechindicator.cpp

HEADERS += \
        xbqmlplugin_plugin.h \
        speechindicator.h

DISTFILES = qmldir

RESOURCES += \
    qml.qrc

copy_qmldir.target = $$DESTDIR/qmldir
copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
copy_qmldir.commands = $(COPY_FILE) "$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)" "$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)"
QMAKE_EXTRA_TARGETS += copy_qmldir
PRE_TARGETDEPS += $$copy_qmldir.target

unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \., /)

    target.path = $$installPath

    qmldir.files = qmldir
    qmldir.path = $$installPath

    INSTALLS += target qmldir qmlfiles
}

