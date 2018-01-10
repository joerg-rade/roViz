package org.ro.mx {
import mx.collections.ArrayCollection;
import mx.collections.ArrayList;
import mx.containers.VBox;
import mx.core.ClassFactory;

import spark.components.DataGrid;
import spark.components.gridClasses.GridColumn;

public class RoDataGrid extends VBox {

    public function RoDataGrid() {
    }

    public function init(dataProvider:ArrayCollection, title:String, icon:Class):void {
        this.id = title;
        this.label = title;
        this.icon = icon;
        this.horizontalScrollPolicy = "auto";
        var dg:DataGrid = buildDataGrid();
        dg.dataProvider = dataProvider;
        this.addChild(dg);
    }

    private static function buildDataGrid():DataGrid {
        var grid:DataGrid = new DataGrid();
        grid.percentWidth = 100;
        grid.percentHeight = 100;
        grid.doubleClickEnabled = true;

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
    
}
}