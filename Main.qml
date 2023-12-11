import QtMultimedia 5.13
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "components"

Item {
    id: root
    height: Screen.height
    width: Screen.width

    function getTimeOfDay() {
        var currentTime = new Date();
        var hours = currentTime.getHours();

        if (hours >= 6 && hours < 12) {
            return "sunrisebg.mp4";
        } else if (hours >= 12 && hours < 18) {
            return "morningbg.mp4";
        } else {
            return "nightbg.mp4";
        }
    }
	
    MouseArea {
    id: clickArea
    anchors.fill: parent
    onClicked: {
          root.state = "login";
               }
              }


    MediaPlayer {
        id: videoPlayer1
        source: "/usr/share/sddm/themes/genshin-sddm-theme/backgrounds" + getTimeOfDay()
        autoPlay: true
        muted: false
        volume: 1.0
        loops: -1
    }	
	

    VideoOutput {
        id: videoOutput1
        source: videoPlayer1
        width: 1920
        height: 1080
        }

		
    Image {
        id: basicImage
	    visible: root.state === "login"
        source: "/usr/share/sddm/themes/genshin-sddm-theme/1.png"
        width: Math.min(parent.width, sourceSize.width)
        height: sourceSize.height * (width / sourceSize.width)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter 
		anchors.topMargin: 540
		
    Text {
        anchors.top: parent.top
		anchors.topMargin: 385
		anchors.right: parent.right	
		anchors.rightMargin: 350
        text: "nicefaa6waa"
		font.family: zhcn
        font.pixelSize: 15  
        color: "black"     
    }
   Text {
        anchors.top: parent.top
		anchors.topMargin:385
		anchors.right: parent.right 
		anchors.rightMargin: 80
        text: "ibrahim-mammadli"
		font.family: zhcn
        font.pixelSize: 15  
        color: "black"     
    }
	
    }
	
    Item {
        id: contentPanel
		visible: root.state === "login"

        anchors {
            fill: parent
            topMargin: -400
            rightMargin: config.Padding
            leftMargin: config.Padding
        }

        
        LoginPanel {
            id: loginPanel
            
            anchors.fill: parent
        }
    }   
}
