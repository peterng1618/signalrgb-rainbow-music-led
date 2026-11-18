import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
	anchors.fill: parent

	ColumnLayout {
		anchors.fill: parent
		anchors.margins: 12
		spacing: 10

		Text {
			text: "Discover strips"
			color: theme.primarytextcolor
			font.family: "Poppins"
			font.pixelSize: 16
			font.bold: true
		}

		Text {
			text: "Physical layout"
			color: theme.primarytextcolor
			font.family: "Poppins"
			font.pixelSize: 12
		}

		RowLayout {
			spacing: 8
			Button {
				text: "4 bars (Ring)"
				onClicked: discovery.setBarCount(4)
			}
			Button {
				text: "3 bars (U)"
				onClicked: discovery.setBarCount(3)
			}
		}

		Text {
			text: "First LED direction (LED 0 stays on the strip's first physical LED)"
			color: theme.primarytextcolor
			font.family: "Poppins"
			font.pixelSize: 12
		}

		RowLayout {
			spacing: 8
			Button {
				text: "Clockwise"
				onClicked: discovery.setStartDirection("Clockwise")
			}
			Button {
				text: "Counter-Clockwise"
				onClicked: discovery.setStartDirection("Counter-Clockwise")
			}
		}

		Text {
			text: "Add strip: enter the strip's full IP. Scan LAN: enter your LAN prefix (first three octets, e.g. 10.0.0) then press Scan LAN. A blank field cannot scan — SignalRGB does not expose this PC's LAN address."
			color: theme.primarytextcolor
			font.family: "Poppins"
			font.pixelSize: 12
			wrapMode: Text.WordWrap
			Layout.fillWidth: true
		}

		RowLayout {
			spacing: 8

			TextField {
				id: ipField
				placeholderText: "Strip IP, or LAN prefix (e.g. 10.0.0)"
				color: theme.primarytextcolor
				font.family: "Poppins"
				Layout.fillWidth: true
				validator: RegularExpressionValidator {
					regularExpression: /^((25[0-5]|2[0-4]\d|1?\d?\d)\.){0,3}(25[0-5]|2[0-4]\d|1?\d?\d)?$/
				}
			}

			Button {
				text: "Add strip"
				onClicked: discovery.forceDiscover(ipField.text)
			}

			Button {
				text: "Scan LAN"
				onClicked: discovery.forceDiscover(ipField.text)
			}
		}
	}
}
