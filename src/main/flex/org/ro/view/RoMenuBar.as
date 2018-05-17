package org.ro.view {
import flash.geom.Rectangle;

import mx.collections.XMLListCollection;
import mx.controls.MenuBar;
import mx.controls.menuClasses.IMenuBarItemRenderer;
import mx.core.IFlexDisplayObject;
import mx.events.MenuEvent;

import org.ro.core.Globals;
import org.ro.core.Menu;
import org.ro.core.MenuEntry;
import org.ro.to.Invokeable;
import org.ro.to.Link;
import org.ro.to.Member;

public class RoMenuBar extends MenuBar {

    private var menu:Menu;

    public function RoMenuBar() {
        dataProvider = getDefaultMenuItems();
        labelField = "@label";
        iconField = "@icon";
//        setStyle("horizontalAlign", "left");
//        setStyle("horizontalGap", "0");
//        setStyle("x", -12);
        percentWidth = 100;
        addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
        toolTip = "Click icon to select server (populates menu), configure, etc.."
    }

    protected function itemClickHandler(event:MenuEvent):void {
        var id:String = event.item.@id;
        if (id == "play") {
            handleHostSelection(event);
        } else if (id == "next") {
            new KitchenSink("Next");
        } else if (id == "dock") {
            toggleDock(event);
        } else if (id == "status") {
            toggleStatus(event);
        } else {
            handleActionSelection(event);
        }
    }

    private function toggleDock(event:MenuEvent):void {
        var toggle:Boolean = event.item.@toggled;
        Globals.getInstance().getView().showDock(toggle);
    }

    private function toggleStatus(event:MenuEvent):void {
        var toggle:Boolean = event.item.@status;
        Globals.getInstance().getView().showStatus(toggle);
    }

    private function handleActionSelection(event:MenuEvent):void {
        var action:Member = menu.findAction(event.item.@url);
        action.invoke();
    }

    private static function handleHostSelection(event:MenuEvent):void {
        var user:String = event.item.@user;
        var url:String = event.item.@url;
        var pw:String = event.item.@password;
        var path:String = event.item.@path;

        var inst:Globals = Globals.getInstance();
        inst.setUser(user);
        inst.setPw(pw);
        inst.setUrl(url);

        var statusBar:RoStatusBar = inst.getStatusBar();
        statusBar.user.text = user;

        var link:Link = new Link();
        link.setHref(url + path);
        link.setMethod(Invokeable.GET);
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
                    <submenu id="play"
                             label="SEMAT (http://semat-semat.193b.starter-ca-central-1.openshiftapps.com/:80)"
                             url="http://semat-semat.193b.starter-ca-central-1.openshiftapps.com"
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
                        <submenu id="status" label="Status Line" type="check" toggled="true"/>
                    </submenu>
                    <submenu id="next" label="KitchenSink"/>
                </topmenu>;
        return menuItems;
    }

    public function getMenu():Menu {
        return menu;
    }

    public function setMenu(menu:Menu):void {
        this.menu = menu;
    }

    /* Remainder of this file only required in order to change the Icon offset (from 10 -> x)*/
    /* copied from mx.control.MenuBar */
    /* probably to be removed if a more modern MenuBar implementation is used */
    private static const MARGIN_WIDTH:int = 4;

    override protected function measure():void {
        super.measure();
        var len:int = menuBarItems.length;
        measuredWidth = 0;

        // measured height is at least 22
        measuredHeight = DEFAULT_MEASURED_MIN_HEIGHT;
        for (var i:int = 0; i < len; i++) {
            measuredWidth += menuBarItems[i].getExplicitOrMeasuredWidth();
            measuredHeight = Math.max(
                    measuredHeight, menuBarItems[i].getExplicitOrMeasuredHeight());
        }

        if (len > 0)
            measuredWidth += 2 * MARGIN_WIDTH;
        else // else give it a default width, MARGIN_WIDTH = 10.
            measuredWidth = DEFAULT_MEASURED_MIN_WIDTH; // setting it slightly more than the width

        measuredMinWidth = measuredWidth;
        measuredMinHeight = measuredHeight;
    }

    private var background:IFlexDisplayObject;

    override protected function updateDisplayList(unscaledWidth:Number,
                                                  unscaledHeight:Number):void {
        super.updateDisplayList(unscaledWidth, unscaledHeight);

        var lastX:Number = MARGIN_WIDTH;
        var lastW:Number = 0;
        var len:int = menuBarItems.length;

        var clipContent:Boolean = false;
        var hideItems:Boolean = (unscaledWidth == 0 || unscaledHeight == 0);

        for (var i:int = 0; i < len; i++) {
            var item:IMenuBarItemRenderer = menuBarItems[i];

            item.setActualSize(item.getExplicitOrMeasuredWidth(), unscaledHeight);
            item.visible = !hideItems;

            lastX = item.x = lastX + lastW;
            lastW = item.width;

            if (!hideItems &&
                    (item.getExplicitOrMeasuredHeight() > unscaledHeight ||
                            (lastX + lastW) > unscaledWidth)) {
                clipContent = true;
            }
        }

        if (background) {
            background.setActualSize(unscaledWidth, unscaledHeight);
            background.visible = !hideItems;
        }

        // Set a scroll rect to handle clipping.
        scrollRect = clipContent ? new Rectangle(0, 0,
                unscaledWidth, unscaledHeight) : null;
    }
    
}
}