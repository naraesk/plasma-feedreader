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

import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.2
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import eu.naraesk.feedreader.process 1.0


Item {
    id: root
    property int totalUnread: 0;
    height: 0
    width: 0;
    Plasmoid.icon: "akregator";
    Plasmoid.status: totalUnread > 0 ? PlasmaCore.Types.ActiveStatus : PlasmaCore.Types.PassiveStatus
    
    Plasmoid.compactRepresentation: CompactRepresentation { }

    Component.onCompleted: {
        totalUnread = process.getUnreadCount();
    }
    Timer {
        id: timer
        interval: 60 * 1000 / 2 /10 // 3 seconds
        running: true
        repeat: true
        onTriggered: {
            totalUnread = process.getUnreadCount();
        }
    }
    
    Process {
        id: process
    }
}
