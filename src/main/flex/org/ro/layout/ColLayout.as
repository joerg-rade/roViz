package org.ro.layout {
import mx.containers.Box;
import mx.containers.HBox;

import org.ro.view.UIUtil;

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

    public function build():HBox {
        var result:HBox = new HBox();
        UIUtil.decorate(result, getClassName(prototype.constructor));
        var b:Box;
        for each(var tl:TabLayout in tabGroup) {
            b = tl.build();
            result.addChild(b);
        }
        for each(var fsl:FieldSetLayout in fields) {
            b = fsl.build();
            result.addChild(b);
        }
        // actions will not be rendered
        return result;
    }

}
}
