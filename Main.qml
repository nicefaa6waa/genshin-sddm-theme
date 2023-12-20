//2
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
            return "sunrise";
        } else if (hours >= 12 && hours < 18) {
            return "morning";
        } else {
            return "night";
        }
    }
	
    MouseArea {
    id: clickArea
    anchors.fill: parent
    onClicked: {

        if (root.state === "door") {

        } else {
            root.state = "login";
               }
             }
           }
	 

	Image {
        id: mainbg
        anchors.fill: parent
        height: parent.height
        width: parent.width
        fillMode: Image.PreserveAspectCrop
        source: "/usr/share/sddm/themes/genshin-sddm-theme/backgrounds/bg.png"
        asynchronous: false
        cache: true
        mipmap: true
        clip: true
	    z : 3
	    visible : false
    }

	
    MediaPlayer {
    id: musicPlayer
    source: "/usr/share/sddm/themes/genshin-sddm-theme/sounds/snow_buried_tales.mp3"
    volume: 1.0
    muted: false
    loops: MediaPlayer.Infinite
    autoPlay: true
    }


    MediaPlayer {
        id: videoPlayer1
        source: "/usr/share/sddm/themes/genshin-sddm-theme/backgrounds/" + getTimeOfDay() + "bg.mp4"
        autoPlay: true
        muted: true

		volume: 1.0

        loops: -1
    }

    MediaPlayer {
        id: videoPlayer2
        source: "/usr/share/sddm/themes/genshin-sddm-theme/backgrounds/doorbg/" + getTimeOfDay() + "door.webm"
        autoPlay: false
        muted: true
    }

    MediaPlayer {
        id: videoPlayer3
        source: "/usr/share/sddm/themes/genshin-sddm-theme/backgrounds/loading.mp4"
        autoPlay: false
        muted: true
    }	
	
    VideoOutput {
        id: videoOutput1
        source: videoPlayer1
        width: 1920
        height: 1080
        z: 2
        }

    VideoOutput {
    id: videoOutput2
    source: videoPlayer2
    width: 1920
    height: 1080
    visible: false

    z: 3
    layer.enabled: true
    layer.effect: ShaderEffect {
        property real alphaValue: 1
        property variant source: ShaderEffectSource { sourceItem: videoOutput2; hideSource: false }
        anchors.fill: parent

        fragmentShader: "
            varying highp vec2 qt_TexCoord0;
            uniform sampler2D source;

            void main(void)
            {
                vec4 color = texture2D(source, qt_TexCoord0);
                
                // Adjust threshold to prevent artifacts
                float threshold = 0.15;
                
                if (color.r < threshold && color.g < threshold && color.b < threshold) {
                    color.a = 0.0;
                }

                gl_FragColor = color;
            }
        "
   	  }
	}

    VideoOutput {
        id: videoOutput3
        source: videoPlayer3
        width: 1920
        height: 1080
		visible: false

        z: 3
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
	z:3
		
		
    Text {
        anchors.top: parent.top
		anchors.topMargin: 385
		anchors.right: parent.right	
		anchors.rightMargin: 350
        text: "nicefaa6waa"
		font.family: zhcn
        font.pixelSize: 15 
        color: "black"     
		z:3
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
		z:3
        }
          }
	
    Item {
        id: contentPanel
		visible: root.state === "login"
		z:3

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
