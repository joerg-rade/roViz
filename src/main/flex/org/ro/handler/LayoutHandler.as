package org.ro.handler {
import org.ro.layout.Layout;

public class LayoutHandler extends AbstractHandler implements IHandler {
    public function LayoutHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        var result:Object = jsonObj.row;
        return (result.length > 0);
    }

    public override function doHandle(jsonObj:Object):void {
        var layout:Layout = new Layout(jsonObj);
        getObjectList().setLayout(layout);
    }

}
}
