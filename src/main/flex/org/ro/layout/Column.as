package org.ro.layout {
import flash.display.DisplayObject;

import mx.containers.HBox;

public class Column {
    internal var components:Vector.<Component>;
    internal var span:uint;

    public function Column() {
        components = new Vector.<Component>();
    }

    public function build():DisplayObject {
        var result:HBox = new HBox();
        for each(var c:Component in components) {
            result.addChild(c.build());
        }
        //TODO actions should not be rendered, right?
        return result;
    }

    internal static function parseXml(xml:XML):Vector.<Column> {
        var result:Vector.<Column> = new Vector.<Column>();
        var col:Column;
        var xml0:XML = xml.elements()[0];
        for each(var c:XML in xml0) {
            col = new Column();
            col.span = c.@span;
            col.components = Component.parseXml(c);
            result.push(col);
        }
        return result;
    }

    public static function parse(cols:Object):Vector.<Column> {
        var result:Vector.<Column> = new Vector.<Column>();
        var col:Column;
        for each(var c:Object in cols) {
            col = new Column();
            col.span = c.col.span;
            col.components = Component.parse(c.col);
            result.push(col);
        }
        return result;

    }
}
}
