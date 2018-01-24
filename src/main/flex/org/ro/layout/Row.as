package org.ro.layout {
import mx.containers.HBox;

public class Row {
    private static const MAX_SPAN:uint = 12;

    internal var columns:Vector.<Column>;

    public function Row() {
        columns = new Vector.<Column>();
    }

    public function ensureMaxSpan():Boolean {
        var sum:uint = 0;
        for each(var c:Column in columns) {
            sum = sum + c.span;
        }
        return MAX_SPAN == sum;
    }

    public function build():HBox {
        var result:HBox = new HBox();
        for each(var c:Column in columns) {
            result.addChild(c.build());
        }
        return result;
    }

    internal static function parseXml(xmlList:XMLList):Vector.<Row> {
        var result:Vector.<Row> = new Vector.<Row>();
        var row:Row;
        for each(var r:XML in xmlList) {
            row = new Row();
            row.columns = Column.parseXml(r);
            result.push(row);
        }
        return result;
    }

    public static function parse(json:Object):Vector.<Row> {
        var result:Vector.<Row> = new Vector.<Row>();
        var row:Row;
        for each(var r:Object in json.row) {
            row = new Row();
            row.columns = Column.parse(r.cols);
            result.push(row);
        }
        return result;        
    }
}
}
