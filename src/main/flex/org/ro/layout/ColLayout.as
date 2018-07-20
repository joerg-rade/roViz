package org.ro.layout {
import mx.containers.HBox;
import mx.core.UIComponent;

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

    internal var fieldList:Vector.<FieldSetLayout> = new Vector.<FieldSetLayout>();
    internal var tabList:Vector.<TabLayout> = new Vector.<TabLayout>();

    public function ColLayout(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        fieldList = new Vector.<FieldSetLayout>();
        var l:FieldSetLayout;
        for each(var json:Object in fieldSet) {
            l = new FieldSetLayout(json);
            fieldList.push(l);
        }
        tabList = new Vector.<TabLayout>();
        var t:TabLayout;
        for each(var json2:Object in col.tabGroup) {
            t = new TabLayout(json2);
            tabList.push(t);
        }
    }

    public function build():HBox {
        var result:HBox = new HBox();
        UIUtil.decorate(result, getClassName(prototype.constructor));
        var b:UIComponent;
        for each(var tl:TabLayout in tabList) {
            b = tl.build();
            result.addChild(b);
        }
        for each(var fsl:FieldSetLayout in fieldList) {
            b = fsl.build();
            result.addChild(b);
        }
        // actions will not be rendered
        return result;
    }

}
}
