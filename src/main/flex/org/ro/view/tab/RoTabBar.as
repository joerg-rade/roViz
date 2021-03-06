package org.ro.view.tab {
import flash.events.MouseEvent;

import mx.containers.TabNavigator;
import mx.controls.Menu;
import mx.core.UIComponent;
import mx.events.MenuEvent;

import org.ro.core.DisplayManager;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectAdapter;
import org.ro.core.model.ObjectList;
import org.ro.core.model.Visible;

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

    public function addView(viewable:Visible):void {
        var tab:* = null;
        if (viewable is ObjectAdapter) {
            var oa:ObjectAdapter = viewable as ObjectAdapter;
            tab = new ObjectTab(oa);
        } else if (viewable is ObjectList) {
            var list:ObjectList = viewable as ObjectList;
            tab = new ListTab(list);
        }
        open(tab);
    }

    public function addEventTab(list:Vector.<LogEntry>):void {
        var tab:EventLogTab = new EventLogTab(list);
        open(tab);
    }

    public function addTreeTab(list:Vector.<LogEntry>):void {
        var tab:TreeTab = new TreeTab(list);
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
                </root>;
        var result:Menu = Menu.createMenu(null, xml, false);
        result.labelField = "@label";
        result.iconField = "@icon";
        result.addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
        return result;
    }

    public function contextMenuHandler(event:MouseEvent):void {
        roContextMenu.show(mouseX, mouseY);
    }

    public function hideContextMenu(event:MouseEvent):void {
        roContextMenu.hide();
    }

    public function removeTab(tab:BaseTab):void {
        if (this.contains(tab)) {
            this.removeItem(tab);
        } else {
            trace("child not found, while trying to remove");
        }
    }

    public function itemClickHandler(event:MenuEvent):void {
        var tab:BaseTab = this.getItemAt(selectedIndex) as BaseTab;
        if (event.item.@id == "close") {
            var title:String = tab.label;
            DisplayManager.removeView(title);
            removeTab(tab);
        } else if (event.item.@id == "dock") {
            DisplayManager.dockView(tab);
        } else {
            trace("Unexpected Event: " + event.toString());
        }
    }

}
}
