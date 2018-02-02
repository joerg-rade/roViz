package org.ro.mx {
import mx.containers.TitleWindow;
import mx.controls.Label;
import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import org.ro.core.Globals;

/**
 * Build a dialog, possibly using form and specification from Action.parameters
 */
public class Dialog extends TitleWindow {

    public function Dialog(title:String = null) {
        this.title = title;
        this.showCloseButton = true;
        width = 240;
        height = 180;
        addEventListener(CloseEvent.CLOSE, close);

        //TODO replace with Form constructed from paramters/arguments
        var lbl:Label = new Label();
        lbl.text = title;
        addChild(lbl);

        PopUpManager.addPopUp(this, Globals.getView(), true);
        PopUpManager.centerPopUp(this);
    }

    private function close(evt:CloseEvent):void {
        PopUpManager.removePopUp(this);
    }
    
}
}
