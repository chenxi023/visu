#include "qmltest.h"
#include <QDebug>
#include <QVariant>
#include <QMetaType>
#include <QVector>
#include <QVariantMap>

QmlTest::QmlTest(QObject *parent)
{

    QVariant DataVar;
    DataVar.setValue(data_main_context);
    qRegisterMetaType<QVariant>("QVariant"); //写在构造函数里
    qRegisterMetaType<QVariant>("QVariant&"); //写在构造函数里
}

QmlTest::~QmlTest()
{
}

//void QmlTest::connect_opc(){
//    OPC_Client();
//    OPCItemData data;
//    itemsCreated[0]->readSync(data, OPC_DS_DEVICE);
//    qDebug("Synch read quality %ld value %ld\n", data.wQuality, data.vDataValue.iVal);
//}

void QmlTest::send_main_context()
{
    QVariant var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12,var13;
    var1.setValue(data_main_context.warning);  //设置发送的容器
    var2.setValue(data_main_context.states);
    var3.setValue(data_main_context.poweron);
    var4.setValue(data_main_context.belt_1_vel);
    var5.setValue(data_main_context.belt_2_vel);
    var6.setValue(data_main_context.delta_vel);
    var7.setValue(data_main_context.six_vel);
    var8.setValue(data_main_context.scara_vel);
    var9.setValue(data_main_context.start);
    var10.setValue(data_main_context.stop);
    var11.setValue(data_main_context.delta_enable);
    var12.setValue(data_main_context.six_enable);
    var13.setValue(data_main_context.scara_enable);

    //qDebug()<<"send function"<<var1.value<revdata>().num;
    //emit currentDemo(("demo"));

    emit currentData_main_context(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12,var13);
    //qDebug()<<"send function2";
}

void QmlTest::send_robot()
{
    QVariant var1,var2,var3,var4,var5,var6,var7,var8,var9;
    var1.setValue(data_robot.delta_power);  //设置发送的容器
    var2.setValue(data_robot.delta_states);
    var3.setValue(data_robot.delta_warning);
    var4.setValue(data_robot.six_power);
    var5.setValue(data_robot.six_states);
    var6.setValue(data_robot.six_warning);
    var7.setValue(data_robot.scara_power);
    var8.setValue(data_robot.scara_states);
    var9.setValue(data_robot.scara_warning);

    emit currentData_robot(var1,var2,var3,var4,var5,var6,var7,var8,var9);
    //qDebug()<<"send function2";
}

void QmlTest::send_delta_graph()
{
    QVariant var1,var2,var3,var4,var5,var6,var7;
    var1.setValue(data_delta_graph.delta_x);  //设置发送的容器
    var2.setValue(data_delta_graph.delta_y);
    var3.setValue(data_delta_graph.delta_z);
    var4.setValue(data_delta_graph.delta_a1);
    var5.setValue(data_delta_graph.delta_a2);
    var6.setValue(data_delta_graph.delta_a3);
    var7.setValue(data_delta_graph.delta_a4);

    emit currentData_delta_graph(var1,var2,var3,var4,var5,var6,var7);
    //qDebug()<<"send function2";
}

void QmlTest::send_six_graph()
{
    QVariant var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12;
    var1.setValue(data_six_graph.six_x);  //设置发送的容器
    var2.setValue(data_six_graph.six_y);
    var3.setValue(data_six_graph.six_z);
    var4.setValue(data_six_graph.six_a1);
    var5.setValue(data_six_graph.six_a2);
    var6.setValue(data_six_graph.six_a3);
    var7.setValue(data_six_graph.six_joint1);
    var8.setValue(data_six_graph.six_joint2);
    var9.setValue(data_six_graph.six_joint3);
    var10.setValue(data_six_graph.six_joint4);
    var11.setValue(data_six_graph.six_joint5);
    var12.setValue(data_six_graph.six_joint6);

    emit currentData_six_graph(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12);
    //qDebug()<<"send function2";
}

void QmlTest::send_scara_graph()
{
    QVariant var1,var2,var3,var4,var5,var6,var7,var8,var9,var10;
    var1.setValue(data_scara_graph.scara_x);  //设置发送的容器
    var2.setValue(data_scara_graph.scara_y);
    var3.setValue(data_scara_graph.scara_z);
    var4.setValue(data_scara_graph.scara_a1);
    var5.setValue(data_scara_graph.scara_a2);
    var6.setValue(data_scara_graph.scara_a3);
    var7.setValue(data_scara_graph.scara_joint1);
    var8.setValue(data_scara_graph.scara_joint2);
    var9.setValue(data_scara_graph.scara_joint3);
    var10.setValue(data_scara_graph.scara_joint4);

    emit currentData_scara_graph(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10);
    //qDebug()<<"send function2";
}

void QmlTest::send_camera_2D()
{
    QVariant var1,var2,var3,var4,var5,var6,var7,var8;
    var1.setValue(data_camera_2D.num);
    var2.setValue(data_camera_2D.pos_x);
    var3.setValue(data_camera_2D.pos_y);
    var4.setValue(data_camera_2D.pos_angle);
    var5.setValue(data_camera_2D.pos_dir);
    var6.setValue(data_camera_2D.flag);
    var7.setValue(data_camera_2D.socket_states);
    var8.setValue(data_camera_2D.new_data);


    emit currentData_camera_2D(var1,var2,var3,var4,var5,var6,var7,var8);
}

void QmlTest::send_camera_3D()
{
    QVariant var1,var2,var3,var4,var5,var6,var7,var8,var9,var10;
    var1.setValue(data_camera_3D.num);
    var2.setValue(data_camera_3D.pos_x);
    var3.setValue(data_camera_3D.pos_y);
    var4.setValue(data_camera_3D.pos_z);
    var5.setValue(data_camera_3D.pos_a1);
    var6.setValue(data_camera_3D.pos_a2);
    var7.setValue(data_camera_3D.pos_a3);
    var8.setValue(data_camera_3D.flag);
    var9.setValue(data_camera_3D.socket_states);
    var10.setValue(data_camera_3D.new_data);

    emit currentData_camera_3D(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10);
}


