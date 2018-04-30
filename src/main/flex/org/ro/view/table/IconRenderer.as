package org.ro.view.table {
import mx.controls.LinkButton;

import org.ro.mx.ImageRepository;

import spark.components.gridClasses.GridItemRenderer;

public class IconRenderer extends GridItemRenderer {

    protected var iconButton:LinkButton;

    public function IconRenderer() {
        super();
        iconButton = new LinkButton();
        iconButton.top = 4;
        iconButton.left = 4;
        iconButton.width = 16;
        iconButton.height = 16;
        this.addElement(iconButton);
    }

    override public function set data(value:Object):void {
        var defaultIcon:Class = ImageRepository.ObjectIcon;
        iconButton.setStyle("icon", defaultIcon);
    }

}
}
