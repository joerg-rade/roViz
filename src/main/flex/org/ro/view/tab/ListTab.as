package org.ro.view.tab {
import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.controls.Menu;
import mx.controls.dataGridClasses.DataGridColumn;
import mx.core.ClassFactory;

import org.ro.core.Globals;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectAdapter;
import org.ro.core.model.ObjectList;
import org.ro.layout.Layout;
import org.ro.layout.PropertyLayout;
import org.ro.to.Invokeable;
import org.ro.to.Link;
import org.ro.to.TObject;
import org.ro.view.ImageRepository;
import org.ro.view.table.ColDef;
import org.ro.view.table.IconRenderer;
import org.ro.view.table.ObjectIconRenderer;
import org.ro.view.table.TableBuilder;

import spark.components.DataGrid;

public class ListTab extends BaseTab {

    internal var dg:DataGrid = new DataGrid();

    public function ListTab(list:ObjectList) {
        var oa:ObjectAdapter = list.last();
        var objectType:String = oa.className;
        var title:String = objectType + " (" + list.length() + ")";
        this.id = title;
        this.label = title;
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

        HUB.logAdd(title);
    }

    private function initData(dataProvider:ObjectList):void {
        dg.dataProvider = dataProvider.asArrayCollection();
//        loadObjects();
        //FIXME how to load layouts afterwards? pars pro toto?
    }

    private function loadObjects():void {
        var tObject:TObject;
        var objectAdapter:ObjectAdapter;
        var link:Link;
        var href:String;
        var objLink:Link;
        for each (var oa:ObjectAdapter in dg.dataProvider) {
            //FIXME nested ObjectAdapter is a WTF. How comes - what is it for???
            // is it a leftover from the abstract FixtureScriptResult list only?
            // adaptable(TObject).object(ObjectAdapter).adaptee(Link).getHref(String)
            tObject = oa.adaptee as TObject;
            objectAdapter = tObject.object;
            link = objectAdapter.adaptee as Link;
            href = link.getHref();
            objLink = new Link();
            objLink.setHref(href);
            objLink.setMethod(Invokeable.GET);
            objLink.invoke();
        }
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
    protected function doubleClickHandler(event:MouseEvent):void {
        var item:Object = dg.selectedItem;
        if (item == null) {
            doubleClickHandlerMenu(event);
        } else if (item is ObjectAdapter) {
            var oa:ObjectAdapter = item as ObjectAdapter;
            Globals.getInstance().addObjectTab(oa);
        } else if (isLink(item)) {
            Alert.show("About to invoke Link");
            var link:Link = item.object.adaptee;
            var url:String = link.getHref();
            var le:LogEntry = HUB.logFind(url);
            if (le == null) {
                // this is (only?) required for Fixture Objects
                link.invoke();
            } else {
                //FIXME to be removed  ???
                Alert.show("About to open ObjectTab");
            }
        } else {
            Alert.show("item is neither null nor link nor ObjectAdapter");
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
