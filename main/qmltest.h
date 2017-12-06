#ifndef QMLTEST_H
#define QMLTEST_H

#include <QObject>
#include <QVariant>
#include <QMetaType>
#include <QVector>
#include <QVariantMap>

struct main_context{
    QString warning="no warning!";
    QString states="init";
    QString poweron="0";
    QString belt_1_vel="100";
    QString belt_2_vel="120";
    QString delta_vel="100";
    QString six_vel="50";
    QString scara_vel="50";
    QString start="0";
    QString stop="0";
    QString delta_enable="1";
    QString six_enable="1";
    QString scara_enable="1";
};
struct robot{
    QString delta_power="0";
    QString delta_states="init";
    QString delta_warning="no warning!";
    QString six_power="0";
    QString six_states="init";
    QString six_warning="no warning!";
    QString scara_power="0";
    QString scara_states="init";
    QString scara_warning="no warning!";
};
struct delta_graph{
    QString delta_x="-400";//-400 ~ 400
    QString delta_y="100";//-200 ~ 200
    QString delta_z="-750";//-400 ~ 400
};

Q_DECLARE_METATYPE(main_context)
Q_DECLARE_METATYPE(robot)
Q_DECLARE_METATYPE(delta_graph)


class QmlTest : public QObject
{
    Q_OBJECT

public:
    explicit QmlTest(QObject *parent = 0);
    ~QmlTest();
//     void getvecvalue (revdata &data);
//     void senddata();

signals:
    void currentData_main_context(QVariant &data1,QVariant &data2,QVariant &data3,QVariant &data4,QVariant &data5,QVariant &data6,
                                  QVariant &data7,QVariant &data8,QVariant &data9,QVariant &data10,QVariant &data11,QVariant &data12,QVariant &data13);

    void currentData_robot(QVariant &data1,QVariant &data2,QVariant &data3,QVariant &data4,QVariant &data5,QVariant &data6,
                                  QVariant &data7,QVariant &data8,QVariant &data9);

    void currentData_delta_graph(QVariant &data1,QVariant &data2,QVariant &data3);

public slots:
    void send_main_context();
    void send_robot();
    void send_delta_graph();

private:
    main_context data_main_context;
    robot data_robot;
    delta_graph data_delta_graph;
};

#endif // QMLTEST_H
