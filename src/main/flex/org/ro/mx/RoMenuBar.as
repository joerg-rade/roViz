package org.ro.mx {

import mx.collections.XMLListCollection;
import mx.controls.MenuBar;
import mx.core.FlexGlobals;
import mx.events.MenuEvent;
import mx.utils.Base64Encoder;

import org.ro.Menu;
import org.ro.MenuEntry;
import org.ro.ctrl.Dispatcher;
import org.ro.to.Link;
import org.ro.to.Member;

public class RoMenuBar extends MenuBar {

    private var menu:Menu;

    public function RoMenuBar() {
        dataProvider = XmlFileService.getDefaultMenuItems();
        labelField = "@label";
        iconField = "@icon";
        top = "0";
        percentWidth = 100;
        addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
    }

    protected function itemClickHandler(event:MenuEvent):void {
        //TODO take different types of menuitems into account: host/user, settings, ...
        if (event.item.@id == "play") {
            handleHostSelection(event);
        } else {
            handleActionSelection(event);
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

        var dsp:Dispatcher = FlexGlobals.topLevelApplication.view.dsp;
        dsp.credentials = credentials;
        dsp.user = user;
        dsp.url = event.item.@url;
        
        var statusBar:RoStatusBar = FlexGlobals.topLevelApplication.view.statusBar;
        statusBar.user.text = user;
        statusBar.host.text = url;

        var link:Link = new Link();
        link.setHref(url + event.item.@path);
        link.method = "GET";
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

}
}