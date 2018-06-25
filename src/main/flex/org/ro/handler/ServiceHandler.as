package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.Utils;
import org.ro.core.Menu;
import org.ro.to.Invokeable;
import org.ro.to.Link;
import org.ro.to.Service;

public class ServiceHandler extends AbstractHandler implements IResponseHandler {
    public function ServiceHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return Utils.isEmptyObject(jsonObj.extensions);
    }

    public override function doHandle(jsonObj:Object):void {
        var service:Service = new Service(jsonObj);
        var values:Vector.<Invokeable> = service.getValues();
        var menu:Menu = new Menu(values.length);
        Globals.getInstance().setMenu(menu);
        for each (var l:Link in values) {
            l.invoke();
        }
    }

}
}