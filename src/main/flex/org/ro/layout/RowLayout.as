package org.ro.layout {
import mx.containers.HBox;

public class RowLayout extends AbstractLayout {
    private static const MAX_SPAN:uint = 12;

    internal var cols:Object;
    internal var metadataError:String;
    internal var id:String;

    internal var columns:Vector.<ColLayout> = new Vector.<ColLayout>();

    public function RowLayout(jsonObj:Object) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        columns = new Vector.<ColLayout>();
        var l:ColLayout;
        for each(var json:Object in cols) {
            l = new ColLayout(json);
            columns.push(l);
        }
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
