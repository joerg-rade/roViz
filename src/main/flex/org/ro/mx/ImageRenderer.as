package org.ro.mx {
import mx.controls.Image;

import spark.components.gridClasses.GridItemRenderer;

public class ImageRenderer extends GridItemRenderer {
    
    private var image:Image;

    public function ImageRenderer() {
        super();
        image = new Image();
        image.width = 16;
        image.height = 16;
        this.addElement(image);
    }

    override public function set data(value:Object):void {
        if (super.data != value) {
            super.data = value;
        }
        image.source = new IconRepository.Pencil();
    }
}
}
