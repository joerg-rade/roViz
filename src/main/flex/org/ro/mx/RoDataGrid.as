package org.ro.mx {
import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.collections.ArrayList;
import mx.containers.VBox;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.core.ClassFactory;
import mx.events.MenuEvent;

import spark.components.DataGrid;
import spark.components.gridClasses.GridColumn;

public class RoDataGrid extends VBox implements IDockable {
    var roContextMenu:Menu;
    var dataProvider:ArrayCollection;
    var dg:DataGrid;

    public function RoDataGrid() {
    }

    public function init(dataProvider:ArrayCollection, title:String, icon:Class):void {
        this.id = title;
        this.label = title;
        this.icon = icon;
        this.horizontalScrollPolicy = "auto";
        dg = buildDataGrid();
        this.dataProvider = dataProvider;
        dg.dataProvider = this.dataProvider;
        this.roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);
        this.addChild(dg);
    }

    private static function buildDataGrid():DataGrid {
        var grid:DataGrid = new DataGrid();
        grid.percentWidth = 100;
        grid.percentHeight = 100;
        grid.doubleClickEnabled = true;
        grid.selectionMode = "multipleRows";

        var nameCol:GridColumn = new GridColumn("Url");
        nameCol.percentWidth = 30;
        nameCol.dataField = "url";

        var startCol:GridColumn = new GridColumn("start");
        startCol.percentWidth = 5;
        startCol.dataField = "start";

        var offsetCol:GridColumn = new GridColumn("offset");
        offsetCol.percentWidth = 5;
        offsetCol.dataField = "offset";

        var durationCol:GridColumn = new GridColumn("duration");
        durationCol.percentWidth = 3;
        durationCol.dataField = "duration";

        var sizeCol:GridColumn = new GridColumn("size");
        sizeCol.percentWidth = 3;
        sizeCol.dataField = "size";

        var graphCol:GridColumn = new GridColumn("Chart");
        graphCol.itemRenderer = new ClassFactory(BarRenderer);
        graphCol.percentWidth = 60;

        var cols:ArrayList = new ArrayList();
        cols.addItem(nameCol);
        cols.addItem(startCol);
        cols.addItem(offsetCol);
        cols.addItem(durationCol);
        cols.addItem(sizeCol);
        cols.addItem(graphCol);
        grid.columns = cols;

        return grid;
    }

    public function buildContextMenu():Menu {
        var xml:XML =
                <root>
                    <menuitem id="delete" icon="TimesRedIcon" label="Delete"/>
                </root>;
        var result:Menu = Menu.createMenu(null, xml, false);
        result.labelField = "@label";
        result.iconField = "@icon";
        //m.setStyle("color", "0xC0504D");  text can be colored, but not the menu background
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
            var selectedItems:Vector.<Object> = dg.selectedItems;
            for each (var o:Object in selectedItems) {
                dataProvider.removeItem(o);
            }
        } else {
            Alert.show(event.toString());
        }
    }

    public function getIcon():Class {
        return icon;
    }
    
}
}