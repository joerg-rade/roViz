package org.ro.mx {
import flash.events.MouseEvent;

import mx.containers.VBox;
import mx.controls.AdvancedDataGrid;
import mx.controls.Menu;
import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;

public class RoTab extends VBox implements IDockable {

    internal var dg:AdvancedDataGrid = new AdvancedDataGrid();

    public function RoTab(dataProvider:Object, title:String, icon:Class) {
        this.init(dataProvider, title, icon);
    }

    private function init(dataProvider:Object, title:String, icon:Class):void {
        this.id = title;
        this.label = title;
        this.icon = icon;
        dg.percentWidth = 100;
        dg.percentHeight = 100;
        //TODO filter out dnAttributes, add icon, render Objects with LinkButton
        dg.dataProvider = dataProvider;
        dg.doubleClickEnabled = true;
        dg.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClickHandler);
        dg.horizontalScrollPolicy = "auto";
        dg.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
        this.addChild(dg);
        resizeColumns();
        toolTip = "Double click (label) to close or invoke menu on selected item."
    }

    private function mouseWheelHandler():void {
        systemManager.addEventListener("mouseWheel", bumpDelta, true);

        function bumpDelta(event:MouseEvent):void {
            event.delta *= 20;
        }
    }

    private function resizeColumns():void {
        dg.validateNow();
        // forces columns to size themselves properly
        for each (var column:AdvancedDataGridColumn in dg.columns) {
            column.width = column.width;
        }
    }

    protected function doubleClickHandler(event:MouseEvent):void {
        var item:Object = dg.selectedItem;
        if (item == null) {
            doubleClickHandlerMenu(event);
        } else {
//            FlexGlobals.topLevelApplication.view.dsp.invoke(item)
            //TODO           Globals.getDsp().invoke(item);
        }
    }

    protected function doubleClickHandlerMenu(event:MouseEvent):void {
        //see RoDataGrid.buildContextMenu & itemclickHandler
        var myMenuData:XML =
                <root>
                    <menuitem label="Open" action="{open}"/>
                </root>;

        var myMenu:Menu = Menu.createMenu(null, myMenuData, false);
        myMenu.labelField = "@label";
        myMenu.show(mouseX, mouseY);
    }
    
    public function getIcon():Class {
        return icon;
    }

}
}
