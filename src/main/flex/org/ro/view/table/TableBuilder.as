package org.ro.view.table {
import mx.collections.ArrayList;
import mx.core.ClassFactory;

import org.ro.xhr.BarRenderer;

import spark.components.DataGrid;
import spark.components.gridClasses.GridColumn;

public class TableBuilder {

    private static var cs0:ColumnSpecification = new ColumnSpecification("icon", 2, " ", null, new ClassFactory(IconRenderer));
    private static var cs1:ColumnSpecification = new ColumnSpecification("url", 30, "Url");
    private static var cs2:ColumnSpecification = new ColumnSpecification("method", 3);
    private static var cs3:ColumnSpecification = new ColumnSpecification("start", 7, null, "startDate");
    private static var cs4:ColumnSpecification = new ColumnSpecification("requestLength", 3, "req.len");
    private static var cs5:ColumnSpecification = new ColumnSpecification("offset", 4);
    private static var cs6:ColumnSpecification = new ColumnSpecification("duration", 3);
    private static var cs7:ColumnSpecification = new ColumnSpecification("responseLength", 5, "resp.len", "response");
    private static var cs8:ColumnSpecification = new ColumnSpecification(null, 45, "Chart", null, new ClassFactory(BarRenderer));
    private static var csList:Array = [cs0, cs1, cs2, cs3, cs4, cs5, cs6, cs7, cs8];

    public static function buildDataGrid():DataGrid {
        var grid:DataGrid = new DataGrid();
        grid.percentWidth = 100;
        grid.percentHeight = 100;
        grid.doubleClickEnabled = true;
        grid.selectionMode = "multipleRows";
        grid.columns = new ArrayList();
        var gc:GridColumn;
        for each(var cs:ColumnSpecification in csList) {
            gc = buildColumn(cs);
            grid.columns.addItem(gc);
        }
        return grid;
    }

    private static function buildColumn(cs:ColumnSpecification):GridColumn {
        var gc:GridColumn = new GridColumn(cs.getName());
        gc.dataField = cs.getField();
        gc.percentWidth = cs.getWidth();
        gc.showDataTips = cs.hasTip();
        gc.dataTipField = cs.getTip();
        gc.itemRenderer = cs.getRenderer();
        return gc;
    }

}
}
