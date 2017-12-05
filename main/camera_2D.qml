import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0

Item {
    width: 850; height: 400;
    Rectangle{
        width: 300;
        height: 400;
        //color: "lightgray"
        anchors.right: parent.right;
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
        Row{
            anchors.top: parent.top;
            anchors.topMargin: 100;
            anchors.left: parent.left;
            anchors.leftMargin: 30;
            spacing: 130;
            Column{
                width: 4;
                spacing: 15;
                Text {
                    id: socket_states;
                    text: qsTr("socket_states:")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    font.family: "Times"
                    font.pixelSize: 20
                }
                Text {
                    id: camera_2D_ip;
                    text: qsTr("ip:")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    font.family: "Times"
                    font.pixelSize: 20
                }
                Text {
                    id: camera_2D_port;
                    text: qsTr("port:")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    font.family: "Times"
                    font.pixelSize: 20
                }
            }
            Column{
                width: 4;
                spacing: 15;
                Button{
                    style: button_off;
                }
                Text {
                    id: ip;
                    text: qsTr("168.254.1.100")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    font.family: "Times"
                    font.pixelSize: 20
                }
                Text {
                    id: port;
                    text: qsTr("8000")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    font.family: "Times"
                    font.pixelSize: 20
                }
            }
        }
    }

    Rectangle{
        id: camera_2D;
        width: 550; height: 400;
        anchors.left:parent.left
        anchors.leftMargin: 10
        //color: "lightgray"

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
                    spacing: 8;
                    Text {
                        id: coll;
                        text: number;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 80;

                    }
                    Text {

                        text: position_x;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 120;

                    }
                    Text {

                        text: position_y;
                        color: wrapper.ListView.isCurrentItem ? "green":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 120;

                    }
                    Text {

                        text: position_z;
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
                        text: "position_x";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 120;
                    }
                    Text {
                        text: "position_y";
                        font.bold: true;
                        font.pixelSize: 20;
                        Layout.preferredWidth: 120;
                    }
                    Text {

                        text: "position_z";
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
                    position_x:"2";
                    position_y:"100";
                    position_z:"-600";
                }
                ListElement{
                    number:"2";
                    position_x:"3";
                    position_y:"200";
                    position_z:"-600";
                }
                ListElement{
                    number:"3";
                    position_x:"121";
                    position_y:"200";
                    position_z:"-600";
                }
            }
            header: headerview;
            //footer: footerview;
            focus:true;
            highlight: Rectangle{
                color: "lightblue";
            }

        }

        Timer {
            id: timer
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                    //listView.add("4");
                    var x="12";
                    var y="100";
                    var z="-600";
                    point.append({"number":"4","position_x":x,"position_y":y,"position_z":z});
                    //console.log("newsample:",graph.newSample(++graph.offset));
            }

        }

    }
}
