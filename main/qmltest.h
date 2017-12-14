#ifndef QMLTEST_H
#define QMLTEST_H

#include <QObject>
#include <QVariant>
#include <QMetaType>
#include <QVector>
#include <QVariantMap>
//#include "myopc.h"

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
    QString delta_a1="75";//40 ~ 120
    QString delta_a2="80";//40 ~ 120
    QString delta_a3="90";//40 ~ 120
    QString delta_a4="60";//40 ~ 120
};
struct six_graph{
    QString six_x="-400";//-400 ~ 400
    QString six_y="100";//-200 ~ 200
    QString six_z="-750";//-400 ~ 400
    QString six_a1="75";//40 ~ 120
    QString six_a2="80";//40 ~ 120
    QString six_a3="90";//40 ~ 120
    QString six_joint1="60";//40 ~ 120
    QString six_joint2="50";//40 ~ 120
    QString six_joint3="55";//40 ~ 120
    QString six_joint4="65";//40 ~ 120
    QString six_joint5="70";//40 ~ 120
    QString six_joint6="80";//40 ~ 120
};
struct scara_graph{
    QString scara_x="-400";//-400 ~ 400
    QString scara_y="100";//-200 ~ 200
    QString scara_z="-750";//-400 ~ 400
    QString scara_a1="75";//40 ~ 120
    QString scara_a2="80";//40 ~ 120
    QString scara_a3="90";//40 ~ 120
    QString scara_joint1="60";//40 ~ 120
    QString scara_joint2="50";//40 ~ 120
    QString scara_joint3="55";//40 ~ 120
    QString scara_joint4="65";//40 ~ 120
};
struct camera_2D{
    QString num="0";
    QString pos_x="300";
    QString pos_y="500";
    QString pos_angle="0";
    QString pos_dir="up";
    QString flag="false";
    QString socket_states="1";
    QString new_data="0";
};
struct camera_3D{
    QString num="0";
    QString pos_x="20";
    QString pos_y="440";
    QString pos_z="200";
    QString pos_a1="0";
    QString pos_a2="0";
    QString pos_a3="0";
    QString flag="false";
    QString socket_states="0";
    QString new_data="1";
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

    void currentData_delta_graph(QVariant &data1,QVariant &data2,QVariant &data3,QVariant &data4,QVariant &data5,QVariant &data6,
                                 QVariant &data7);

    void currentData_six_graph(QVariant &data1,QVariant &data2,QVariant &data3,QVariant &data4,QVariant &data5,QVariant &data6,
                                  QVariant &data7,QVariant &data8,QVariant &data9,QVariant &data10,QVariant &data11,QVariant &data12);

    void currentData_scara_graph(QVariant &data1,QVariant &data2,QVariant &data3,QVariant &data4,QVariant &data5,QVariant &data6,
                                  QVariant &data7,QVariant &data8,QVariant &data9,QVariant &data10);

    void currentData_camera_2D(QVariant &data1,QVariant &data2,QVariant &data3,QVariant &data4,QVariant &data5,QVariant &data6,QVariant &data7,QVariant &data8);

    void currentData_camera_3D(QVariant &data1,QVariant &data2,QVariant &data3,QVariant &data4,QVariant &data5,QVariant &data6,
                               QVariant &data7,QVariant &data8,QVariant &data9,QVariant &data10);

public slots:
//    void connect_opc();
    void send_main_context();
    void send_robot();
    void send_delta_graph();
    void send_six_graph();
    void send_scara_graph();
    void send_camera_2D();
    void send_camera_3D();

private:
    main_context data_main_context;
    robot data_robot;
    delta_graph data_delta_graph;
    six_graph data_six_graph;
    scara_graph data_scara_graph;
    camera_2D data_camera_2D;
    camera_3D data_camera_3D;
};

#endif // QMLTEST_H
