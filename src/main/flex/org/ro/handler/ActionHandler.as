package org.ro.handler {
import org.ro.mx.Dialog;
import org.ro.to.Action;
import org.ro.to.Link;
import org.ro.to.Method;

public class ActionHandler extends AbstractHandler implements IHandler {
    public function ActionHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return asExtensions(jsonObj).actionType != null;
    }

    public override function doHandle(jsonObj:Object):void {
        var a:Action = new Action(jsonObj);
        var raw:Object = a.links[2];
        var l:Link = new Link(raw);
        if (l.getMethod() == Method.GET) {
            l.invoke();
        } else {
            //TODO in case of a GET, POST, or PUT parameters may be required and a dialog is to be opened.
            // eventually in case of a DELETE, a confirmation needs to be shown
            new Dialog("Link Method is POST, PUT, or DELETE");
        }
    }
}
}
