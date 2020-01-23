/*
 * Copyright (C) 2019 by David Baum <david.baum@naraesk.eu>
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

#include <QtQml>
#include "process.h"
#include <iostream>

Process::Process(QObject *parent) : QProcess(parent) {
}

Process::~Process() {
}

int Process::getUnreadCount() {
    QStringList arguments;
    arguments << "--unreadCount";
    start("feedreader", arguments);
    waitForFinished();
    QString feedreaderOutput(readAllStandardOutput());
    QStringList outputLines = feedreaderOutput.split("\n");
    for(const auto& line: outputLines) {
        bool ok;
        int unreadCount = line.toInt(&ok);
        if(ok && !line.isEmpty()) {
            return unreadCount;
        }
    }

    return feedreaderOutput.toInt();
}

void Process::run() {
    startDetached("feedreader");
}
