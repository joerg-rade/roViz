package org.ro.layout {
import mx.containers.HBox;

public class RowLayout extends AbstractLayout {
    private static const MAX_SPAN:uint = 12;

    internal var cols:Object;
    internal var metadataError:String;
    internal var id:String;

    internal var columns:Vector.<ColLayout> = new Vector.<ColLayout>();

    public function RowLayout(jsonObj:Object) {
        fromObject(jsonObj);
    }

    // deprecated . use loop in caller and new RowLayout(json) there
    // eventually add init() here
    public static function parse(json:Object):Vector.<RowLayout> {
        var result:Vector.<RowLayout> = new Vector.<RowLayout>();
        var row:RowLayout;
        for each(var r:Object in json.row) {
            row = new RowLayout(r);
            result.push(row);
        }
        return result;
    }

    public function ensureMaxSpan():Boolean {
        var sum:uint = 0;
        for each(var c:ColLayout in columns) {
            sum = sum + c.span;
        }
        return MAX_SPAN == sum;
    }

    public function build():HBox {
        var result:HBox = new HBox();
        for each(var c:ColLayout in columns) {
            result.addChild(c.build());
        }
        return result;
    }

}
}
