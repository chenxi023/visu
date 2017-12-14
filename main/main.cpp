#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQuickView>
#include <QObject>
#include "graph.h"
#include <QtQml/QQmlContext>
#include "qmltest.h"
//#include "myopc.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    qmlRegisterType<Graph>("Graph", 1, 0, "Graph");
    qmlRegisterType<QmlTest>("an.Qt.QmlTest",1,0,"QmlTest");

    QQuickView view;//从QQuickWindow继承来的，搭配item，对窗口的控制权在c++代码里面
    view.resize(850, 400);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    QObject::connect(view.engine(), SIGNAL(quit()), &app, SLOT(quit()));
    view.setSource(QUrl("qrc:/main.qml"));
    view.show();

    return app.exec();
}
