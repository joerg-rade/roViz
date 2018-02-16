package org.ro.view.table {
import mx.core.ClassFactory;

import org.ro.core.StringUtils;

public class ColumnSpecification {

    private var field:String;
    private var name:String;
    private var width:uint;
    private var tip:String;
    private var renderer:ClassFactory;

    public function ColumnSpecification(field:String = null, width:uint = 0, name:String = null, tip:String = null, renderer:ClassFactory = null) {
        this.field = field;
        this.name = name;
        this.width = width;
        this.tip = tip;
        this.renderer = renderer;
    }

    public function getField():String {
        return field;
    }

    public function getName():String {
        if (name == null) {
            return StringUtils.camelCase(field);
        } else {
            return name;
        }
    }

    public function getWidth():uint {
        if (width == 0) {
            return name.length;
        } else {
            return width;
        }
    }

    public function getTip():String {
        return tip;
    }

    public function hasTip():Boolean {
        return (tip == null);
    }

    public function getRenderer():ClassFactory {
        return renderer;
    }

}
}
