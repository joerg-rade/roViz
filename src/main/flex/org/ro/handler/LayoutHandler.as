package org.ro.handler {
import org.ro.layout.Layout;
import org.ro.layout.PropertyLayout;
import org.ro.to.Link;

public class LayoutHandler extends AbstractHandler implements IHandler {
    public function LayoutHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        var rows:Object = jsonObj.row;
        return (rows != null && rows.length > 0);
    }

    public override function doHandle(jsonObj:Object):void {
        var layout:Layout = new Layout(jsonObj);
        getObjectList().setLayout(layout);
        initPropertyDescription(layout);
    }

    /** handler chain:
     * (1) FR_OBJECT                TObjectHandler -> invoke()
     * (2) FR_OBJECT_LAYOUT         layoutHandler -> invoke(layout.getProperties()[].getLink()) link can be null?
     * (3) FR_OBJECT_PROPERTY       PropertyHandler -> invoke()
     * (4) FR_PROPERTY_DESCRIPTION  PropertyDescriptionHandler
     */
    private static function initPropertyDescription(layout:Layout):void {
        if (layout.arePropertyLabelsToBeSet()) {
            var pls:Vector.<PropertyLayout> = layout.getProperties();
            var l:Link;
            for each(var pl:PropertyLayout in pls) {
                l = pl.getLink();
                l.invoke();
            }
        }
    }

}
}
