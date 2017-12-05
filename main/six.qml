import QtQuick 2.0
import QtQml 2.0
import Graph 1.0
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

Item{
    id: six_main
    visible: true

    Rectangle{
        id: opacitytest_six;
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
                six_main.destroy();
                }
            }

        Image {
            id: six_robot
            source: "qrc:/six.jpg";
            anchors.right : parent.right;
            anchors.rightMargin: 10;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 100;
            width:  100;
            height: 100;
            fillMode: Image.PreserveAspectFit;
        }

        Item {
            id: six
            width: 800
            height: 400

            Graph {
                id: graph_six
                anchors.fill: parent
                anchors.margins: 100

                function newSample(i) {
                    return (Math.sin(i / 100.0 * Math.PI * 2) + 1) * 0.4 ;//+ Math.random() * 0.05;
                    //return i*0.1;
                }

                Component.onCompleted: {
                    for (var i=0; i<100; ++i)
                        appendSample(0,newSample(i));//初始化的时候屏幕上的初始点appendsample
                        //console.log("six_newsample:",i," ",newSample(i));
                }

                property int offset: 100;
            }

            Timer {
                id: timer_six
                interval: 500
                repeat: true
                running: true
                onTriggered: {
                    if (quit.pressed==false){
                        graph_six.removeFirstSample();
                        graph_six.appendSample(0,graph_six.newSample(++graph_six.offset));
                        //console.log("six_newsample:",graph_six.newSample(++graph_six.offset));
                    }
                }

            }
            Rectangle {
                anchors.fill: graph_six
                color: "transparent"
                border.color: "black"
                border.width: 2
            }


         }


       }

}


