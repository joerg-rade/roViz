package org.ro.view.table {
import mx.controls.LinkButton;

import org.ro.xhr.XhrLogEntry;

import spark.components.gridClasses.GridItemRenderer;

public class IconRenderer extends GridItemRenderer {

    private var icon:LinkButton;

    public function IconRenderer() {
        super();
        icon = new LinkButton();
        icon.width = 16;
        icon.height = 16;
        icon.top =
        this.addElement(icon);
    }

    override public function set data(value:Object):void {
        var logEntry:XhrLogEntry = value as XhrLogEntry;
        icon.setStyle("icon", logEntry.icon);
    }

}
}
