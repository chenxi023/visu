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
    QVariant var1,var2,var3;
    var1.setValue(data_delta_graph.delta_x);  //设置发送的容器
    var2.setValue(data_delta_graph.delta_y);
    var3.setValue(data_delta_graph.delta_z);

    emit currentData_delta_graph(var1,var2,var3);
    //qDebug()<<"send function2";
}



