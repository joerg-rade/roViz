package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.Menu;
import org.ro.to.Invokeable;
import org.ro.to.Service;

public class MemberHandler extends AbstractHandler implements IResponseHandler {
    public function MemberHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return (jsonObj.members != null) && (jsonObj.extensions.isService);
    }

    public override function doHandle(jsonObj:Object):void {
        var service:Service = new Service(jsonObj);
        var members:Vector.<Invokeable> = service.getMembers();
        var spock:Globals = Globals.getInstance();
        var mnu:Menu = spock.getMenu();
        var done:Boolean = mnu.init(service, members);
        if (done) {
            spock.amendMenu(mnu);
        }
    }

}
}
