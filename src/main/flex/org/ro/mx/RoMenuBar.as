package org.ro.mx {

import mx.collections.XMLListCollection;
import mx.controls.MenuBar;
import mx.events.MenuEvent;
import mx.utils.Base64Encoder;

import org.ro.core.Globals;
import org.ro.core.Menu;
import org.ro.core.MenuEntry;
import org.ro.core.Dispatcher;
import org.ro.to.AbstractTransferObject;
import org.ro.to.Link;
import org.ro.to.Member;

public class RoMenuBar extends MenuBar {

    private var menu:Menu;

    public function RoMenuBar() {
        dataProvider = getDefaultMenuItems();
        labelField = "@label";
        iconField = "@icon";
        top = "0";
        percentWidth = 100;
        addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
        toolTip = "Click icon to select server (populates menu), configure, etc.."
    }

    protected function itemClickHandler(event:MenuEvent):void {
        //TODO take different types of menuitems into account: host/user, settings, ...
        if (event.item.@id == "play") {
            handleHostSelection(event);
        } else if (event.item.@id == "next") {
            new KitchenSink("Next");
        } else if (event.item.@id == "dock") {
            toggleDock(event);
        } else {
            handleActionSelection(event);
        }
    }

    private function toggleDock(event:MenuEvent):void {
        var show:Boolean = event.item.@toggled;
        var dock:Dock = Globals.getDock();
        if (show) {
            dock.show();
        } else {
            dock.hide();
        }
    }

    private function handleActionSelection(event:MenuEvent):void {
        var action:Member = menu.findAction(event.item.@url);
        action.invoke();
    }

    private static function handleHostSelection(event:MenuEvent):void {
        var user:String = event.item.@user;
        var url:String = event.item.@url;
        var credentials:String = user + ":" + event.item.@password;

        var encoder:Base64Encoder = new Base64Encoder();
        encoder.insertNewLines = false;
        encoder.encode(credentials);
        credentials = encoder.toString();

        var dsp:Dispatcher = Globals.getDsp();
        dsp.credentials = credentials;
        dsp.user = user;
        dsp.url = event.item.@url;

        var statusBar:RoStatusBar = Globals.getStatusBar();
        statusBar.user.text = user;

        var link:Link = new Link();
        link.setHref(url + event.item.@path);
        link.method = AbstractTransferObject.GET;
        link.invoke();
    }

    //TODO Multiple Services under the same title need to be grouped and separated
    public function amend(menu:Menu):void {
        this.menu = menu;
        var oldItems:XMLListCollection = dataProvider as XMLListCollection;
        var newMenuItems:XMLListCollection = XMLListCollection(oldItems);
        var addedTopMenus:Array = this.menu.uniqueMenuTitles();
        for each (var tm:String in addedTopMenus) {
            var newItem:String = '<topmenu label="' + tm + '">';
            //TODO iterate over 'subs' - account for multiple 'children'
            var subItems:Array = this.menu.findEntriesByTitle(tm);
            for each (var sm:MenuEntry in subItems) {
                newItem = newItem + '<submenu label="' + sm.itemTitle + '" url="' + sm.itemId + '"/>';
            }
            newItem = newItem + '</topmenu>';
            newMenuItems.addItem(new XML(newItem));
//            newMenuItems.addItem(new XML('<submenu type="separator"/>'));
        }
//        newMenuItems.removeItemAt(newMenuItems.length - 1);
        dataProvider = newMenuItems;
    }

    public static function getDefaultMenuItems():XML {
        //TODO store encoded with master pw in sqllite, add dialog for appending more entries and input of master pw
        var menuItems:XML =
                <topmenu label="" icon="MenuIcon">
                    <submenu id="play" label="SimpleApp (localhost:8080)"
                             url="http://localhost:8080"
                             path="/restful/services/"
                             user="sven"
                             password="pass"/>
                    <submenu id="play" label="ToDoApp (localhost:8080)"
                             url="http://localhost:8080"
                             path="/restful/services/"
                             user="todoapp-admin"
                             password="pass"/>
                    <submenu type="separator"/>
                    <submenu id="play" label="SEMAT (http://semat.ofbizian.com/:80)"
                             url="http://semat.ofbizian.com/"
                             path="/restful/services/"
                             user="user"
                             password="user"/>
                    <submenu type="separator"/>
                    <submenu id="play" label="KNIfe (localhost:8080)"
                             url="http://localhost:8080"
                             path="/restful/services/"
                             user="sven"
                             password="pass"/>
                    <submenu type="separator"/>
                    <submenu id="config" label="Settings">
                        <submenu id="dock" label="Dock" type="check" toggled="true"/>
                    </submenu>
                    <submenu id="next" label="KitchenSink"/>
                </topmenu>;
        return menuItems;
    }

}
}