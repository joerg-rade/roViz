package org.ro.layout {
import mx.containers.TabNavigator;
import mx.containers.VBox;
import mx.core.UIComponent;

import org.ro.view.UIUtil;

public class TabLayout extends AbstractLayout {

    internal var name:String;
    internal var row:Object; // which actually is a list of rows
    internal var unreferencedCollections:Object;
    internal var tab:Object;  // is a list of tabs
    internal var metadataError:Object;

    internal var rowList:Vector.<RowLayout> = new Vector.<RowLayout>();

    public function TabLayout(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        rowList = new Vector.<RowLayout>();
        var rl:RowLayout;
        for each(var json:Object in row) {
            rl = new RowLayout(json);
            rowList.push(rl);
        }
    }

    public function build():UIComponent {
        var result:TabNavigator = new TabNavigator();
        result.percentWidth = 100;
        result.percentHeight = 100;
        result.tabFocusEnabled = true;

        UIUtil.decorate(result, "TabLayout", debugInfo);
        var b:VBox;
        //FIXME tab has (General, Metadata, Other) but rowlist is not initialized
        for each(var rl:RowLayout in rowList) {
            b = rl.build();
            result.addChild(b);
        }
        return result;
    }

}
}
