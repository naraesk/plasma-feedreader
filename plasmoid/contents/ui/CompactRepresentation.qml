/*
 * Copyright (C) 2018 by David Baum <david.baum@naraesk.eu>
 *
 * This file is part of plasma-feedreader.
 *
 * plasma-feedreader is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * plasma-feedreader is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-feedreader.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.2
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.kquickcontrolsaddons 2.0 as KQuickControlsAddons

Item {
    id: compactRep
    
    PlasmaCore.IconItem {
        id: compactIcon
        anchors.fill: parent
        source: "akregator"
    }
    
    Rectangle {
            id: circle
            width: 15
            height: width
            radius: Math.round(width / 2)
            color: "Black"
            opacity: 0.7
            visible: root.totalUnread > 0
            anchors {
                right: parent.right
                top: parent.top
            }
        }

    Text {
           text: root.totalUnread > 99 ? "99+" : root.totalUnread
           font.pointSize: 6
           color: "White"
           anchors.centerIn: circle
           visible: circle.visible
       }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            process.run();
            plasmoid.expanded = !plasmoid.expanded;
        }
        hoverEnabled: true
    }
} 
