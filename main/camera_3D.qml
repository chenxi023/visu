import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Item {

    Rectangle{
        id: camera_3D;
        width: 850; height: 400;
        //color: "#edf0f0";

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
                        color: wrapper.ListView.isCurrentItem ? "red":"black";
                        font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                        Layout.preferredWidth: 80;
                    }
                    Text {
                        text: position_x;
                        color: wrapper.ListView.isCurrentItem ? "red":"black";
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
            interval: 500
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
