package org.ro.layout {
import flash.display.DisplayObject;

import mx.containers.HBox;

public class ColLayout extends AbstractLayout {

    internal var col:Object;
    internal var domainObject:Object;
    internal var metadataError:String;
    internal var size:uint;
    internal var id:String;
    internal var span:uint;
    internal var unreferencedActions:Object;
    internal var unreferencedCollections:Object;
    internal var tabGroup:Object;
    internal var fieldSet:Object;

    internal var fields:Vector.<FieldSetLayout> = new Vector.<FieldSetLayout>();

    public function ColLayout(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        fields = new Vector.<FieldSetLayout>();
        var l:FieldSetLayout;
        for each(var json:Object in fieldSet) {
            l = new FieldSetLayout(json);
            fields.push(l);
        }
    }

    public function build():DisplayObject {
        var result:HBox = new HBox();
        for each(var tl:TabLayout in tabGroup) {
            result.addChild(tl.build());
        }
        for each(var fsl:FieldSetLayout in fields) {
            result.addChild(fsl.build());
        }
        // actions will not be rendered
        return result;
    }

}
}
