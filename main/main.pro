TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    graph.cpp \
    gridnode.cpp \
    linenode.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    graph.h \
    gridnode.h \
    linenode.h
