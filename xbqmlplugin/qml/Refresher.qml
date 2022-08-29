pragma Singleton

import QtQuick

QtObject {
    property int refresh: 0
    function registerBinding() {
        return refresh
    }
    function refreshAll() {
        refresh++
    }
}
