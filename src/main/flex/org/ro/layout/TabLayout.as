package org.ro.layout {
import mx.containers.Box;
import mx.containers.HBox;

import org.ro.view.UIUtil;

public class TabLayout extends AbstractLayout {

    internal var name:String;
    internal var row:Object; // which actually is a list of rows

    internal var rowList:Vector.<RowLayout> = new Vector.<RowLayout>();

    public function TabLayout(jsonObj:Object = null) {
        fromObject(jsonObj);
    }

    public function build():HBox {
        var result:HBox = new HBox();
        UIUtil.decorate(result, getClassName(prototype.constructor));
        var b:Box;
        for each(var rl:RowLayout in rowList) {
            b = rl.build();
            result.addChild(b);
        }
        return result;
    }
    
}
}
