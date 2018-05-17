package org.ro.view.tab {
import flash.events.MouseEvent;

import mx.containers.VBox;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.controls.dataGridClasses.DataGridColumn;
import mx.core.ClassFactory;

import org.ro.core.Globals;
import org.ro.core.ObjectList;
import org.ro.layout.Layout;
import org.ro.layout.PropertyLayout;
import org.ro.to.Link;
import org.ro.to.TObject;
import org.ro.view.IDockable;
import org.ro.view.dlg.Message;
import org.ro.view.table.ColDef;
import org.ro.view.table.IconRenderer;
import org.ro.view.table.ObjectIconRenderer;
import org.ro.view.table.TableBuilder;
import org.ro.xhr.RequestLog;
import org.ro.xhr.XhrLogEntry;

import spark.components.DataGrid;

public class RoTab extends VBox implements IDockable {

    internal var dg:DataGrid = new DataGrid();

    public function RoTab(dataProvider:ObjectList, title:String, icon:Class) {
        this.init(dataProvider, title, icon);
    }

    private function init(dataProvider:ObjectList, title:String, icon:Class):void {
        this.id = title;
        this.label = title;
        this.icon = icon;
        dg.percentWidth = 100;
        dg.percentHeight = 100;
        //TODO render _Object_ with LinkButton
        const layout:Layout = dataProvider.getLayout();
        var csList:Array = colSpec(layout);
        dg = TableBuilder.buildDataGrid(csList);
        initData(dataProvider);

        dg.doubleClickEnabled = true;
        dg.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClickHandler);
        //dg.horizontalScrollPolicy = "auto";  // for AdvancedDataGrid only
        dg.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
        this.addChild(dg);
        resizeColumns();
        toolTip = "Double click (label) to close or invoke menu on selected item."
    }

    private function initData(dataProvider:ObjectList):void {
        dg.dataProvider = dataProvider.forDataGrid();
    }

    private function mouseWheelHandler():void {
        systemManager.addEventListener("mouseWheel", bumpDelta, true);

        function bumpDelta(event:MouseEvent):void {
            event.delta *= 20;
        }
    }

    /* forces columns to size themselves properly */
    private function resizeColumns():void {
        dg.validateNow();
        for each (var column:DataGridColumn in dg.columns) {
            column.width = column.width;
        }
    }

    protected function doubleClickHandler(event:MouseEvent):void {
        var item:Object = dg.selectedItem;
        if (item == null) {
            doubleClickHandlerMenu(event);
        } else if (isLink(item)) {
            //TODO should 'edit' be the default action - 
            // or is a context menu with actions more consistent?
            var link:Link = item.object.adaptee;
            var url:String = link.getHref();
            var log:RequestLog = Globals.getInstance().getLog();
            var le:XhrLogEntry = log.find(url);
            if (le == null) {
                // this is (only?) required for Fixture Objects
                link.invoke();
                new Message("Object " + url + " has just been loaded - please retry.");
            } else {
                var tObj:TObject = le.getObject();
                var tab:DetailsTab = new DetailsTab(tObj);
                Globals.getInstance().getView().getTabs().open(tab);
            }
        } else {
            Alert.show("Define Link to be invoked");
        }
    }

    private function isLink(item:*):Boolean {
        var typeSpec:String = item.object.typeSpec;
        return (typeSpec == "Link");
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

    private static function colSpec(layout:Layout):Array {
        var csList:Array = [];
        if (layout != null) {
            var field:String = "icon";
            var width:uint = 2;
            var name:String = " ";
            var tip:String = null;
            var iconFactory:ClassFactory = new ClassFactory(IconRenderer);
            //TODO take icon from layout (default=box), pass icon:Class instead of new ClassFactory(IconRenderer)
            var cs:ColDef = new ColDef(field, width, name, tip, iconFactory);
            csList.push(cs);

            var properties:Vector.<PropertyLayout> = layout.getProperties();
            for each(var pl:PropertyLayout in properties) {
                field = pl.getId();
                width = pl.getTypicalLength();
                name = layout.getPropertyLabel(field);
                tip = pl.getDescribedAs();
                cs = new ColDef(field, width, name, tip);
                if (name == "Result") {
                    iconFactory = new ClassFactory(ObjectIconRenderer);
                    cs = new ColDef(field, width, name, tip, iconFactory);
                }
                csList.push(cs);
            }
        }
        return csList;
    }

}
}