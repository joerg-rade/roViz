package org.ro.view.tab {
import flash.events.MouseEvent;

import mx.containers.TabNavigator;
import mx.controls.Menu;
import mx.core.UIComponent;
import mx.events.MenuEvent;

import org.ro.core.Globals;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectAdapter;
import org.ro.core.model.ObjectList;

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

    public function addListTab(list:ObjectList):ListTab {
        var tab:ListTab = new ListTab(list);
        open(tab);
        return tab;
    }

    public function addEventTab(list:Vector.<LogEntry>):EventLogTab {
        var tab:EventLogTab = new EventLogTab(list);
        open(tab);
        return tab;
    }

    public function addTreeTab(list:Vector.<LogEntry>):TreeTab {
        var tab:TreeTab = new TreeTab(list);
        open(tab);
        return tab;
    }

    public function addObjectTab(oa:ObjectAdapter):ObjectTab {
        var tab:ObjectTab = new ObjectTab(oa);
        open(tab);
        return tab;
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
        var pos:int = getChildIndex(tab);
        var len:int = numChildren;
        if (pos >= 0 && pos <= numChildren) {
            try {
                this.removeChild(tab);
            } catch (err:Error) {
                //FIXME WTF is this happening?
                trace("Error: " + err.message);
            }
            finally {
                // Code that runs whether an error was thrown. This code can clean 
                // up after the error, or take steps to keep the application running. 
            }
        } else {
            trace("child not found, while trying to remove");
        }
    }

    public function itemClickHandler(event:MenuEvent):void {
        var tab:BaseTab = this.getItemAt(selectedIndex) as BaseTab;
        if (event.item.@id == "close") {
            removeTab(tab);
        } else if (event.item.@id == "dock") {
            Globals.dockView(tab);
        } else if (event.item.@id == "redraw") {
            reload(tab);
        } else {
            trace("Unexpected Event: " + event.toString());
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
            // this relies on the fact that 
            // the ObjectList held in Globals 
            // is the one that needs to be redrawn
            // This may not be true in all cases.
            Globals.displayList();
            //open(tab);
        }
    }

}
}
