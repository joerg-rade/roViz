package org.ro.view.tab {
import flash.events.MouseEvent;

import mx.controls.Menu;
import mx.controls.dataGridClasses.DataGridColumn;
import mx.core.ClassFactory;

import org.ro.core.DisplayManager;
import org.ro.core.event.EventLog;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectAdapter;
import org.ro.core.model.ObjectList;
import org.ro.layout.Layout;
import org.ro.layout.PropertyLayout;
import org.ro.to.Link;
import org.ro.view.ImageRepository;
import org.ro.view.table.ColDef;
import org.ro.view.table.IconRenderer;
import org.ro.view.table.ObjectIconRenderer;
import org.ro.view.table.TableBuilder;

import spark.components.DataGrid;

public class ListTab extends BaseTab {
    private var log:EventLog = EventLog.getInstance();

    internal var dg:DataGrid = new DataGrid();

    public function ListTab(list:ObjectList) {
        this.label = list.tag();
        this.icon = ImageRepository.ObjectsIcon;
        dg.percentWidth = 100;
        dg.percentHeight = 100;

        const layout:Layout = list.getLayout();
        var csList:Array = colSpec(layout);
        dg = TableBuilder.buildDataGrid(csList);
        initData(list);

        dg.doubleClickEnabled = true;
        dg.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClickHandler);
        //dg.horizontalScrollPolicy = "auto";  // for AdvancedDataGrid only
        dg.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
        this.addChild(dg);
        toolTip = "Double click (label) to close or invoke menu on selected item."
    }

    private function initData(dataProvider:ObjectList):void {
        dg.dataProvider = dataProvider.asArrayList();
    }

    /* forces columns to size themselves properly */
    private function resizeColumns():void {
        dg.validateNow();
        for each (var column:DataGridColumn in dg.columns) {
            column.width = column.width;
        }
    }

    //TODO should 'edit' be the default action - 
    // or is a context menu with actions more consistent?
    //FIXME needs refactoring, avoid to refer to Globals
    protected function doubleClickHandler(event:MouseEvent):void {
        var item:Object = dg.selectedItem;
        if (item == null) {
            trace("item is null, open menu");
            doubleClickHandlerMenu(event);
        } else if (item is ObjectAdapter) {
            trace("item is ObjectAdapter, about to open");
            var oa:ObjectAdapter = item as ObjectAdapter;
            DisplayManager.addView(oa);
        } else if (isLink(item)) {
            trace("item is Link, about to invoke");
            var link:Link = item.object.adaptee;
            var url:String = link.getHref();
            var le:LogEntry = log.find(url);
            if (le == null) {
                // this is (only?) required for Fixture Objects
                link.invoke();
            }
        } else {
            trace("item is neither null nor link nor ObjectAdapter");
        }
    }

    private static function isLink(item:*):Boolean {
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
