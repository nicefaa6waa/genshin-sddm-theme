//2
import QtMultimedia 5.13
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "components"

Item {
    property var currentSongIndex : 0
    id: root
    height: Screen.height
    width: Screen.width
    property var songList: [
        "snow_buried_tales.mp3","moonlike_smile.mp3","unfinished_frescoes.mp3","the_flourishing_past.mp3","finale_of_the_snowtomb.mp3","spin_of_the_ice_crystals.mp3","glistening_shards.mp3",
    ]

	
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

function changeSong(direction) {
    if (direction === 1) {
        currentSongIndex = (currentSongIndex + 1) % songList.length;
    } else if (direction === -1) {
        currentSongIndex = (currentSongIndex - 1 + songList.length) % songList.length;
    }
    
    if (currentSongIndex === songList.length) {
        currentSongIndex = 0;
    }

    musicPlayer.source = "/usr/share/sddm/themes/genshin-sddm-theme/sounds/" + songList[currentSongIndex];
    console.log("/usr/share/sddm/themes/genshin-sddm-theme/sounds/" + songList[currentSongIndex]);
    console.log(currentSongIndex);
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
        z:1
	    visible : true
    }

	
    MediaPlayer {
    id: musicPlayer
    source: "/usr/share/sddm/themes/genshin-sddm-theme/sounds/snow_buried_tales.mp3"
    volume: 1.0
    muted: false
    autoPlay: true
    onPlaybackStateChanged: {
        if (musicPlayer.state === MediaPlayer.EndOfMedia) {
            changeSong(1); 
        }
    }
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
    visible: true

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
		visible: true

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
		
    Button {
        id: xbutton
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 15
        anchors.rightMargin: 20
        width: 30
        height: width
        onClicked: {
            root.state = "first"
        }
        text: qsTr("X")

        background: Rectangle {
                color: "white" 
        }
    }
    	
    Text {
        anchors.top: parent.top
		anchors.topMargin: 385
		anchors.right: parent.right	
		anchors.rightMargin: 350
        text: "nicefaa6waa"
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
        font.pixelSize: 15 
        color: "black"   
		z:3
        }
          }
	
    Item {
        id: contentPanel
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
