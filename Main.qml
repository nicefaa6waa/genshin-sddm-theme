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
    property var isPaused: 0
    property var songList: [
        "blue_dream.mp3","enchanting_bedtime_stories.mp3","clear_sky_over_liyue.mp3","twilight_serenity.mp3",
        "ad_oblivione.mp3","another_hopeful_tomorrow.mp3","ballad_of_many_waters.mp3","snow_buried_tales.mp3",
        "moonlike_smile.mp3","unfinished_frescoes.mp3","glistening_shards.mp3","her_serenity.mp3",
        "the_flourishing_past.mp3","finale_of_the_snowtomb.mp3","spin_of_the_ice_crystals.mp3",
    ]

	
    function getTimeOfDay() {
        var currentTime = new Date();
        var hours = currentTime.getHours();

        if (hours >= 6 && hours < 12) {
            return "sunrise";
        } else if (hours >= 12 && hours < 19) {
            return "morning";
        } else {
            return "night";
        }
    }


function changeSong(direction) {
    

    if (direction === 1) {
        currentSongIndex = (currentSongIndex + 1) % songList.length;
        isPaused = 0;
    } else if (direction === -1) {
        currentSongIndex = (currentSongIndex - 1 + songList.length) % songList.length;
        isPaused = 0;
    } else if (direction === 0 ) {
        if (isPaused === 1) {
            musicPlayer.play();
            isPaused = 0; 
        } else {
            musicPlayer.pause();
            isPaused = 1;
        }
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
    source: "/usr/share/sddm/themes/genshin-sddm-theme/sounds/blue_dream.mp3"
    volume: 1.0
    muted: false
    autoPlay: true
    loops: -1
    }

    MediaPlayer {
    id: ambiancePlayer
    source: "/usr/share/sddm/themes/genshin-sddm-theme/sounds/ambiance.mp3"
    volume: 0.1
    muted: false
    autoPlay: true
    loops: -1
    }

    MediaPlayer {
        id: closeSound
        source: "/usr/share/sddm/themes/genshin-sddm-theme/sounds/close.mp3"  
        autoPlay: false
    }

    MediaPlayer {
        id: inputFocusSound
        source: "/usr/share/sddm/themes/genshin-sddm-theme/sounds/input_focus.mp3"  
        volume: 0.8
        autoPlay: false
    }

    MediaPlayer {
        id: loginSuccessSound
        source: "/usr/share/sddm/themes/genshin-sddm-theme/sounds/succesfull.mp3"  
        autoPlay: false
    }

    MediaPlayer {
        id: popupSound
        source: "/usr/share/sddm/themes/genshin-sddm-theme/sounds/popup.mp3"  
        autoPlay: false
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
        muted: false
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
        fillMode: VideoOutput.Stretch
        z: 2
        layer.enabled: true
        anchors.fill: parent
        }

    VideoOutput {
    id: videoOutput2
    source: videoPlayer2
    fillMode: VideoOutput.Stretch

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
        fillMode: VideoOutput.Stretch
		visible: true

        z: 3
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
