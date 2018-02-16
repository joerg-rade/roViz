package org.ro.layout {
import flash.display.DisplayObject;

import mx.containers.HBox;

public class ColLayout extends AbstractLayout {

    internal var domainObject:Object;
    internal var metadataError:String;
    internal var size:uint;
    internal var id:String;
    internal var span:uint;
    internal var unreferencedActions:Object;
    internal var unreferencedCollections:Object;
    internal var tabGroup:Object;
    internal var fieldSet:Object;


    public function ColLayout(jsonObj:Object = null) {
        fromObject(jsonObj);
    }

    public static function parse(cols:Object):Vector.<ColLayout> {
        var result:Vector.<ColLayout> = new Vector.<ColLayout>();
        var col:ColLayout;
        for each(var c:Object in cols) {
            col = new ColLayout(c);
            result.push(col);
        }
        return result;
    }

    public function build():DisplayObject {
        var result:HBox = new HBox();
        for each(var tl:TabLayout in tabGroup) {
            result.addChild(tl.build());
        }
        // actions will not be rendered
        return result;
    }

}
}
