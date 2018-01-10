package org.ro.mx {

import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.containers.TabNavigator;

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
        tab.setFocus();
        this.addChild(tab);
    }

    public function addGanttTab(list:ArrayCollection, title:String, icon:Class):void {
        var tab:RoDataGrid = new RoDataGrid();
        tab.init(list, title, icon);
        tab.setFocus();
        this.addChild(tab);
    }

    public function removeTab(event:MouseEvent):void {
        this.removeChildAt(selectedIndex);
    }

}
}