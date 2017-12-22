package org.ro.mx {

import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.containers.TabNavigator;

//TODO extend spark TabBar ???
// easier for focussing newly created tabs?
public class RoTabBar extends TabNavigator {

    public function RoTabBar() {
        percentWidth = 100;
        percentHeight = 100;
        doubleClickEnabled = true;
        addEventListener(MouseEvent.DOUBLE_CLICK, removeTab)
    }

    public function addTab(list:ArrayCollection, title:String, icon:Class):void {
        var tab:RoTab = new RoTab();
        tab.init(list, title, icon);
        //TODO how can the added child be immediately be visible?
        this.addChild(tab);
        this.selectedIndex = selectedIndex++;
    }

    public function removeTab(event:MouseEvent):void {
        this.removeChildAt(selectedIndex);
    }

}
}
