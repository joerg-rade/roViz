package org.ro.view.table {
import mx.controls.LinkButton;

import org.ro.mx.ImageRepository;

import spark.components.gridClasses.GridItemRenderer;

public class IconRenderer extends GridItemRenderer {

    protected var lb:LinkButton;

    public function IconRenderer() {
        super();
        lb = new LinkButton();
        lb.top = 4;
        lb.left = 4;
        lb.width = 16;
        lb.height = 16;
        this.addElement(lb);
    }

    override public function set data(value:Object):void {
        var defaultIcon:Class = ImageRepository.ObjectIcon;
        lb.setStyle("icon", defaultIcon);
    }

}
}
