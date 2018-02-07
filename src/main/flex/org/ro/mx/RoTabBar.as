package org.ro.mx {

import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.containers.TabNavigator;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.core.UIComponent;
import mx.events.MenuEvent;

import org.ro.core.Globals;
import org.ro.xhr.RoDataGrid;
import org.ro.xhr.XhrLogEntry;

public class RoTabBar extends TabNavigator {
    private var roContextMenu:Menu;

    public function RoTabBar() {
        percentWidth = 100;
        percentHeight = 100;
        tabFocusEnabled = true;
        this.roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);
    }

    public function addTab(list:ArrayCollection, title:String, icon:Class):void {
        var tab:RoTab = new RoTab(list, title, icon);
        open(tab);
    }

    public function addGanttTab(list:Vector.<XhrLogEntry>, title:String, icon:Class):void {
        var tab:RoDataGrid = new RoDataGrid(list, title, icon);
        open(tab);
    }

    private function open(tab:UIComponent):void {
        this.addChild(tab);
        var index:int = this.getItemIndex(tab);
        this.tabIndex = index;
        this.selectedIndex = index;
    }

    public function buildContextMenu():Menu {
        var xml:XML =
                <root>
                    <menuitem id="close" icon="TimesRedIcon" label="Close"/>
                    <menuitem id="dock" icon="StepBackwardIcon" label="Dock"/>
                </root>;
        var result:Menu = Menu.createMenu(null, xml, false);
        result.labelField = "@label";
        result.iconField = "@icon";
        //m.setStyle("color", "0xC0504D");  text can be colored, but not the menu background
        result.addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
        return result;
    }

    public function contextMenuHandler(event:MouseEvent):void {
        roContextMenu.show(mouseX, mouseY);
    }

    public function hideContextMenu(event:MouseEvent):void {
        roContextMenu.hide();
    }

    public function removeTab(event:MouseEvent):void {
        this.removeChildAt(selectedIndex);
    }

    public function itemClickHandler(event:MenuEvent):void {
        if (event.item.@id == "close") {
            removeTab(null);
        } else if (event.item.@id == "dock") {
            var tab:IDockable = this.getItemAt(selectedIndex) as IDockable;
            Globals.getDock().addView(tab);
            //new KitchenSink("Next");
        } else {
            Alert.show(event.toString());
        }
    }

}
}