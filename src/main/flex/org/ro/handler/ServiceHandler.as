package org.ro.handler {
import org.ro.core.Menu;
import org.ro.to.IInvokeable;
import org.ro.to.Link;
import org.ro.to.Service;

public class ServiceHandler extends AbstractHandler implements IHandler {
    public function ServiceHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return isEmptyObject(jsonObj.extensions);
    }

    public override function doHandle(jsonObj:Object):void {
        var service:Service = new Service(jsonObj);
        var values:Vector.<IInvokeable> = service.getValues();
        setMenu(new Menu(values.length));
        for each (var l:Link in values) {
            l.invoke();
        }
    }

}
}