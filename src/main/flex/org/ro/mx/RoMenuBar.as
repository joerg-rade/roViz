package org.ro.mx {

import mx.collections.XMLListCollection;
import mx.controls.Alert;
import mx.controls.MenuBar;
import mx.core.FlexGlobals;
import mx.events.MenuEvent;
import mx.utils.Base64Encoder;

import org.ro.Dispatcher;
import org.ro.Menu;
import org.ro.MenuEntry;
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
        //FIXME this needs to take different types of menuitems into account: host/user, repo_action, settings, ...
        if (event.item.@id == "play") {
            handleHostSelection(event);
        } else {
            handleActionSelection(event);
        }
    }

    private function handleActionSelection(event:MenuEvent):void {
        //TODO credntials to be set into request?
        //var dsp:Dispatcher = FlexGlobals.topLevelApplication.view.dsp;
        //dsp.credentials;

        // extract action from event
        var action:Member = menu.findAction(event.item.@url);
        action.invoke();
    }
    
    private static function handleHostSelection(event:MenuEvent):void {
        var user:String = event.item.@user;
        var credentials:String = user + ":" + event.item.@password;

        var encoder:Base64Encoder = new Base64Encoder();
        encoder.insertNewLines = false;
        encoder.encode(credentials);
        credentials = encoder.toString();

        var dsp:Dispatcher = FlexGlobals.topLevelApplication.view.dsp;
        dsp.credentials = credentials;
        dsp.user = user;
        dsp.url = event.item.@url;

        var link:Link = new Link();
        link.setHref(event.item.@url + event.item.@path);
        link.method = "GET";
        link.invoke();
    }

    //FIXME collect all members of type action  and add them under the right title. 
    // Multiple Services under the same title need to be grouped and separated .
    public function amend(menu:Menu):void {
        this.menu = menu;
        var oldItems:XMLListCollection = dataProvider as XMLListCollection;
        var newMenuItems:XMLListCollection = XMLListCollection(oldItems);
        var addedTopMenus:Array = menu.uniqueMenuTitles();
        for each (var tm:String in addedTopMenus) {
            var newItem:String = '<topmenu label="' + tm + '">';
            //TODO iterate over 'subs' - account for multiple 'children'
            var subItems:Array = menu.findEntriesByTitle(tm);
            for each (var sm:MenuEntry in subItems) {
                newItem = newItem + '<submenu label="' + sm.itemTitle + '" url="' + sm.itemId + '"/>';
            }
            newItem = newItem + '</topmenu>';
            newMenuItems.addItem(new XML(newItem));
        }
        dataProvider = newMenuItems;
    }

}
}