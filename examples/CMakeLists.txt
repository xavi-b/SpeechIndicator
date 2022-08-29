set(MODULE_NAME xbqmlpluginexample)

message("Compiling \"${MODULE_NAME}\"")

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Qml Quick)

qt_standard_project_setup()

qt_add_executable(${MODULE_NAME} WIN32 MACOSX_BUNDLE
    AssetUrlHandler.h
    main.cpp
)
qt_add_qml_module(${MODULE_NAME}
    URI ${MODULE_NAME}
    VERSION ${CMAKE_PROJECT_VERSION}
    QML_FILES
        app.qml
    RESOURCES
        orange.png
        red.png
    NO_RESOURCE_TARGET_PATH
)

# Avoid collision between executable name and QML module directory (QTBUG-98568).
if(NOT WIN32 AND NOT APPLE)
    set_property(TARGET ${MODULE_NAME} PROPERTY OUTPUT_NAME ${MODULE_NAME}_app)
endif()

target_link_libraries(${MODULE_NAME} PRIVATE
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
)

if(debug)
    set_target_properties(${MODULE_NAME} PROPERTIES
        WIN32_EXECUTABLE FALSE
    )
endif()
