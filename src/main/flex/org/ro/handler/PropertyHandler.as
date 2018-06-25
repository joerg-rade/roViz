package org.ro.handler {
import org.ro.to.Link;
import org.ro.to.Property;

public class PropertyHandler extends AbstractHandler implements IResponseHandler {
    public function PropertyHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        var links:Object = jsonObj.links;
        if ((links != null) && (links.length == 3)) {
            return (links[2].rel == Property.DESCRIBED_BY);
        }
        return false;
    }

    public override function doHandle(jsonObj:Object):void {
        var p:Property = new Property(jsonObj);
        var l:Link = p.descriptionLink();
        if (l != null) {
            l.invoke();
        }
        //FIXME implement Handler
    }

}
}
