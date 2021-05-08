#ifndef XBQMLPLUGIN_PLUGIN_H
#define XBQMLPLUGIN_PLUGIN_H

#include <QQmlExtensionPlugin>

class XBQmlPluginPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // XBQMLPLUGIN_PLUGIN_H
