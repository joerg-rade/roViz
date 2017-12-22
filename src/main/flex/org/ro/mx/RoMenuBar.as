package org.ro.mx {

import mx.collections.ArrayCollection;
import mx.collections.XMLListCollection;
import mx.controls.MenuBar;
import mx.core.FlexGlobals;
import mx.events.MenuEvent;
import mx.utils.Base64Encoder;

import org.ro.to.Link;
import org.ro.Dispatcher;

public class RoMenuBar extends MenuBar {

    public function RoMenuBar() {
        dataProvider = XmlFileService.getDefaultMenuItems();
        labelField = "@label";
        iconField = "@icon";
        top = "0";
        percentWidth = 100;
        addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
    }

    protected static function itemClickHandler(event:MenuEvent):void {
        //FIXME this needs to take different types of menuitems into account: host/user, repo_action, settings, ...
        handleHostSelection(event);
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


    /**
     * add the titles of the 'services' to the menu
     */
    //deprecated -> use amend(menu:Menu)
    public function amend(services:ArrayCollection):void {
        var menuItems:XMLListCollection = dataProvider as XMLListCollection;
        var newMenuItems:XMLListCollection = XMLListCollection(menuItems);
        for each (var item:Object in services) {
            var newItem:XML = new XML('<topmenu label="' + item.title + '"/>');
            newMenuItems.addItem(newItem);
        }
        dataProvider = newMenuItems;
    }

}
}