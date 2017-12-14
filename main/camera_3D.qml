//import QtQuick 2.0
//import QtQuick.Controls 1.2
//import QtQuick.Layouts 1.1

//Item {

//    Rectangle{
//        id: camera_3D;
//        width: 850; height: 400;
//        //color: "#edf0f0";

//        Component{
//            id:pointdelegate;
//            Item{
//                id: wrapper;
//                width: parent.width;
//                height: 30;
//                MouseArea{
//                    anchors.fill: parent;
//                    onClicked:{
//                        console.log("currentIndex:",index);
//                        console.log("currentIndex:",listView.currentIndex);
//                        listView.currentIndex = index;

//                    }

//                }
//                RowLayout{
//                    anchors.left: parent.left;
//                    anchors.verticalCenter: parent.verticalCenter;
//                    spacing: 8;
//                    Text {
//                        id: coll;
//                        text: number;
//                        color: wrapper.ListView.isCurrentItem ? "red":"black";
//                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
//                        Layout.preferredWidth: 80;
//                    }
//                    Text {
//                        text: position_x;
//                        color: wrapper.ListView.isCurrentItem ? "red":"black";
//                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
//                        Layout.preferredWidth: 120;

//                    }
//                    Text {
//                        text: position_y;
//                        color: wrapper.ListView.isCurrentItem ? "green":"black";
//                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
//                        Layout.preferredWidth: 120;

//                    }
//                    Text {
//                        text: position_z;
//                        color: wrapper.ListView.isCurrentItem ? "green":"black";
//                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
//                        Layout.fillWidth: true;
//                    }
//                }
//            }
//        }

//        Component{
//            id: headerview
//            Item {
//                id: wrapper;
//                width: parent.width;
//                height: 30;
//                signal clean();
//                Button{
//                    anchors.right: parent.right;
//                    anchors.rightMargin: 10;
//                    anchors.top: parent.top;
//                    anchors.topMargin: 5;
//                    text:"Clear";
//                    onClicked: {
//                        //listView.model.clear;
//                        wrapper.clean();
//                    }
//                }
//                RowLayout{
//                    anchors.left: parent.left;
//                    anchors.verticalCenter: parent.verticalCenter;
//                    spacing: 8;
//                    Text {
//                        text: "number";
//                        font.bold: true;
//                        font.pixelSize: 20;
//                        Layout.preferredWidth: 80;

//                    }
//                    Text {
//                        text: "position_x";
//                        font.bold: true;
//                        font.pixelSize: 20;
//                        Layout.preferredWidth: 120;
//                    }
//                    Text {
//                        text: "position_y";
//                        font.bold: true;
//                        font.pixelSize: 20;
//                        Layout.preferredWidth: 120;
//                    }
//                    Text {

//                        text: "position_z";
//                        font.bold: true;
//                        font.pixelSize: 20;
//                        Layout.fillWidth: true;
//                    }
//                }
//            }
//        }

//        Component.onCompleted: {
//            listView.headerItem.clean.connect(listView.model.clear);
//        }

//        ListView{
//            id: listView;
//            anchors.fill: parent;
//            delegate: pointdelegate;
//            //model: pointmodel.createObject(listView);
//            model:ListModel{
//                id:point;
//                ListElement{
//                    number:"5";
//                    position_x:"2";
//                    position_y:"100";
//                    position_z:"-600";
//                }
//                ListElement{
//                    number:"2";
//                    position_x:"3";
//                    position_y:"200";
//                    position_z:"-600";
//                }
//                ListElement{
//                    number:"3";
//                    position_x:"121";
//                    position_y:"200";
//                    position_z:"-600";
//                }
//            }
//            header: headerview;
//            //footer: footerview;
//            focus:true;
//            highlight: Rectangle{
//                color: "lightblue";
//            }

//        }

//        Timer {
//            id: timer
//            interval: 500
//            repeat: true
//            running: true
//            onTriggered: {
//                    //listView.add("4");
//                    var x="12";
//                    var y="100";
//                    var z="-600";
//                    point.append({"number":"4","position_x":x,"position_y":y,"position_z":z});
//                    //console.log("newsample:",graph.newSample(++graph.offset));
//            }

