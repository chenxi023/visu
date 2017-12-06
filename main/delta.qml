import QtQuick 2.0
import QtQml 2.0
import Graph 1.0
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import an.Qt.QmlTest 1.0

Item{
    id: delta_main
    visible: true

    Rectangle{
        id: opacitytest_delta;
        width: 850; height: 350;
        color: "#edf0f0";

        QmlTest {
            id: demoMaker;
        }
        Connections {
            target: demoMaker;
            onCurrentData_delta_graph:{
                if (quit.pressed==false){
                    graph_delta_0.removeFirstSample();
                    graph_delta_1.removeFirstSample();
                    graph_delta_2.removeFirstSample();
                    var delta_x=0.5-(data1/1000);
                    var delta_y=0.5-(data2/500);
                    var delta_z=-3-(data3/200);
                    graph_delta_0.appendSample(0,delta_x);
                    graph_delta_1.appendSample(1,delta_y);
                    graph_delta_2.appendSample(2,delta_z);
                }
                delta_x_context.text=data1;
                delta_y_context.text=data2;
                delta_z_context.text=data3;
            }
        }
        Timer {
            id: timer
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                demoMaker.send_delta_graph();
                //console.log("send_main_context");
                }
            }

        Button{
            id:quit;
            text:"退出";
            anchors.right : parent.right;
            anchors.rightMargin: 4;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 4;
            onClicked: {
                //Qt.quit();
                delta_main.destroy();
                }
            }

        Row{
            anchors.top: parent.top;
            anchors.topMargin: 10;
            anchors.right: parent.right;
            anchors.rightMargin: 70;
            spacing: 100;
            Column{
                width: 4;
                spacing: 15;
                RadioButton{
                    id: delta_x_button;
                    text:"delta_x";
                    checked:  true;
                    onClicked:{
                        if (graph_delta_0.visible==true){
                            graph_delta_0.visible=false;
                        }else{
                            graph_delta_0.visible=true;
                        }
                    }

                }
                RadioButton{
                    id: delta_y_button;
                    text:"delta_y";
                    checked:  true;
                    onClicked: {
                        if (graph_delta_1.visible==true){
                            graph_delta_1.visible=false;
                        }else{
                            graph_delta_1.visible=true;
                        }
                    }
                }
                RadioButton{
                    id: delta_z_button;
                    text:"delta_z";
                    checked:  true;
                    onClicked: {
                        if (graph_delta_2.visible==true){
                            graph_delta_2.visible=false;
                        }else{
                            graph_delta_2.visible=true;
                        }
                    }
                }
            }
            Column{
                width: 4;
                spacing: 15;
                Text {
                    id: delta_x_context;
                    text: qsTr("0")
                }
                Text {
                    id: delta_y_context;
                    text: qsTr("0")
                }
                Text {
                    id: delta_z_context;
                    text: qsTr("0")
                }
            }
        }


        Image {
            id: delta_robot
            source: "qrc:/delta.jpg";
            anchors.left: parent.left;
            anchors.leftMargin: 50;
            anchors.top: parent.top;
            anchors.topMargin: 10;
            width:  80;
            height: 80;
            fillMode: Image.PreserveAspectFit;
        }

        Item {
            visible: true;
            id: delta
            anchors.left: parent.left
            anchors.leftMargin: -50
            width: 800
            height: 400
            Graph {
                id: graph_delta
                anchors.fill: parent
                anchors.margins: 100
            }

            Rectangle{
               width:600
               height:1
               anchors.top:graph_delta.top
               anchors.topMargin: 5
               anchors.left: graph_delta.left
               anchors.leftMargin: 0
               color:"red" //颜色
            }
            Rectangle{
               width:600
               height:1
               anchors.bottom: graph_delta.bottom
               anchors.bottomMargin: 5
               anchors.left: graph_delta.left
               anchors.leftMargin: 0
               color:"red" //颜色
            }
            Rectangle {
                anchors.fill: graph_delta
                color: "transparent"
                border.color: "black"
                border.width: 2
            }
         }

        Item {
            visible: true;
            id: delta_0
            anchors.left: parent.left
            anchors.leftMargin: -50
            width: 800
            height: 400
            Graph {
                id: graph_delta_0
                anchors.fill: parent
                anchors.margins: 100

                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(0,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("delta_newsample:",i," ",newSample(i));
                }
            }
         }

        Item {
            visible: true;
            id: delta_1
            anchors.left: parent.left
            anchors.leftMargin: -50
            width: 800
            height: 400

            Graph {
                id: graph_delta_1
                anchors.fill: parent
                anchors.margins: 100

                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(1,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("delta_newsample:",i," ",newSample(i));
                }
            }
         }
        Item {
            visible: true;
            id: delta_2
            anchors.left: parent.left
            anchors.leftMargin: -50
            width: 800
            height: 400

            Graph {
                id: graph_delta_2
                anchors.fill: parent
                anchors.margins: 100

                Component.onCompleted: {
                    for (var i=0; i<2; ++i)
                        appendSample(2,0.45);//初始化的时候屏幕上的初始点appendsample
                        //console.log("delta_newsample:",i," ",newSample(i));
                }
            }
         }


       }

}


