#include "speechindicator_plugin.h"

#include "speechindicator.h"

#include <qqml.h>

void SpeechIndicatorPlugin::registerTypes(const char *uri)
{
    // @uri net.xavib.speechindicator
    qmlRegisterType<SpeechIndicator>(uri, 1, 0, "SpeechIndicator");
    qmlRegisterType(QUrl("qrc:/qml/SpeechWaveIndicator.qml"), uri, 1, 0, "SpeechWaveIndicator");
}

