package org.ro.handler {
import org.ro.core.ObjectList;
import org.ro.layout.Layout;
import org.ro.to.Extensions;
import org.ro.to.Property;

public class PropertyDescriptionHandler extends AbstractHandler implements IHandler {
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
        var e:Extensions = p.getExtension();
        var friendlyName:String = e.getFriendlyName();
        var list:ObjectList = getObjectList();
        var layout:Layout = list.getLayout();
        layout.addPropertyLabel(p.getId(), friendlyName);
    }
}
}
