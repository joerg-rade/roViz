package org.ro.view.table {
import mx.controls.LinkButton;

import org.ro.xhr.XhrLogEntry;

public class LogIconRenderer extends IconRenderer {

    public function LogIconRenderer() {
        super();
    }

    override public function set data(value:Object):void {
        var logEntry:XhrLogEntry = value as XhrLogEntry;
        lb.setStyle("icon", logEntry.icon);
    }

}
}
