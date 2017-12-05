import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQml 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0

Item {

    Rectangle{
        width: 850;
        height: 400;
        anchors.fill: parent;

        Component{
            id: btnstyle;
            ButtonStyle{
                background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 25
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                }

        Row{
            anchors.top: parent.top;
            anchors.topMargin: 80;
            anchors.right: parent.right;
            anchors.rightMargin: 100;
            spacing: 4;
            Column{
                width: 4;
                spacing: 4;

                Button{
                    id:start;
                    //text:"Start";
                    Text{
                        text: "Start"
                        color: "green"
                        anchors.left:parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width
                        wrapMode: Text.WordWrap
                        font.family: "Times"
                        font.pixelSize: 20
                    }
                    //iconSource: { source:"qrc:/start.jpg"}
                    //style: btnstyle;
                    }
                Button{
                    id:stop;
                    //text:"Stop";
                    Text{
                        text: "Stop"
                        color: "red"
                        anchors.left:parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width
                        wrapMode: Text.WordWrap
                        font.family: "Times"
                        font.pixelSize: 20
                    }
                    //style: btnstyle
                    }

                Button{
                    id:quit;
                    //text:"Quit";
                    Text{
                        text: "Quit"
                        color: "blue"
                        anchors.left:parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width
                        wrapMode: Text.WordWrap
                        font.family: "Times"
                        font.pixelSize: 20
                    }
                    onClicked: {
                        Qt.quit();
                        }
                    }
           }
        }
        Row{
            anchors.top: parent.top;
            anchors.topMargin: 80;
            anchors.right: parent.right;
            anchors.rightMargin: 400;
            spacing: 4;
            Column{
                width: 4;
                spacing: 15;
                Text {
                    id: warning_text;
                    text: qsTr("warning:")
                }
                Text {
                    id: states_text;
                    text: qsTr("states:")
                }
                Text {
                    id: poweron;
                    text: qsTr("poweron");
                }
            }
        }
        Row{
            anchors.top: parent.top;
            anchors.topMargin: 80;
            anchors.right: parent.right;
            anchors.rightMargin: 300;
            spacing: 4;
            Column{
                width: 4;
                spacing: 10;
                Text {
                    id: warning;
                    text: qsTr("warning:")
                }
                Text {
                    id: states;
                    text: qsTr("states:")
                }

                Rectangle{
                    id: poweronstate;
                    width: 25;
                    height: 25;
                    border.width: 0;
                    radius: 50;
                    property var icon: ["qrc:/light1.jpg","qrc:/light2.jpg"]
                    Image{
                        id:power
                        source: poweronstate.icon[1];
                    }
                }
            }
        }
        Component{
            id:enable_botton
            ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 12
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: "white" }
                        GradientStop { position: 0.5 ; color: control.pressed ? "lightgreen" : "lightgray" }
                    }
                }
            }
        }
        Component{
            id:enable_botton_on
            ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 12
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: "white" }
                        GradientStop { position: 0.5 ; color: "lightgreen" }
                    }
                }
            }
        }
        Row{
            anchors.top: parent.top;
            anchors.topMargin: 200;
            anchors.right: parent.right;
            anchors.rightMargin: 300;
            spacing: 4;
            Column{
                width: 4;
                spacing: 10;
                Button{
                    id:delta_enable;
                    text:"delta_enable";
                    style: enable_botton;
                    onClicked: {
                        if (delta_enable.style==enable_botton){
                            delta_enable.style=enable_botton_on;
                        }else{
                            delta_enable.style=enable_botton;
                        }
                    }
                    }
                Button{
                    id:six_enable;
                    text:"six_enable";
                    style: enable_botton;
                    onClicked: {
                        if (six_enable.style==enable_botton){
                            six_enable.style=enable_botton_on;
                        }else{
                            six_enable.style=enable_botton;
                        }
                    }
                    }
                Button{
                    id:scara_enable;
                    text:"scara_enable";
                    style: enable_botton;
                    onClicked: {
                        if (scara_enable.style==enable_botton){
                            scara_enable.style=enable_botton_on;
                        }else{
                            scara_enable.style=enable_botton;
                        }
                    }
                    }

            }
        }


        Component{
            id: slidtyle
            SliderStyle
                        {
                            handle: Rectangle
                            {
                                anchors.centerIn: parent;
                                color:control.pressed ? "white":"lightgray";
                                border.color: "gray";
                                border.width: 2;
                                width: 34;
                                height: 34;
                                radius: 12;
                                Text{
                                    anchors.centerIn: parent;
                                    text: control.value;
                                    color: "red";
                                }
                            }
                            groove:Rectangle
                            {
                                implicitHeight:8
                                color:"lightblue"
                                radius:8
                            }
                        }

        }

        Row{
            anchors.top: parent.top;
            anchors.topMargin: 80;
            anchors.left: parent.left;
            anchors.leftMargin: 30;
            spacing: 4;
            Column{
                width: 4;
                spacing: 4;
                Text {
                    id: belt_1_vel
                    text: qsTr("belt_1_vel")
                }
                Slider
                {
                    id: belt_1_siler;
                    width: 150;
                    height: 30;
                    maximumValue: 5.0;
                    minimumValue: 0;
                    stepSize: 1.0;
                    value: 2;
                    onValueChanged:
                    {
                        console.log(value)
                    }
                    style: slidtyle;
                }
                Text {
                    id: belt_2_vel
                    text: qsTr("belt_1_vel")
                }
                Slider
                {
                    id: belt_2_siler;
                    width: 150;
                    height: 30;
                    maximumValue: 5.0;
                    minimumValue: 0;
                    stepSize: 1.0;
                    value: 2;
                    onValueChanged:
                    {
                        console.log(value)
                    }
                    style: slidtyle;
                }
            }
        }
        Row{
             anchors.top: parent.top;
             anchors.topMargin: 80;
             anchors.left: parent.left;
             anchors.leftMargin: 200;
             spacing: 4;
             Column{
                 width: 4;
                 spacing: 4;
                 Text {
                     id: delta_vel
                     text: qsTr("delta_vel")
                 }
                 Slider
                 {
                     id: delta_siler;
                     width: 150;
                     height: 30;
                     maximumValue: 1;
                     minimumValue: 0;
                     stepSize: 0.1;
                     value: 0.2;
                     tickmarksEnabled: true;
                     onValueChanged:
                     {
                         console.log(value)
                     }
                 }
                 Text {
                     id: six_vel
                     text: qsTr("six_vel")
                 }
                 Slider
                 {
                     id: six_siler;
                     width: 150;
                     height: 30;
                     maximumValue: 1;
                     minimumValue: 0;
                     stepSize: 0.1;
                     value: 0.2;
                     tickmarksEnabled: true;
                     onValueChanged:
                     {
                         console.log(value)
                     }
                 }
                 Text {
                     id: scara_vel
                     text: qsTr("scara_vel")
                 }
                 Slider
                 {
                     id: scara_siler;
                     width: 150;
                     height: 30;
                     maximumValue: 1;
                     minimumValue: 0;
                     stepSize: 0.1;
                     value: 0.2;
                     tickmarksEnabled: true;
                     onValueChanged:
                     {
                         console.log(value)
                     }
                 }
                }
            }


    }
}
