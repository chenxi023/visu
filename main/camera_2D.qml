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
        onCurrentData_camera_2D:{
            if (data8=="1"){
                point.append({"number":data1,"pos_x":data2,"pos_y":data3,"angle":data4,"dir":data5,"flag":data6});
            }else{
                //point.remove({"number":data1,"pos_x":data2,"pos_y":data3,"angle":data4,"dir":data5,"flag":data6});
                point.set(point.count-1,{"number":data1,"pos_x":data2,"pos_y":data3,"angle":data4,"dir":data5,"flag":data6});
            }

            if(data7=="0"){
                socket_states_image.icon="qrc:/light1.jpg";
            }else if(data7=="1"){
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
            demoMaker.send_camera_2D();
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
            width: 260;
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
                anchors.leftMargin: 50;
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
                        id: camera_2D_ip;
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
                        id: camera_2D_port;
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
                        TextEdit { color: "steelblue";text:"8000";
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
        id: camera_2D;
        width: 550; height: 330;
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
                        text: angle;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 70;
                    }
                    Text {
                        text: dir;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 70;
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
                        text: "angle";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 70;
                    }
                    Text {

                        text: "dir";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 70;
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

//        Component{
//            id: footerview;
//            Item{
//                id: footerRootItem;
//                width: parent.width;
//                height: 30;
//                property alias text: txt.text;
//                signal clean();
//                Text{
//                    id: txt;
//                    color: "lightblue";
//                    verticalAlignment: Text.AlignVCenter;
//                }
//                Button{
//                    x:10;
//                    y:10;
//                    text:"clear";
//                    onClicked: {
//                        //listView.model.clear;
//                        footerRootItem.clean();
//                    }
//                }
//            }
//        }

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
                    angle:"30";
                    dir:"up";
                    flag:"true"
                }
                ListElement{
                    number:"5";
                    pos_x:"20";
                    pos_y:"100";
                    angle:"40";
                    dir:"down";
                    flag:"false"
                }
                ListElement{
                    number:"3";
                    pos_x:"2";
                    pos_y:"100";
                    angle:"50";
                    dir:"up";
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
