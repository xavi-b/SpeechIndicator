set(MODULE_NAME xbqmlplugin)

message("Compiling \"${MODULE_NAME}\"")

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Qml Quick)

qt_standard_project_setup()

set_source_files_properties(qml/Refresher.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(${MODULE_NAME}
    PLUGIN_TARGET ${MODULE_NAME}
    URI ${MODULE_NAME}
    VERSION ${CMAKE_PROJECT_VERSION}
    QML_FILES
        qml/SpeechWaveIndicator.qml
        qml/StateSelector.qml
        qml/TagsField.qml
        qml/TagsArea.qml
        qml/Refresher.qml
    SOURCES
        speechindicator.cpp
        speechindicator.h
)

target_link_libraries(${MODULE_NAME} PRIVATE
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
)
