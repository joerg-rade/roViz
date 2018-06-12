package org.ro.view {
import flash.events.MouseEvent;

import mx.containers.TabNavigator;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.core.UIComponent;
import mx.events.MenuEvent;

import org.ro.core.Globals;
import org.ro.core.ObjectList;
import org.ro.to.TObject;
import org.ro.view.tab.BaseTab;
import org.ro.view.tab.DetailsTab;
import org.ro.view.tab.ListTab;
import org.ro.view.tab.TreeTab;
import org.ro.xhr.LogEntry;
import org.ro.view.tab.EventLogTab;

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

    public function addListTab(objectList:ObjectList, title:String, icon:Class):void {
        var tab:ListTab = new ListTab(objectList, title, icon);
        open(tab);
    }

    public function addEventTab(list:Vector.<LogEntry>, title:String, icon:Class):void {
        var tab:EventLogTab = new EventLogTab(list, title, icon);
        open(tab);
    }

    public function addTreeTab(list:Vector.<LogEntry>):void {
        var tab:TreeTab = new TreeTab(list);
        open(tab);
    }

    public function addObjectTab(tObj:TObject):void {
        var tab:DetailsTab = new DetailsTab(tObj);
        open(tab);
    }

    public function open(tab:UIComponent):void {
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
                    <menuitem id="redraw" icon="EyeSlashIcon" label="redraw"/>
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

    private function removeTab(tab:BaseTab):void {
        this.removeChild(tab);
    }

    public function itemClickHandler(event:MenuEvent):void {
        var tab:BaseTab = this.getItemAt(selectedIndex) as BaseTab;
        if (event.item.@id == "close") {
            removeTab(tab);
        } else if (event.item.@id == "dock") {
            Globals.getInstance().getDock().addView(tab);
        } else if (event.item.@id == "redraw") {
            reload(tab);
        } else {
            Alert.show(event.toString());
        }
    }

    /**
     * Due to the asynchronous way data is retrieved, some information may not be available at the time the tab is created
     * - notably layout information for linked objects in the FixtureResult list.
     * This function can be called after all responses have arrived from the server.
     * @param tab
     */
    public function reload(tab:BaseTab):void {
        if (tab != null) {
            removeTab(tab);
            Globals.getInstance().displayList(tab.id);
        }
    }

}
}
