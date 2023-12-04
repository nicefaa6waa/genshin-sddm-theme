//add me to top of the qml
import QtMultimedia 5.13
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "components"

Item {
    id: root

    height: Screen.height
    width: Screen.width
	
	   // Add a MouseArea to detect clicks and trigger the login panel
    MouseArea {
        id: clickArea
        anchors.fill: parent
        onClicked: {
            // Change the state to show the login panel
            root.state = "login"
				   }
	          }


//add me where ever the wallpaper tag or image is at
       Image {
            id: backgroundImage
			
                    MediaPlayer {
    id: videoPlayer
    source: "/usr/share/sddm/themes/genshin-sddm-theme/1.mp4"
    autoPlay: true
    muted: false
	volume: 1.0
    loops: -1
}

VideoOutput {
    source: videoPlayer
height : 1080
width : 1920
}


            height: parent.height
            width: config.HaveFormBackground == "true" && config.FormPosition != "center" && config.PartialBlur != "true" ? parent.width - formBackground.width : parent.width
            anchors.left: leftleft ||
                          leftcenter ?
                                formBackground.right : undefined

            anchors.right: rightright ||
                           rightcenter ?
                                formBackground.left : undefined

            horizontalAlignment: config.BackgroundImageAlignment == "left" ?
                                 Image.AlignLeft :
                                 config.BackgroundImageAlignment == "right" ?
                                 Image.AlignRight :
                                 config.BackgroundImageAlignment == "center" ?
                                 Image.AlignHCenter : undefined

            source: config.background || config.Background
            fillMode: config.ScaleImageCropped == "true" ? Image.PreserveAspectCrop : Image.PreserveAspectFit
            asynchronous: true
            cache: true
            clip: true
            mipmap: true
        }
		
    Image {
        id: basicImage
	    visible: root.state === "login"
        source: "/usr/share/sddm/themes/genshin-sddm-theme/1.png"  // Provide the actual path to your PNG image
        // Set the maximum width and center the image
        width: Math.min(parent.width, sourceSize.width)
        height: sourceSize.height * (width / sourceSize.width)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter 
		anchors.topMargin: 540
		
		// Text overlay on the image
    Text {
        anchors.top: parent.top
		anchors.topMargin: 385
		anchors.right: parent.right	
		anchors.rightMargin: 350
        text: "nicefaa6waa"
		font.family: zhcn
        font.pixelSize: 15  // Adjust the font size as needed
        color: "black"     // Adjust the text color as needed
    }
   Text {
        anchors.top: parent.top
		anchors.topMargin:385
		anchors.right: parent.right 
		anchors.rightMargin: 80
        text: "ibrahim-mammadli"
		font.family: zhcn
        font.pixelSize: 15  // Adjust the font size as needed
        color: "black"     // Adjust the text color as needed
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
	Item {
		id: contentPanel2
		
		 anchors {
            fill: parent
            topMargin: config.Padding
            rightMargin: config.Padding
            bottomMargin:config.Padding
            leftMargin: config.Padding
        }
   }
   
}
