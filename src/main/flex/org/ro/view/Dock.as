package org.ro.view {
import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.controls.Image;
import mx.controls.Menu;
import mx.controls.Spacer;
import mx.events.MenuEvent;

import spark.components.VGroup;

public class Dock extends VGroup {
    private var roContextMenu:Menu;

    public function Dock() {
        verticalAlign = "baseline";
        percentHeight = 100;
        var DOCK_WIDTH:int = 20;
        width = DOCK_WIDTH;
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);
    }

    public function addView(tab:IDockable):void {
        var spc:Spacer = new Spacer();
        spc.percentWidth = 100;
        this.addElement(spc);
        var icon:Class = tab.getIcon();
        var image:Image = new Image();
        image.source = new icon();
        image.baseline = -8;
//        this.addElement(image);
    }

    public function buildContextMenu():Menu {
        var xml:XML =
                <root>
                    <menuitem id="delete" icon="TimesRedIcon" label="Delete"/>
                    <menuitem id="open" icon="StepBackwardIcon" label="Open"/>
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

    public function itemClickHandler(event:MenuEvent):void {
        if (event.item.@id == "delete") {
            //removeIcon(null);
        } else if (event.item.@id == "open") {
            //TODO re-create TAB
            new KitchenSink("Next");
        } else {
            Alert.show(event.toString());
        }
    }

}
}
