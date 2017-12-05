import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQml 2.0
import QtQuick.Dialogs 1.2
import Graph 1.0
import QtQuick.Controls.Styles 1.3
//import QtQuick.Dialogs 1.1


Rectangle{
    id: rectangle;
    visible: false
    width: 850; height: 400;
    color: "#edf0f0";
    property var icon1: ["qrc:/home1.jpg","qrc:/robot1.jpg","qrc:/camera21.jpg","qrc:/camera31.jpg"]
    property var icon2: ["qrc:/home2.jpg","qrc:/robot2.jpg","qrc:/camera22.jpg","qrc:/camera32.jpg"]

    Dialog {
        id: login
        //width: 400
        //height: 420
        visible: true
        title: "Login..."
        Dialog {
            id:error_input

            contentItem: Rectangle {
                color: "lightskyblue"
                implicitWidth: 400
                implicitHeight: 100
                Text {
                    text: "user or password error!"
                    font.bold: true;
                    font.pixelSize: 18;
                    color: "navy"
                    anchors.centerIn: parent
                }
                Button{
                    text: "OK"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    onClicked: {
                        error_input.close();

                    }

                }
            }
        }

        contentItem:Rectangle {
//            width: 360
//            height: 360
            implicitWidth: 850
            implicitHeight: 400
            color: "lightblue"//"#6666FF"

            Loader{
                id:name
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -60
                sourceComponent: component
                onLoaded: {
                    //item.placeHoldText = "用户名"
                    item.source = "qrc:/user.jpg"
                    item.echomode = TextInput.Normal

                }
            }

            Loader{
                id:password
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 60
                sourceComponent: component

                onLoaded: {
                    //item.placeHoldText = "......"
                    item.source = "qrc:/password.jpg"
                    item.echomode = TextInput.Password

                }
            }
            Button{
                id:ok
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                anchors.right: parent.right
                anchors.rightMargin: 150
                text:"Login"

                onClicked: {
                    console.log("name: ",name.item.text);
                    console.log("password: ",password.item.text);
                    if(name.item.text == "robot" && password.item.text == "123"){
                        login.close();
                        rectangle.visible=true;
                    }else{
                        error_input.open();
                        name.item.text="";
                        password.item.text="";
                    }
                }
            }
            Button{
                id:qiut
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                anchors.right: parent.right
                anchors.rightMargin: 50
                text:"Quit"
                onClicked: {
                    Qt.quit();
                }
            }

            Component{
                id: component

                Item{
                    width: 300
                    height: 80

                    property alias text: input.text
                    property alias source: iconArea.source
                    property alias echomode: input.echoMode
                    property alias placeHoldText: placeHold.text

                    Rectangle{
                        anchors.fill: parent
                        radius: 6
                        opacity: 0.2
                    }

                    Image{ // you can change to Image
                        id: iconArea
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 9
                        width: 40
                        height: 40
                    }

                    TextInput{
                        id: input
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.left: iconArea.right
                        anchors.leftMargin: 6
                        anchors.right: parent.right
                        anchors.rightMargin: 9
                        horizontalAlignment: TextInput.AlignLeft
                        verticalAlignment: TextInput.AlignVCenter
                        font.pixelSize: 40
                        color: "white"
                        clip: true

                        Text {
                            id: placeHold
                            font: input.font
                            color: "white"
                            opacity: !input.activeFocus
                            Behavior on opacity{
                                NumberAnimation{ duration: 300 }
                            }
                            anchors.fill: parent
                            verticalAlignment: TextInput.AlignVCenter
                        }
                    }
                }
            }

      }
    }

    TabView {
        id: frame
        anchors.fill: parent
        anchors.margins: 4

        Tab { title: "Main"
            source: "main_context.qml"}
        Tab { title: "Robot"
            source: "robot.qml"}
        Tab { title: "Camera_2D"
            source: "camera_2D.qml"}
        Tab { title: "Camera_3D"
            source: "camera_3D.qml"}

        style: TabViewStyle {
            frameOverlap: 1

            tab: Item {
//                color: styleData.selected ? "steelblue" :"lightsteelblue"
//                border.color:  "steelblue"
                implicitWidth: Math.max(text.width + 8, 200)
                implicitHeight: 48
                Rectangle{
                    width: (styleData.index<control.count - 1)?(parent.width-2):parent.width;
                    height: parent.height-4;
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    visible: styleData.selected;
                    gradient: Gradient{
                        GradientStop{position: 0.0;color:"#606060";}
                        GradientStop{position: 0.5;color:"#a0a0a0";}
                        GradientStop{position: 1.0;color:"#c0c0c0";}

                    }
                }
                Rectangle{
                    width: 2;
                    height: parent.height-4;
                    anchors.top: parent.top;
                    anchors.right: parent.right;
                    visible: styleData.index<control.count-1;
                    gradient: Gradient{
                        GradientStop{position: 0.0;color:"#404040";}
                        GradientStop{position: 0.5;color:"#707070";}
                        GradientStop{position: 1.0;color:"#404040";}

                    }
                }
                RowLayout{
                    implicitWidth: Math.max(text.width,180);
                    height: 48;
                    anchors.centerIn: parent;
                    //z:1;
                    Image {
                        width: 50;
                        height: 50;
                        fillMode: Image.PreserveAspectFit
                        source: styleData.selected ? rectangle.icon2[styleData.index % 4 ]:rectangle.icon1[styleData.index % 4 ];
                    }
                    Text{
                        id:text;
                        text:styleData.title;
                        font.bold: true;
                        font.pixelSize: 18;
                        color:styleData.selected ? "lightgreen":(styleData.hovered ? "steelblue":"white");
                    }
                }

            }
            tabBar: Rectangle{
                height: 56;
                gradient: Gradient{
                    GradientStop{position: 0.0;color:"#484848";}
                    GradientStop{position: 0.5;color:"#787878";}
                    GradientStop{position: 1.0;color:"#a0a0a0";}
                }
                Rectangle{
                    width: parent.width;
                    height:4;
                    anchors.bottom: parent.bottom;
                    border.width: 2;
                    border.color: "#c7c7c7";
                }
            }
            }

        }

}
