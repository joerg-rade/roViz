package org.ro.view.table {
import mx.events.FlexEvent;

public class ObjectIconRenderer extends IconRenderer {

    public function ObjectIconRenderer() {
        super();
    }

    override public function set data(value:Object):void {
        lb.enabled = false;
        if (value != null) {
            lb.label = value.title;
            lb.setStyle("textDecoration", "underline");
            lb.setStyle("icon", value.icon);
        }
        dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
    }

}
}
