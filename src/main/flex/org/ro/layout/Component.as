package org.ro.layout {
import flash.display.DisplayObject;

import mx.containers.HBox;

public class Component {
    internal var id:String;

    public function Component() {
    }

    public function build():DisplayObject {
        var result:HBox = new HBox();
//        for each(var f:Field in fields) {
//            result.addChild(f.build());
//        }
        //TODO actions should not be rendered, right?
        return result;
    }

    internal static function parseXml(xml:XML):Vector.<Component> {
        var result:Vector.<Component> = new Vector.<Component>();
        var cpt:Component;
        for each(var c:XML in xml.elements()) {
            cpt = new Component();
            cpt.id = c.@id;
            result.push(cpt);
        }
        return result;
    }

    public static function parse(col:Object):Vector.<Component> {
        var result:Vector.<Component> = new Vector.<Component>();
        var cpt:Component;
        for each(var c:Object in col.action) {
            cpt = new Component();
            cpt.id = c.id;
            result.push(cpt);
        }
        return result;
    }
}
}
