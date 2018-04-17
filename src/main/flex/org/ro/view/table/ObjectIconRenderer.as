package org.ro.view.table {
import org.ro.core.ObjectAdapter;

public class ObjectIconRenderer extends IconRenderer {

    public function ObjectIconRenderer() {
        super();
    }

    override public function set data(value:Object):void {
        var oa:ObjectAdapter = value as ObjectAdapter;
        lb.enabled = false;
        if (oa != null) {
            lb.label = oa.title;
            lb.setStyle("textDecoration", "underline");
            lb.setStyle("icon", oa.icon);
        }
    }

}
}
