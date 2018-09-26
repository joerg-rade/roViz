package org.ro.handler {
import org.ro.to.Extensions;
import org.ro.to.Property;

public class PropertyDescriptionHandler extends AbstractHandler implements IResponseHandler {
    public function PropertyDescriptionHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        if (jsonObj.id == null) {
            return false;
        }
        var ext:Extensions = asExtensions(jsonObj);
        return (ext.getFriendlyName() != null);
    }

    public override function doHandle(jsonObj:Object):void {
        var p:Property = new Property(jsonObj);
        logEntry.object = p;
        //FIXME to be handled by Observers
        // Globals.getList().handleProperty(p);
    }
}
}
