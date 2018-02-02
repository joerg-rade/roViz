package org.ro.xhr {
import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.collections.ArrayList;
import mx.containers.VBox;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.core.ClassFactory;
import mx.events.MenuEvent;

import org.ro.core.Globals;
import org.ro.mx.IDockable;

import spark.components.DataGrid;
import spark.components.gridClasses.GridColumn;

public class RoDataGrid extends VBox implements IDockable {
    private var roContextMenu:Menu;
    private var dataProvider:ArrayCollection;
    private var dg:DataGrid;

    public function RoDataGrid() {
    }

    public function init(dataProvider:Vector.<XhrLogEntry>, title:String, icon:Class):void {
        this.id = title;
        this.label = title;
        this.icon = icon;
        this.horizontalScrollPolicy = "auto";
        dg = buildDataGrid();
        initData(dataProvider);
        this.roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);
        this.addChild(dg);
        Globals.getViewRegistry().add("1", this);
    }

    private function initData(dataProvider:Vector.<XhrLogEntry>):void {
        this.dataProvider = toArrayCollection(dataProvider);
        dg.dataProvider = this.dataProvider;

        function toArrayCollection(vector:Vector.<XhrLogEntry>):ArrayCollection {
            var ac:ArrayCollection = new ArrayCollection();
            for each(var le:XhrLogEntry in vector) {
                if (le.visible)
                    ac.addItem(le);
            }
            return ac;
        }
    }

    private function buildDataGrid():DataGrid {
        var grid:DataGrid = new DataGrid();
        grid.percentWidth = 100;
        grid.percentHeight = 100;
        grid.doubleClickEnabled = true;
        grid.selectionMode = "multipleRows";

        var nameCol:GridColumn = new GridColumn("Url");
        nameCol.percentWidth = 30;
        nameCol.dataField = "url";
        nameCol.dataTipField = "url";
        nameCol.showDataTips = true;

        var methodCol:GridColumn = new GridColumn("method");
        methodCol.percentWidth = 3;
        methodCol.dataField = "method";

        var startCol:GridColumn = new GridColumn("start");
        startCol.percentWidth = 7;
        startCol.dataField = "start";
        startCol.dataTipField = "startDate";
        startCol.showDataTips = true;

        var reqLenCol:GridColumn = new GridColumn("req.len");
        reqLenCol.percentWidth = 3;
        reqLenCol.dataField = "requestLength";

        var offsetCol:GridColumn = new GridColumn("offset");
        offsetCol.percentWidth = 4;
        offsetCol.dataField = "offset";

        var durationCol:GridColumn = new GridColumn("duration");
        durationCol.percentWidth = 3;
        durationCol.dataField = "duration";

        var respLenCol:GridColumn = new GridColumn("resp.len");
        respLenCol.percentWidth = 5;
        respLenCol.dataField = "responseLength";
        respLenCol.dataTipField = "response";
        respLenCol.showDataTips = true;

        var graphCol:GridColumn = new GridColumn("Chart");
        graphCol.itemRenderer = new ClassFactory(BarRenderer);
        graphCol.percentWidth = 60;

        var cols:ArrayList = new ArrayList();
        cols.addItem(nameCol);

        cols.addItem(methodCol);
        cols.addItem(reqLenCol);
        cols.addItem(startCol);
        cols.addItem(offsetCol);
        cols.addItem(durationCol);
        cols.addItem(respLenCol);
        cols.addItem(graphCol);
        grid.columns = cols;

        return grid;
    }

    public function buildContextMenu():Menu {
        var xml:XML =
                <root>
                    <menuitem id="hide" icon="EyeSlashIcon" label="hide"/>
                    <menuitem id="show" icon="EyeIcon" label="show all"/>
                </root>;
        var result:Menu = Menu.createMenu(null, xml, false);
        result.labelField = "@label";
        result.iconField = "@icon";
        //m.setStyle("color", "0xC0504D");  text can be colored, but not the menu background
        result.addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
        return result;
    }

    public function contextMenuHandler(event:MouseEvent):void {
        event.stopPropagation();
        roContextMenu.show(mouseX, mouseY);
    }

    public function hideContextMenu(event:MouseEvent):void {
        roContextMenu.hide();
    }

    public function itemClickHandler(event:MenuEvent):void {
        var items:Vector.<Object> = dg.selectedItems;
        var id:String = event.item.@id;
        if (id === "hide") {
            hideLogEntries(items);
        } else if (id === "show") {
            showAllLogEntries();
        } else {
            Alert.show(event.toString());
        }

        function hideLogEntries(items:Vector.<Object>):void {
            var le:XhrLogEntry;
            for each (var o:Object in items) {
                le = o as XhrLogEntry;
                le.visible = false;
            }
            var log:XhrLog = Globals.getDsp().log;
            log.reset();
            initData(log.getEntries());
            dg.validateNow();
        }

        function showAllLogEntries():void {
            var log:XhrLog = Globals.getDsp().log;
            log.showAll();
            initData(log.getEntries());
            dg.validateNow();
        }
    }


    public function getIcon():Class {
        return icon;
    }

}
}
