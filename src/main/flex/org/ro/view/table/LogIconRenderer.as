package org.ro.view.table {
import mx.controls.LinkButton;

import org.ro.core.event.LogEntry;

public class LogIconRenderer extends IconRenderer {

    public function LogIconRenderer() {
        super();
    }

    override public function set data(value:Object):void {
        var logEntry:LogEntry = value as LogEntry;
        iconButton.setStyle("icon", logEntry.icon);
    }

}
}
