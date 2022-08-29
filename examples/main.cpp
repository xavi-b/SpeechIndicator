#include <QQmlApplicationEngine>
#include <QGuiApplication>

#include "AssetUrlHandler.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    AssetUrlHandlerObject urlHandlerObject;

    QQmlApplicationEngine engine;

    engine.addImportPath(app.applicationDirPath() + "/../");
    engine.addUrlInterceptor(&urlHandlerObject._handler);

    const QUrl url(QStringLiteral("qrc:/app.qml"));
    engine.load(url);

    QObject::connect(engine.rootObjects().first(), SIGNAL(buttonClicked()), &urlHandlerObject, SLOT(cppSlot()));

    return app.exec();
}
