package org.ro.handler {
import org.ro.to.Action;
import org.ro.to.Extensions;
import org.ro.to.Invokeable;
import org.ro.to.Link;
import org.ro.view.dlg.Prompt;

public class ActionHandler extends AbstractHandler implements IResponseHandler {
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
            trace("Link Method is PUT or DELETE");
        }
    }
}
}
