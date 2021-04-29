#ifndef SPEECHINDICATOR_PLUGIN_H
#define SPEECHINDICATOR_PLUGIN_H

#include <QQmlExtensionPlugin>

class SpeechIndicatorPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // SPEECHINDICATOR_PLUGIN_H
