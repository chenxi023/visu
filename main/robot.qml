import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQml 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0

Item {
    id: robot;
    Rectangle{
        id: opacitytest;
        width: 850; height: 350;
        //color: "#edf0f0";
        Button{
            id:quit;
            text:"退出";
            anchors.right : parent.right;
            anchors.rightMargin: 4;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 4;
            onClicked: {
                Qt.quit();
                }
            }

        Button{
            anchors.left : parent.left;
            anchors.leftMargin: 110;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 200;
            width:  100;
            height: 100;
            //iconSource:{ source:"qrc:/delta.jpg"}

            Image {
                id: delta_robot
                source: "qrc:/delta.jpg";
                width:  90;
                height: 90;
                anchors.centerIn: parent;
                fillMode: Image.PreserveAspectFit;
                }

            function showdelta(){
                var component = Qt.createComponent("delta.qml");
                if (component.status == Component.Ready) {
                    var bQml = component.createObject(robot);
                    console.log("coponent ready");
                }
             }
            onClicked: {
                //robot.visible = false;
                 showdelta();
                 console.log("delta clicked")
                }
            }

        Button{
            anchors.left : parent.left;
            anchors.leftMargin: 320;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 200;
            width:  100;
            height: 100;

            Image {
                id: six_robot
                source: "qrc:/six.jpg";
                width:  90;
                height: 90;
                anchors.centerIn: parent;
                fillMode: Image.PreserveAspectFit;
                }

            function showsix(){
                var component = Qt.createComponent("six.qml");
                if (component.status == Component.Ready) {
                    var bQml = component.createObject(robot);
                    console.log("coponent ready");
                }
             }
            onClicked: {
                 //robot.visible = false;
                 showsix();
                 console.log("six clicked")
                }
            }

        Button{
            anchors.left : parent.left;
            anchors.leftMargin: 530;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 200;
            width:  100;
            height: 100;

            Image {
                id: scara_robot
                source: "qrc:/scara.jpg";
                width:  90;
                height: 90;
                anchors.centerIn: parent;
                fillMode: Image.PreserveAspectFit;
                }

            function showscara(){
                var component = Qt.createComponent("scara.qml");
                if (component.status == Component.Ready) {
                    var bQml = component.createObject(robot);
                    console.log("coponent ready");
                }
             }
            onClicked: {
                 //robot.visible = false;
                 showscara();
                 console.log("scara clicked")
                }
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
    Row{
        anchors.top: parent.top;
        anchors.topMargin: 200;
        anchors.left: parent.left;
        anchors.leftMargin: 100;
        spacing: 100;
        Column{
            width: 4;
            spacing: 15;
            Text {
                id: delta_power;
                text: qsTr("delta_power:")
            }
            Text {
                id: delta_states;
                text: qsTr("delta_states:")
            }
            Text {
                id: delta_warning;
                text: qsTr("warining:")
            }
        }
        Column{
            width: 4;
            spacing: 4;
            Button{
                style: button_off;
            }
        }
    }

    Row{
        anchors.top: parent.top;
        anchors.topMargin: 200;
        anchors.left: parent.left;
        anchors.leftMargin: 310;
        spacing: 100;
        Column{
            width: 4;
            spacing: 15;
            Text {
                id: six_power;
                text: qsTr("six_power:")
            }
            Text {
                id: six_states;
                text: qsTr("six_states:")
            }
            Text {
                id: six_warning;
                text: qsTr("warining:")
            }
        }
        Column{
            width: 4;
            spacing: 4;
            Button{
                style: button_off;
            }
        }
    }

    Row{
        anchors.top: parent.top;
        anchors.topMargin: 200;
        anchors.left: parent.left;
        anchors.leftMargin: 520;
        spacing: 100;
        Column{
            width: 4;
            spacing: 15;
            Text {
                id: scara_power;
                text: qsTr("scara_power:")
            }
            Text {
                id: scara_states;
                text: qsTr("scara_states:")
            }
            Text {
                id: scara_warning;
                text: qsTr("warining:")
            }
        }
        Column{
            width: 4;
            spacing: 4;
            Button{
                style: button_off;
            }
        }
    }

}
