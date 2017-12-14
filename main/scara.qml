
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
    id: scara_main
    visible: true

    Rectangle{
        id: opacitytest_scara;
        width: 850; height: 350;
        color: "#edf0f0";

        QmlTest {
            id: demoMaker;
        }
        Connections {
            target: demoMaker;
            onCurrentData_scara_graph:{
                if (quit.pressed==false){
                    graph_scara_0.removeFirstSample();
                    graph_scara_1.removeFirstSample();
                    graph_scara_2.removeFirstSample();
                    graph_scara_a1.removeFirstSample();
                    graph_scara_a2.removeFirstSample();
                    graph_scara_a3.removeFirstSample();
                    graph_scara_j1.removeFirstSample();
                    graph_scara_j2.removeFirstSample();
                    graph_scara_j3.removeFirstSample();
                    graph_scara_j4.removeFirstSample();

                    var scara_x=0.5-(data1/1000);
                    var scara_y=0.5-(data2/500);
                    var scara_z=-3-(data3/200);
                    var scara_a1=-0.3+(data4/100);
                    var scara_a2=-0.3+(data5/100);
                    var scara_a3=-0.3+(data6/100);
                    var scara_j1=-0.3+(data7/100);
                    var scara_j2=-0.3+(data8/100);
                    var scara_j3=-0.3+(data9/100);
                    var scara_j4=-0.3+(data10/100);

                    graph_scara_0.appendSample(0,scara_x);
                    graph_scara_1.appendSample(1,scara_y);
                    graph_scara_2.appendSample(2,scara_z);
                    graph_scara_a1.appendSample(3,scara_a1);
                    graph_scara_a2.appendSample(4,scara_a2);
                    graph_scara_a3.appendSample(5,scara_a3);
                    graph_scara_j1.appendSample(0,scara_j1);
                    graph_scara_j2.appendSample(1,scara_j2);
                    graph_scara_j3.appendSample(2,scara_j3);
                    graph_scara_j4.appendSample(3,scara_j4);

                }
                scara_x_context.text=data1;
                scara_y_context.text=data2;
                scara_z_context.text=data3;
                scara_a1_context.text=data4;
                scara_a2_context.text=data5;
                scara_a3_context.text=data6;
                scara_j1_context.text=data7;
                scara_j2_context.text=data8;
                scara_j3_context.text=data9;
                scara_j4_context.text=data10;

            }
        }
        Timer {
            id: timer
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                demoMaker.send_scara_graph();
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
                scara_main.destroy();
                }
            }
        Rectangle{
            id:model_scara_position;
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
                text: qsTr("Scara_Position");
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
                anchors.rightMargin: 40;
                spacing: 80;
                Column{
                    width: 4;
                    spacing: 15;
                    RadioButton{
                        id: scara_x_button;
                        text:"scara_x";
                        checked:  true;
                        onClicked:{
                            if (graph_scara_0.visible==true){
                                graph_scara_0.visible=false;
                            }else{
                                graph_scara_0.visible=true;
                            }
                        }

                    }
                    RadioButton{
                        id: scara_y_button;
                        text:"scara_y";
                        checked:  true;
                        onClicked: {
                            if (graph_scara_1.visible==true){
                                graph_scara_1.visible=false;
                            }else{
                                graph_scara_1.visible=true;
                            }
                        }
                    }
                    RadioButton{
                        id: scara_z_button;
                        text:"scara_z";
                        checked:  true;
                        onClicked: {
                            if (graph_scara_2.visible==true){
                                graph_scara_2.visible=false;
                            }else{
                                graph_scara_2.visible=true;
                            }
                        }
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        id: scara_x_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: scara_y_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: scara_z_context;
                        text: qsTr("0")
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    RadioButton{
                        id: scara_a1_button;
                        text:"scara_a1";
                        checked:  true;
                        onClicked:{
                            if (graph_scara_a1.visible==true){
                                graph_scara_a1.visible=false;
                            }else{
                                graph_scara_a1.visible=true;
                            }
                        }

                    }
                    RadioButton{
                        id: scara_a2_button;
                        text:"scara_a2";
                        checked:  true;
                        onClicked: {
                            if (graph_scara_a2.visible==true){
                                graph_scara_a2.visible=false;
                            }else{
                                graph_scara_a2.visible=true;
                            }
                        }
                    }
                    RadioButton{
                        id: scara_a3_button;
                        text:"scara_a3";
                        checked:  true;
                        onClicked: {
                            if (graph_scara_a3.visible==true){
                                graph_scara_a3.visible=false;
                            }else{
                                graph_scara_a3.visible=true;
                            }
                        }
                    }

                }
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        id: scara_a1_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: scara_a2_context;
                        text: qsTr("0")
                    }
                    Text {
                        id: scara_a3_context;
                        text: qsTr("0")
                    }
                }
            }
        }

        Rectangle{
            id:model_scara_joint;
            width: 300;
            height: 125;
            anchors.left: model_scara_position.right;
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
                text: qsTr("Scara_Joint");
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
//                anchors.right: parent.right;
//                anchors.rightMargin: 10;
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 80;
                Column{
                    width: 4;
                    spacing: 15;
                    RadioButton{
                        id: scara_joint1_button;
                        text:"scara_j1";
                        //checked:  true;
                        onClicked:{
                            if (graph_scara_j1.visible==true){
                                graph_scara_j1.visible=false;
                            }else{
                                graph_scara_j1.visible=true;
                            }
                        }

                    }
                    RadioButton{
                        id: scara_joint2_button;
                        text:"scara_j2";
                        //checked:  true;
                        onClicked: {
                            if (graph_scara_j2.visible==true){
                                graph_scara_j2.visible=false;
                            }else{
                                graph_scara_j2.visible=true;
                            }
                        }
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        width: 10;
                        id: scara_j1_context;
                        text: qsTr("0")
                    }
                    Text {
                        width: 10;
                        id: scara_j2_context;
                        text: qsTr("0")
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    RadioButton{
                        id: scara_joint3_button;
                        text:"scara_j3";
                        //checked:  true;
                        onClicked: {
                            if (graph_scara_j3.visible==true){
                                graph_scara_j3.visible=false;
                            }else{
                                graph_scara_j3.visible=true;
                            }
                        }
                    }
                    RadioButton{
                        id: scara_joint4_button;
                        text:"scara_j4";
                        //checked:  true;
                        onClicked:{
                            if (graph_scara_j4.visible==true){
                                graph_scara_j4.visible=false;
                            }else{
                                graph_scara_j4.visible=true;
                            }
                        }

                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        width: 10;
                        id: scara_j3_context;
                        text: qsTr("0")
                    }
                    Text {
                        width: 10;
                        id: scara_j4_context;
                        text: qsTr("0")
                    }
                }
            }
        }
        Image {
            id: scara_robot
            source: "qrc:/scara.jpg";
            anchors.left: parent.left;
            anchors.leftMargin: 50;
            anchors.top: parent.top;
            anchors.topMargin: 10;
            width:  80;
            height: 80;
            fillMode: Image.PreserveAspectFit;
        }
        Button{
            anchors.top: scara_robot.bottom;
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
            id: scara
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: -90
            width: 800
            height: 400
            Graph {
                id: graph_scara
                anchors.fill: parent
                anchors.margins: 100
            }

            Rectangle{
               width:600
               height:1
               anchors.top:graph_scara.top
               anchors.topMargin: 5
               anchors.left: graph_scara.left
               anchors.leftMargin: 0
               color:"red" //颜色
            }
            Rectangle{
               width:600
               height:1
               anchors.bottom: graph_scara.bottom
               anchors.bottomMargin: 5
               anchors.left: graph_scara.left
               anchors.leftMargin: 0
               color:"red" //颜色
            }
            Rectangle {
                anchors.fill: graph_scara
                color: "transparent"
                border.color: "black"
                border.width: 2
            }
         }

        Item {
            visible: true;
            id: scara_0
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: -90
            width: 800
            height: 400
            Graph {
                id: graph_scara_0
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(0,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_1
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(1,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_2
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(2,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_a1
                //visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(3,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_a2
                //visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(4,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_a3
                anchors.fill: parent
                //visible: false
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(5,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
         }

        Item {
            visible: true;
            id: scara_joint
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: -90
            width: 800
            height: 400
            Graph {
                id: graph_scara_j1
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(0,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_j2
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(1,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_j3
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(2,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_j4
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(3,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_j5
                visible: false
                anchors.fill: parent
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(4,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
            Graph {
                id: graph_scara_j6
                anchors.fill: parent
                visible: false
                anchors.margins: 100
                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(5,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("scara_newsample:",i," ",newSample(i));
                }
            }
         }




       }

}








