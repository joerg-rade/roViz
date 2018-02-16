package org.ro.layout {
import mx.containers.HBox;

public class TabLayout extends AbstractLayout {

    internal var name:String;
    internal var row:Object; // which actually is a list of rows

    internal var rowList:Vector.<RowLayout> = new Vector.<RowLayout>();

    public function TabLayout(jsonObj:Object = null) {
        fromObject(jsonObj);
    }

    public function build():HBox {
        var result:HBox = new HBox();
        for each(var rl:RowLayout in rowList) {
            result.addChild(rl.build());
        }
        return result;
    }

}
}
