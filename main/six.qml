

import QtQuick 2.0
import QtQml 2.0
import Graph 1.0
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import an.Qt.QmlTest 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0


Item{
    id: six_main
    visible: true

    Rectangle{
        id: opacitytest_six;
        width: 850; height: 350;
        color: "#edf0f0";

        QmlTest {
            id: demoMaker;
        }
        Connections {
            target: demoMaker;
            onCurrentData_six_graph:{
                if (quit.pressed==false){
                    graph_six_0.removeFirstSample();
                    graph_six_1.removeFirstSample();
                    graph_six_2.removeFirstSample();
                    graph_six_a1.removeFirstSample();
                    graph_six_a2.removeFirstSample();
                    graph_six_a3.removeFirstSample();
                    graph_six_j1.removeFirstSample();
                    graph_six_j2.removeFirstSample();
                    graph_six_j3.removeFirstSample();
                    graph_six_j4.removeFirstSample();
                    graph_six_j5.removeFirstSample();
                    graph_six_j6.removeFirstSample();

                    var six_x=0.5-(data1/1000);
                    var six_y=0.5-(data2/500);
                    var six_z=-3-(data3/200);
                    var six_a1=-0.3+(data4/100);
                    var six_a2=-0.3+(data5/100);
                    var six_a3=-0.3+(data6/100);
                    var six_j1=-0.3+(data7/100);
                    var six_j2=-0.3+(data8/100);
                    var six_j3=-0.3+(data9/100);
                    var six_j4=-0.3+(data10/100);
                    var six_j5=-0.3+(data11/100);
                    var six_j6=-0.3+(data12/100);

                    graph_six_0.appendSample(0,six_x);
                    graph_six_1.appendSample(1,six_y);
                    graph_six_2.appendSample(2,six_z);
                    graph_six_a1.appendSample(3,six_a1);
                    graph_six_a2.appendSample(4,six_a2);
                    graph_six_a3.appendSample(5,six_a3);
                    graph_six_j1.appendSample(0,six_j1);
                    graph_six_j2.appendSample(1,six_j2);
                    graph_six_j3.appendSample(2,six_j3);
                    graph_six_j4.appendSample(3,six_j4);
                    graph_six_j5.appendSample(4,six_j5);
                    graph_six_j6.appendSample(5,six_j6);

                }
                six_x_context.text=data1;
                six_y_context.text=data2;
                six_z_context.text=data3;
                six_a1_context.text=data4;
                six_a2_context.text=data5;
                six_a3_context.text=data6;
                six_joint1_context.text=data7;
                six_joint2_context.text=data8;
                six_joint3_context.text=data9;
                six_joint4_context.text=data10;
                six_joint5_context.text=data11;
                six_joint6_context.text=data12;
            }
        }
        Timer {
            id: timer
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                demoMaker.send_six_graph();
                //console.log("send_main_context");
                }
            }

        Button{
            id:quit;
            text:"🔙";
            anchors.right : parent.right;
            anchors.rightMargin: 4;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 4;
            onClicked: {
                //Qt.quit();
                six_main.destroy();
                }
            }
        Rectangle{
            id:model_six_position;
            width: 300;
            height: 125;
            anchors.left: parent.left;
            anchors.leftMargin: 150;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 10;

            border.width: 1;
            border.color: "gray";//边框的一些属性
            color:"#edf0f0"
            radius: 2;//圆角

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                horizontalOffset: 1
                verticalOffset: 1
            }
            Text{
                text: qsTr("Six_Position");
                anchors.left:parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 5
                wrapMode: Text.WordWrap
                font.family: "Times"
                font.pixelSize: 20
            }

            Row{
                id: postion
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: 10;
                anchors.right: parent.right;
                anchors.rightMargin: 60;
                spacing: 70;
                Column{
                    width: 4;
                    spacing: 15;
                    RadioButton{
                        id: six_x_button;
                        text:"six_x";
                        checked:  true;
                        onClicked:{
                            if (graph_six_0.visible==true){
                                graph_six_0.visible=false;
                            }else{
                                graph_six_0.visible=true;
                            }
                        }

                    }
                    RadioButton{
                        id: six_y_button;
                        text:"six_y";
                        checked:  true;
                        onClicked: {
                            if (graph_six_1.visible==true){
                                graph_six_1.visible=false;
                            }else{
                                graph_six_1.visible=true;
                            }
                        }
                    }
                    RadioButton{
                        id: six_z_button;
                        text:"six_z";
                        checked:  true;
                        onClicked: {
                            if (graph_six_2.visible==true){
                                graph_six_2.visible=false;
                            }else{
                                graph_six_2.visible=true;
                            }
                        }
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        id: six_x_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: six_y_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: six_z_context;
                        text: qsTr("0")
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    RadioButton{
                        id: six_a1_button;
                        text:"six_a1";
                        checked:  true;
                        onClicked:{
                            if (graph_six_a1.visible==true){
                                graph_six_a1.visible=false;
                            }else{
                                graph_six_a1.visible=true;
                            }
                        }

                    }
                    RadioButton{
                        id: six_a2_button;
                        text:"six_a2";
                        checked:  true;
                        onClicked: {
                            if (graph_six_a2.visible==true){
                                graph_six_a2.visible=false;
                            }else{
                                graph_six_a2.visible=true;
                            }
                        }
                    }
                    RadioButton{
                        id: six_a3_button;
                        text:"six_a3";
                        checked:  true;
                        onClicked: {
                            if (graph_six_a3.visible==true){
                                graph_six_a3.visible=false;
                            }else{
                                graph_six_a3.visible=true;
                            }
                        }
                    }

                }
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        id: six_a1_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: six_a2_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: six_a3_context;
                        text: qsTr("0")
                    }
                }
            }
        }

        Rectangle{
            id:model_six_joint;
            width: 300;
            height: 125;
            anchors.left: model_six_position.right;
            //anchors.leftMargin: 30;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 10;

            border.width: 1;
            border.color: "gray";//边框的一些属性
            color:"#edf0f0"
            radius: 2;//圆角

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                horizontalOffset: 1
                verticalOffset: 1
            }
            Text{
                text: qsTr("Six_Joint");
                anchors.left:parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 5
                wrapMode: Text.WordWrap
                font.family: "Times"
                font.pixelSize: 20
            }

            Row{
                id: joint
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: 10;
                anchors.right: parent.right;
                anchors.rightMargin: 30;
                spacing: 80;
                Column{
                    width: 4;
                    spacing: 15;
                    RadioButton{
                        id: six_joint1_button;
                        text:"six_joint1";
                        //checked:  true;
                        onClicked:{
                            if (graph_six_j1.visible==true){
                                graph_six_j1.visible=false;
                            }else{
                                graph_six_j1.visible=true;
                            }
                        }

                    }
                    RadioButton{
                        id: six_joint2_button;
                        text:"six_joint2";
                        //checked:  true;
                        onClicked: {
                            if (graph_six_j2.visible==true){
                                graph_six_j2.visible=false;
                            }else{
                                graph_six_j2.visible=true;
                            }
                        }
                    }
                    RadioButton{
                        id: six_joint3_button;
                        text:"six_joint3";
                        //checked:  true;
                        onClicked: {
                            if (graph_six_j3.visible==true){
                                graph_six_j3.visible=false;
                            }else{
                                graph_six_j3.visible=true;
                            }
                        }
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        id: six_joint1_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: six_joint2_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: six_joint3_context;
                        text: qsTr("0")
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    RadioButton{
                        id: six_joint4_button;
                        text:"six_joint4";
                        //checked:  true;
                        onClicked:{
                            if (graph_six_j4.visible==true){
                                graph_six_j4.visible=false;
                            }else{
                                graph_six_j4.visible=true;
                            }
                        }

                    }
                    RadioButton{
                        id: six_joint5_button;
                        text:"six_joint5";
                        //checked:  true;
                        onClicked: {
                            if (graph_six_j5.visible==true){
                                graph_six_j5.visible=false;
                            }else{
                                graph_six_j5.visible=true;
                            }
                        }
                    }
                    RadioButton{
                        id: six_joint6_button;
                        text:"six_joint6";
                        //checked:  true;
                        onClicked: {
                            if (graph_six_j6.visible==true){
                                graph_six_j6.visible=false;
                            }else{
                                graph_six_j6.visible=true;
                            }
                        }
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        id: six_joint4_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: six_joint5_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: six_joint6_context;
                        text: qsTr("0")
                    }
                }
            }
        }
        Image {
            id: six_robot
            source: "qrc:/six.jpg";
            anchors.left: parent.left;
            anchors.leftMargin: 50;
            anchors.top: parent.top;
            anchors.topMargin: 10;
            width:  80;
            height: 80;
            fillMode: Image.PreserveAspectFit;
        }
        Button{
            anchors.top: six_robot.bottom;
            anchors.topMargin: 50;
            anchors.left: parent.left;
            anchors.leftMargin: 40;
            width: 100
            Text{
                text: "机械参数"
                color: "steelblue"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                font.family: "Times"
                font.pixelSize: 20
            }
            onClicked: {
                para_machine.open();
            }
        }
        Dialog {
            id:para_machine
            contentItem: Rectangle {
                color: "#edf0f0"
                implicitWidth: 400
                implicitHeight: 300
                border.width: 1;
                border.color: "gray";//边框的一些属性
                radius: 2;//圆角
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset: 1
                    verticalOffset: 1
                }
                Text{
                    text: qsTr("机械参数");
                    anchors.left:parent.left
                    anchors.leftMargin: 5
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    wrapMode: Text.WordWrap
                    font.family: "Times"
                    font.pixelSize: 20
                }

                Row{
                    anchors.top: parent.top;
                    anchors.topMargin: 50;
                    anchors.left: parent.left;
                    anchors.leftMargin: 50;
                    spacing: 200;
                    Column{
                        width: 4;
                        spacing: 15;
                        Text {
                            id: rTop_text;
                            text: qsTr("rTop(定平台半径)(mm):")
                        }
                        Text {
                            id: rBottom_text;
                            text: qsTr("rBottom(动平台半径)(mm):")
                        }
                        Text {
                            id: l1_text;
                            text: qsTr("l1(大臂半径)(mm):")
                        }
                        Text {
                            id: l2_text;
                            text: qsTr("l1(大臂半径)(mm):")
                        }
                    }
                    Column{
                        width: 4;
                        spacing: 15;
                        Rectangle{
                            color: "#edf0f0"
                            width: 70
                            height: 20
                            border.width: 2;
                            border.color: "gray";//边框的一些属性
                            radius: 2;//圆角
                            TextEdit { color: "steelblue";text:"200.0";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                        }
                        Rectangle{
                            color: "#edf0f0"
                            width: 70
                            height: 20
                            border.width: 2;
                            border.color: "gray";//边框的一些属性
                            radius: 2;//圆角
                            TextEdit { color: "steelblue";text:"31.1379";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                        }
                        Rectangle{
                            color: "#edf0f0"
                            width: 70
                            height: 20
                            border.width: 2;
                            border.color: "gray";//边框的一些属性
                            radius: 2;//圆角
                            TextEdit { color: "steelblue";text:"347.213";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                        }
                        Rectangle{
                            color: "#edf0f0"
                            width: 70
                            height: 20
                            border.width: 2;
                            border.color: "gray";//边框的一些属性
                            radius: 2;//圆角
                            TextEdit { color: "steelblue";text:"819.215";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                        }
                    }
                }
                Button{
                    text: "OK"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    onClicked: {
                        para_machine.close();
                    }
                }
            }
        }

        Item {
            visible: true;
            id: six
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: -90
            width: 800
            height: 400
            Graph {
                id: graph_six
                anchors.fill: parent
                anchors.margins: 100
            }

            Rectangle{
               width:600
               height:1
               anchors.top:graph_six.top
               anchors.topMargin: 5
               anchors.left: graph_six.left
               anchors.leftMargin: 0
               color:"red" //颜色
            }
            Rectangle{
               width:600
               height:1
               anchors.bottom: graph_six.bottom
               anchors.bottomMargin: 5
               anchors.left: graph_six.left
               anchors.leftMargin: 0
               color:"red" //颜色
            }
            Rectangle {
                anchors.fill: graph_six
                color: "transparent"
                border.color: "black"
                border.width: 2
            }
         }

        Item {
            visible: true;
            id: six_0
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: -90
            width: 800
            height: 400
            Graph {
                id: graph_six_0
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(0,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_1
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(1,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_2
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(2,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_a1
                //visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(3,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_a2
                //visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(4,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_a3
                anchors.fill: parent
                //visible: false
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(5,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
         }

        Item {
            visible: true;
            id: six_joint
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: -90
            width: 800
            height: 400
            Graph {
                id: graph_six_j1
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(0,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_j2
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(1,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_j3
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(2,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_j4
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(3,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_j5
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(4,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_six_j6
                anchors.fill: parent
                visible: false
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(5,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }
            }
         }




       }

}





