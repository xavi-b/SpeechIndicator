#include "xbqmlplugin_plugin.h"

#include "speechindicator.h"

#include <qqml.h>

void XBQmlPluginPlugin::registerTypes(const char* uri)
{
    // @uri net.xavib.xbqmlplugin
    qmlRegisterType<SpeechIndicator>(uri, 1, 0, "SpeechIndicator");
    qmlRegisterType(QUrl("qrc:/qml/SpeechWaveIndicator.qml"), uri, 1, 0, "SpeechWaveIndicator");
    qmlRegisterType(QUrl("qrc:/qml/StateSelector.qml"), uri, 1, 0, "StateSelector");
    qmlRegisterType(QUrl("qrc:/qml/TagsField.qml"), uri, 1, 0, "TagsField");
    qmlRegisterType(QUrl("qrc:/qml/TagsArea.qml"), uri, 1, 0, "TagsArea");
}