//        }

//    }
//}


import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0
import an.Qt.QmlTest 1.0

Item {
//    width: 850; height: 400;
//    color: "#edf0f0";
//    Rectangle{
//        width: 300;
//        height: 400;
//        color: "lightgray"
//        anchors.right: parent.right;
    QmlTest {
        id: demoMaker;
    }
    Connections {
        target: demoMaker;
        onCurrentData_camera_3D:{
            if (data10=="1"){
                point.append({"number":data1,"pos_x":data2,"pos_y":data3,"pos_z":data4,"a1":data5,"a2":data6,"a3":data7,"flag":data8});
            }else{
                //point.remove({"number":data1,"pos_x":data2,"pos_y":data3,"pos_z":data4,"a1":data5,"a2":data6,"a3":data7,"flag":data8});
                point.set(point.count-1,{"number":data1,"pos_x":data2,"pos_y":data3,"pos_z":data4,"a1":data5,"a2":data6,"a3":data7,"flag":data8});
            }

            if(data9=="0"){
                socket_states_image.icon="qrc:/light1.jpg";
            }else if(data9=="1"){
                socket_states_image.icon="qrc:/light2.jpg";
            }
        }
    }
    Timer {
        id: timer
        interval: 500
        repeat: true
        running: true
        onTriggered: {
            demoMaker.send_camera_3D();
            //console.log("send_main_context");
            }
        }

        Component{
            id:button_off
            ButtonStyle {
                background: Rectangle {
                    implicitWidth: 25
                    implicitHeight: 25
                    radius: 50
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "white" }
                            GradientStop { position: 0.5; color: "gray" }
                        }
                    }
                }
            }
        }
        Component{
            id:button_on
            ButtonStyle {
                background: Rectangle {
                    implicitWidth: 25
                    implicitHeight: 25
                    radius: 50
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "white" }
                            GradientStop { position: 0.5; color: "green" }
                        }
                    }
                }
            }
        }

        Rectangle{
            id:model_socket;
            width: 210;
            height: 330;
            anchors.right: parent.right;
            anchors.rightMargin: 20;
            anchors.top:parent.top;
            anchors.topMargin: 10;

            border.width: 1;
            border.color: "gray";//边框的一些属性
            color:"lightgray"
            radius: 2;//圆角

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                horizontalOffset: 1
                verticalOffset: 1
            }
            Text{
                text: qsTr("Socket_Setting");
                anchors.left:parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 10
                wrapMode: Text.WordWrap
                font.family: "Times"
                font.pixelSize: 20
                font.bold: true
            }
            Row{
                anchors.top: model_socket.top;
                anchors.topMargin: 80;
                anchors.left: model_socket.left;
                anchors.leftMargin: 30;
                spacing: 130;
                Column{
                    width: 4;
                    spacing: 20;
                    Text {
                        id: socket_states;
                        text: qsTr("Socket_States:")
                        width: parent.width
                        wrapMode: Text.WordWrap
                        font.family: "Times"
                        font.pixelSize: 20
                    }
                    Text {
                        id: camera_3D_ip;
                        text: qsTr("IP:")
                        width: parent.width
                        wrapMode: Text.WordWrap
                        font.family: "Times"
                        font.pixelSize: 20
                    }
                    Rectangle{
                        color: "#edf0f0"
                        width: 150
                        height: 30
                        border.width: 2;
                        border.color: "gray";//边框的一些属性
                        radius: 2;//圆角
                        TextEdit { color: "steelblue";text:"168.254.1.100";
                            anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter
                            font.family: "Times"
                            font.pixelSize: 20
                        }
                    }
                    Text {
                        id: camera_3D_port;
                        text: qsTr("Port:")
                        width: parent.width
                        wrapMode: Text.WordWrap
                        font.family: "Times"
                        font.pixelSize: 20
                    }
                    Rectangle{
                        color: "#edf0f0"
                        width: 120
                        height: 30
                        border.width: 2;
                        border.color: "gray";//边框的一些属性
                        radius: 2;//圆角
                        TextEdit { color: "steelblue";text:"8001";
                            anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter
                            font.family: "Times"
                            font.pixelSize: 20
                        }
                    }
                }
                Column{
                    width: 4;
                    spacing: 15;
                    Rectangle{
                        id: socket_states_image;
                        width: 25;
                        height: 25;
                        border.width: 0;
                        radius: 50;
                        property var icon: "qrc:/light1.jpg";
                        Image{
                            source: socket_states_image.icon;
                        }
                    }
                }
            }
        }

    Rectangle{
        id: camera_3D;
        width: 600; height: 330;
        anchors.left:parent.left
        anchors.leftMargin: 10
        anchors.top:parent.top;
        anchors.topMargin: 10;

        border.width: 1;
        border.color: "gray";//边框的一些属性
        color:"lightgray"
        radius: 2;//圆角

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1
            verticalOffset: 1
        }

        Component{
            id:pointdelegate;
            Item{
                id: wrapper;
                width: parent.width;
                height: 30;
                MouseArea{
                    anchors.fill: parent;
                    onClicked:{
                        console.log("currentIndex:",index);
                        console.log("currentIndex:",listView.currentIndex);
                        listView.currentIndex = index;

                    }

                }
                RowLayout{
                    anchors.left: parent.left;
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    spacing: 8;
                    Text {
                        id: coll;
                        text: number;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 80;
                    }
                    Text {
                        text: pos_x;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 70;
                    }
                    Text {
                        text: pos_y;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 70;
                    }
                    Text {
                        text: pos_z;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 70;
                    }
                    Text {
                        text: a1;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 40;
                    }
                    Text {
                        text: a2;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 40;
                    }
                    Text {
                        text: a3;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 40;
                    }
                    Text {
                        text: flag;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.fillWidth: true;
                    }
                }
            }
        }

        Component{
            id: headerview
            Item {
                id: wrapper;
                width: parent.width;
                height: 30;
                signal clean();
                Button{
                    anchors.right: parent.right;
                    anchors.rightMargin: 10;
                    anchors.top: parent.top;
                    anchors.topMargin: 5;
                    text:"Clear";
                    onClicked: {
                        //listView.model.clear;
                        wrapper.clean();
                    }
                }
                RowLayout{
                    anchors.left: parent.left;
                    anchors.verticalCenter: parent.verticalCenter;
                    spacing: 8;
                    Text {
                        text: "number";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 80;

                    }
                    Text {
                        text: "pos_x";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 70;
                    }
                    Text {
                        text: "pos_y";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 70;
                    }
                    Text {
                        text: "pos_z";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 70;
                    }
                    Text {
                        text: "a1";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 40;
                    }
                    Text {
                        text: "a2";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 40;
                    }
                    Text {
                        text: "a3";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 40;
                    }
                    Text {
                        text: "flag";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.fillWidth: true;
                    }
                }
            }
        }

        Component.onCompleted: {
            listView.headerItem.clean.connect(listView.model.clear);
        }

        ListView{
            id: listView;
            anchors.fill: parent;
            delegate: pointdelegate;
            //model: pointmodel.createObject(listView);
            model:ListModel{
                id:point;
                ListElement{
                    number:"5";
                    pos_x:"30";
                    pos_y:"100";
                    pos_z:"500";
                    a1:"30";
                    a2:"60";
                    a3:"80";
                    flag:"true"
                }
                ListElement{
                    number:"5";
                    pos_x:"20";
                    pos_y:"100";
                    pos_z:"500";
                    a1:"30";
                    a2:"60";
                    a3:"80";
                    flag:"false"
                }
                ListElement{
                    number:"3";
                    pos_x:"2";
                    pos_y:"100";
                    pos_z:"500";
                    a1:"30";
                    a2:"60";
                    a3:"80";
                    flag:"false"
                }
            }
            header: headerview;
            //footer: footerview;
            focus:true;
            highlight: Rectangle{
                color: "lightblue";
            }
        }
    }
}
