package org.ro.mx {

import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.containers.TabNavigator;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.events.MenuEvent;

import org.ro.Globals;

public class RoTabBar extends TabNavigator {
    var roContextMenu:Menu;

    public function RoTabBar() {
        percentWidth = 100;
        percentHeight = 100;
        this.roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);
    }

    public function addTab(list:ArrayCollection, title:String, icon:Class):void {
        var tab:RoTab = new RoTab();
        tab.init(list, title, icon);
        tab.setFocus();
        this.addChild(tab);
    }

    //TODO depending on list type, different content is to be added
    public function addGanttTab(list:ArrayCollection, title:String, icon:Class):void {
        var tab:RoDataGrid = new RoDataGrid();
        tab.init(list, title, icon);
        tab.setFocus();
        this.addChild(tab);
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