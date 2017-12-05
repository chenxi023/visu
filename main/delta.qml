import QtQuick 2.0
import QtQml 2.0
import Graph 1.0
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

Item{
    id: delta_main
    visible: true

    Rectangle{
        id: opacitytest_delta;
        width: 850; height: 350;
        color: "#edf0f0";

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
        RadioButton{
            id: delta_x_button;
            text:"delta_x";
            anchors.right: parent.right;
            anchors.rightMargin: 10;
            anchors.top: parent.top;
            anchors.topMargin: 5;
            onClicked:{
                if (delta_0.visible==true){
                    delta_0.visible=false;
                }else{
                    delta_0.visible=true;
                }
            }

        }
        RadioButton{
            id: delta_y_button;
            text:"delta_y";
            anchors.right: parent.right;
            anchors.rightMargin: 10;
            anchors.top: parent.top;
            anchors.topMargin: 50;
            onClicked: {
                if (delta_1.visible==true){
                    delta_1.visible=false;
                }else{
                    delta_1.visible=true;
                }
            }
        }
        RadioButton{
            id: delta_z_button;
            text:"delta_z";
            anchors.right: parent.right;
            anchors.rightMargin: 10;
            anchors.top: parent.top;
            anchors.topMargin: 100;
            onClicked: {
                if (delta_2.visible==true){
                    delta_2.visible=false;
                }else{
                    delta_2.visible=true;
                }
            }
        }

        Image {
            id: delta_robot
            source: "qrc:/delta.jpg";
            anchors.right : parent.right;
            anchors.rightMargin: 10;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 100;
            width:  100;
            height: 100;
            fillMode: Image.PreserveAspectFit;
        }

        Item {
            visible: false;
            id: delta_0
            width: 800
            height: 400

            Graph {
                id: graph_delta_0
                anchors.fill: parent
                anchors.margins: 100

                function newSample(i) {
                    return (Math.sin(i / 100.0 * Math.PI * 2) + 1) * 0.4 ;//+ Math.random() * 0.05;
                    //return i*0.1;
                }

                Component.onCompleted: {
                    for (var i=0; i<100; ++i)
                        appendSample(0,newSample(i));//初始化的时候屏幕上的初始点appendsample
                        console.log("delta_newsample:",i," ",newSample(i));
                }

                property int offset: 100;
            }

            Timer {
                id: timer_delta
                interval: 500
                repeat: true
                running: true
                onTriggered: {
                    if (quit.pressed==false){
                        graph_delta_0.removeFirstSample();
                        graph_delta_0.appendSample(0,graph_delta_0.newSample(++graph_delta_0.offset));
                        //console.log("delta_newsample:",graph_delta_0.newSample(++graph_delta_0.offset));
                    }
                }

            }
            Rectangle{
               width:600
               height:1
               anchors.top:graph_delta_0.top
               anchors.topMargin: 50
               anchors.left: graph_delta_0.left
               anchors.leftMargin: 0
               color:"red" //颜色
               //rotation:45 //顺时针旋转的角度
            }
            Rectangle {
                anchors.fill: graph_delta_0
                color: "transparent"
                border.color: "black"
                border.width: 2
            }
         }

        Item {
            visible: false;
            id: delta_1
            width: 800
            height: 400

            Graph {
                id: graph_delta_1
                anchors.fill: parent
                anchors.margins: 100

                function newSample(i) {
                    return 0.5*(Math.sin(i / 100.0 * Math.PI * 2) + 1) * 0.4 ;//+ Math.random() * 0.05;
                    //return i*0.1;
                }

                Component.onCompleted: {
                    for (var i=0; i<100; ++i)
                        appendSample(1,newSample(i));//初始化的时候屏幕上的初始点appendsample
                        console.log("delta_newsample:",i," ",newSample(i));
                }

                property int offset: 100;
            }

            Timer {
                id: timer_delta_1
                interval: 500
                repeat: true
                running: true
                onTriggered: {
                    if (quit.pressed==false){
                        graph_delta_1.removeFirstSample();
                        graph_delta_1.appendSample(1,graph_delta_1.newSample(++graph_delta_1.offset));
                        //console.log("delta_newsample:",graph_delta.newSample(++graph_delta_1.offset));
                    }
                }

            }
            Rectangle{
               width:600
               height:1
               anchors.top:graph_delta_1.top
               anchors.topMargin: 50
               anchors.left: graph_delta_1.left
               anchors.leftMargin: 0
               color:"red" //颜色
               //rotation:45 //顺时针旋转的角度
            }
            Rectangle {
                anchors.fill: graph_delta_1
                color: "transparent"
                border.color: "black"
                border.width: 2
            }
         }
        Item {
            visible: false;
            id: delta_2
            width: 800
            height: 400

            Graph {
                id: graph_delta_2
                anchors.fill: parent
                anchors.margins: 100

                function newSample(i) {
                    return (Math.cos(i / 100.0 * Math.PI * 2) + 1) * 0.4 ;//+ Math.random() * 0.05;
                    //return i*0.1;
                }

                Component.onCompleted: {
                    for (var i=0; i<100; ++i)
                        appendSample(2,newSample(i));//初始化的时候屏幕上的初始点appendsample
                        console.log("delta_newsample:",i," ",newSample(i));
                }

                property int offset: 100;
            }

            Timer {
                id: timer_delta_2
                interval: 500
                repeat: true
                running: true
                onTriggered: {
                    if (quit.pressed==false){
                        graph_delta_2.removeFirstSample();
                        graph_delta_2.appendSample(2,graph_delta_2.newSample(++graph_delta_2.offset));
                        //console.log("delta_newsample:",graph_delta_2.newSample(++graph_delta_2.offset));
                    }
                }

            }
            Rectangle{
               width:600
               height:1
               anchors.top:graph_delta_2.top
               anchors.topMargin: 50
               anchors.left: graph_delta_2.left
               anchors.leftMargin: 0
               color:"red" //颜色
               //rotation:45 //顺时针旋转的角度
            }
            Rectangle {
                anchors.fill: graph_delta_2
                color: "transparent"
                border.color: "black"
                border.width: 2
            }
         }


       }

}


