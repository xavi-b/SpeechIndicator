#ifndef ASSETURLHANDLER_H
#define ASSETURLHANDLER_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlAbstractUrlInterceptor>
#include <QDir>

class AssetUrlHandler : public QQmlAbstractUrlInterceptor
{
public:
    AssetUrlHandler() {
        QDir::setSearchPaths("asset",{":/assets", QGuiApplication::applicationDirPath() + "/assets"});
    }

    QUrl intercept(const QUrl& path, QQmlAbstractUrlInterceptor::DataType type) override
    {
        if (type == QQmlAbstractUrlInterceptor::DataType::QmldirFile)
            return path; // no need to lookup these files; this is about assets, not about QML files

        auto scheme = path.scheme();
        if (scheme == QLatin1String("asset")) {
            if (_inverted)
                return QUrl("qrc:/red.png");
            else
                return QUrl("qrc:/orange.png");
        }

        return path;
    }

public:
    bool _inverted = true;
};

class AssetUrlHandlerObject : public QObject
{
    Q_OBJECT

public slots:
    void cppSlot()
    {
        _handler._inverted = !_handler._inverted;
    }

public:
    AssetUrlHandler _handler;
};

#endif // ASSETURLHANDLER_H
