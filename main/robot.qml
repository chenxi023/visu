import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQml 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0
import an.Qt.QmlTest 1.0

Item {
    id: robot;
//    Rectangle{
//        id: opacitytest;
//        width: 850; height: 350;
//        color: "#edf0f0";
        QmlTest {
            id: demoMaker;
        }
        Connections {
            target: demoMaker;
            onCurrentData_robot:{
                if(data1=="0"){
                    delta_power.icon="qrc:/light1.jpg";
                }else if(data1=="1"){
                    delta_power.icon="qrc:/light2.jpg";
                }
                delta_states.text = data2;
                delta_warning.text = data3;
                //console.log("data2:",data2,"data3:",data3);

                if(data4=="0"){
                    six_power.icon="qrc:/light1.jpg";
                }else if(data4=="1"){
                    six_power.icon="qrc:/light2.jpg";
                }
                six_states.text = data5;
                six_warning.text = data6;

                if(data7=="0"){
                    scara_power.icon="qrc:/light1.jpg";
                }else if(data7=="1"){
                    scara_power.icon="qrc:/light2.jpg";
                }
                scara_states.text = data8;
                scara_warning.text = data9;
            }
        }
        Timer {
            id: timer
            interval: 500
            repeat: true
            running: true
            onTriggered: {
                demoMaker.send_robot();
                //console.log("send_main_context");
                }
            }


//        Button{
//            id:quit;
//            text:"退出";
//            anchors.right : parent.right;
//            anchors.rightMargin: 4;
//            anchors.bottom: parent.bottom;
//            anchors.bottomMargin: 4;
//            onClicked: {
//                Qt.quit();
//                }
//            }

        Rectangle{
            id:model_delta;
            width: 270;
            height: 330;
            anchors.left: parent.left;
            anchors.leftMargin: 20;
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
                text: qsTr("Robot_Delta");
                anchors.left:parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 10
                wrapMode: Text.WordWrap
                font.family: "Times"
                font.pixelSize: 20
            }
            Button{
                anchors.left : model_delta.left;
                anchors.leftMargin: 90;
                anchors.top: model_delta.top;
                anchors.topMargin: 50;
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
            Row{
                anchors.top: parent.top;
                anchors.topMargin: 200;
                anchors.left: parent.left;
                anchors.leftMargin: 50;
                spacing: 80;
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        id: delta_power_text;
                        text: qsTr("delta_power:")
                    }
                    Text {
                        id: delta_states_text;
                        text: qsTr("delta_states:")
                    }
                    Text {
                        id: delta_warning_text;
                        text: qsTr("warining:")
                    }
                }
                Column{
                    width: 4;
                    spacing: 8;
                    Rectangle{
                        id: delta_power;
                        width: 25;
                        height: 25;
                        border.width: 0;
                        radius: 50;
                        property var icon: "qrc:/light1.jpg";
                        Image{
                            source: delta_power.icon;
                        }
                    }
                    Rectangle{
                        color: "#edf0f0"
                        width: 120
                        height: 20
                        border.width: 2;
                        border.color: "gray";//边框的一些属性
                        radius: 2;//圆角
                        TextEdit { id: delta_states;color: "steelblue";text:"192.168.1.102";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                    }
                    Rectangle{
                        color: "#edf0f0"
                        width: 120
                        height: 20
                        border.width: 2;
                        border.color: "gray";//边框的一些属性
                        radius: 2;//圆角
                        TextEdit { id: delta_warning;color: "steelblue";text:"192.168.1.102";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                    }
                }
            }


        }

        Rectangle{
            id:model_six;
            width: 270;
            height: 330;
            anchors.left: model_delta.right;
            //anchors.leftMargin: 20;
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
                text: qsTr("Robot_Six");
                anchors.left:parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 10
                wrapMode: Text.WordWrap
                font.family: "Times"
                font.pixelSize: 20
            }
            Button{
                anchors.left : model_six.left;
                anchors.leftMargin: 90;
                anchors.top: model_six.top;
                anchors.topMargin: 50;
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
            Row{
                anchors.top: parent.top;
                anchors.topMargin: 200;
                anchors.left: parent.left;
                anchors.leftMargin: 50;
                spacing: 80;
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        id: six_power_text;
                        text: qsTr("six_power:")
                    }
                    Text {
                        id: six_states_text;
                        text: qsTr("six_states:")
                    }
                    Text {
                        id: six_warning_text;
                        text: qsTr("warining:")
                    }
                }
                Column{
                    width: 4;
                    spacing: 8;
                    Rectangle{
                        id: six_power;
                        width: 25;
                        height: 25;
                        border.width: 0;
                        radius: 50;
                        property var icon: "qrc:/light1.jpg";
                        Image{
                            source: six_power.icon;
                        }
                    }
                    Rectangle{
                        color: "#edf0f0"
                        width: 120
                        height: 20
                        border.width: 2;
                        border.color: "gray";//边框的一些属性
                        radius: 2;//圆角
                        TextEdit { id: six_states;color: "steelblue";text:"192.168.1.102";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                    }
                    Rectangle{
                        color: "#edf0f0"
                        width: 120
                        height: 20
                        border.width: 2;
                        border.color: "gray";//边框的一些属性
                        radius: 2;//圆角
                        TextEdit { id: six_warning;color: "steelblue";text:"192.168.1.102";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                    }
                }
            }

        }


        Rectangle{
            id:model_scara;
            width: 270;
            height: 330;
            anchors.left: model_six.right;
            //anchors.leftMargin: 20;
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
                text: qsTr("Robot_Scara");
                anchors.left:parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 10
                wrapMode: Text.WordWrap
                font.family: "Times"
                font.pixelSize: 20
            }
            Button{
                anchors.left : model_scara.left;
                anchors.leftMargin: 90;
                anchors.top: model_scara.top;
                anchors.topMargin: 50;
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
            Row{
                anchors.top: parent.top;
                anchors.topMargin: 200;
                anchors.left: parent.left;
                anchors.leftMargin: 50;
                spacing: 80;
                Column{
                    width: 4;
                    spacing: 15;
                    Text {
                        id: scara_power_text;
                        text: qsTr("scara_power:")
                    }
                    Text {
                        id: scara_states_text;
                        text: qsTr("scara_states:")
                    }
                    Text {
                        id: scara_warning_text;
                        text: qsTr("warining:")
                    }
                }
                Column{
                    width: 4;
                    spacing: 8;
                    Rectangle{
                        id: scara_power;
                        width: 25;
                        height: 25;
                        border.width: 0;
                        radius: 50;
                        property var icon: "qrc:/light1.jpg";
                        Image{
                            source: scara_power.icon;
                        }
                    }
                    Rectangle{
                        color: "#edf0f0"
                        width: 120
                        height: 20
                        border.width: 2;
                        border.color: "gray";//边框的一些属性
                        radius: 2;//圆角
                        TextEdit { id: scara_states;color: "steelblue";text:"192.168.1.102";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                    }
                    Rectangle{
                        color: "#edf0f0"
                        width: 120
                        height: 20
                        border.width: 2;
                        border.color: "gray";//边框的一些属性
                        radius: 2;//圆角
                        TextEdit { id: scara_warning;color: "steelblue";text:"192.168.1.102";anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter}
                    }
//                    Text {
//                        id: scara_states;
//                        text: qsTr("scara_states:")
//                    }
//                    Text {
//                        id: scara_warning;
//                        text: qsTr("warining:")
//                    }
                }
            }
        }

//        }
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

}
