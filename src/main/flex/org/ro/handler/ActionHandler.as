package org.ro.handler {
import org.ro.mx.Dialog;
import org.ro.mx.Prompt;
import org.ro.to.BaseTO;
import org.ro.to.Action;
import org.ro.to.Invokeable;
import org.ro.to.Link;
import org.ro.to.Extensions;

public class ActionHandler extends AbstractHandler implements IHandler {
    public function ActionHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        var ext:Extensions = asExtensions(jsonObj); 
        return ext.getActionType() != null;
    }

    public override function doHandle(jsonObj:Object):void {
        var a:Action = new Action(jsonObj);
        var l:Link = a.getInvokeLink();
        var m:String = l.getMethod();
        if (m == Invokeable.GET) {
            l.invoke();
        } else if (m == Invokeable.POST) {
            new Prompt(a);
        } else {
            //TODO handle PUT / DELETE
            // eventually in case of a DELETE, a confirmation needs to be shown
            new Dialog("Link Method is PUT or DELETE");
        }
    }
}
}
