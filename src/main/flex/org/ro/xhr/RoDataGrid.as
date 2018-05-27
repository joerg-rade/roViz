package org.ro.xhr {
import flash.events.Event;
import flash.events.MouseEvent;
import flash.system.System;

import mx.collections.ArrayCollection;
import mx.containers.VBox;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.core.ClassFactory;
import mx.events.MenuEvent;

import org.ro.core.Globals;
import org.ro.view.IDockable;
import org.ro.view.table.ColDef;
import org.ro.view.table.LogIconRenderer;
import org.ro.view.table.TableBuilder;

import spark.components.DataGrid;

public class RoDataGrid extends VBox implements IDockable {

    private static var cs0:ColDef = new ColDef("icon", 2, " ", null, new ClassFactory(LogIconRenderer));
    private static var cs1:ColDef = new ColDef("urlTitle", 30, "Url", "url");
    private static var cs2:ColDef = new ColDef("method", 3);
    private static var cs3:ColDef = new ColDef("start", 7, null, "startDate");
    private static var cs4:ColDef = new ColDef("requestLength", 3, "req.len", "request");
    private static var cs5:ColDef = new ColDef("offset", 4);
    private static var cs6:ColDef = new ColDef("duration", 3);
    private static var cs7:ColDef = new ColDef("responseLength", 5, "resp.len", "response");
    private static var cs8:ColDef = new ColDef("cacheHits", 2);
    private static var cs9:ColDef = new ColDef(null, 45, "Chart", null, new ClassFactory(BarRenderer));
    private static var CS_LIST:Array = [cs0, cs1, cs2, cs3, cs4, cs5, cs6, cs7, cs8, cs9];

    private var roContextMenu:Menu;
    private var dataProvider:ArrayCollection;
    private var dg:DataGrid;

    public function RoDataGrid(dataProvider:Vector.<LogEntry>, title:String, icon:Class) {
        this.id = title;
        this.label = title;
        this.icon = icon;
        this.horizontalScrollPolicy = "auto";
        dg = TableBuilder.buildDataGrid(CS_LIST);
        initData(dataProvider);
        this.roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);
        addEventListener(Event.COPY, onCopy);
        this.addChild(dg);
 //       Globals.instance.getViewRegistry().add("1", this);
    }

    private function initData(dataProvider:Vector.<LogEntry>):void {
        this.dataProvider = toArrayCollection(dataProvider);
        dg.dataProvider = this.dataProvider;

        function toArrayCollection(vector:Vector.<LogEntry>):ArrayCollection {
            var ac:ArrayCollection = new ArrayCollection();
            for each(var le:LogEntry in vector) {
                if (le.visible)
                    ac.addItem(le);
            }
            return ac;
        }
    }

    public function buildContextMenu():Menu {
        var xml:XML =
                <root>
                    <menuitem id="hide" icon="EyeSlashIcon" label="hide"/>
                    <menuitem id="show" icon="EyeIcon" label="show all"/>
                    <menuitem id="copy" icon="CheckIcon" label="copy"/>
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

    public function onCopy(event:Event):void {
        var item:Object = dg.selectedItem;
        var text:String = (item as LogEntry).url;
        System.setClipboard(text);
    }

    public function fullCopy():void {
        var item:Object = dg.selectedItem;
        var text:String = (item as LogEntry).printString();
        System.setClipboard(text);
    }

    /**
     *  @see https://stackoverflow.com/questions/11682914/ctrl-c-ctrl-v-and-ctrl-x-event-listener
     */
    public function onCrtl():void {
        //TODO
    }

    public function itemClickHandler(event:MenuEvent):void {
        var items:Vector.<Object> = dg.selectedItems;
        var id:String = event.item.@id;
        if (id === "hide") {
            hideLogEntries(items);
        } else if (id === "show") {
            showAllLogEntries();
        } else if (id === "copy") {
            fullCopy();
        } else {
            Alert.show(event.toString());
        }

        function hideLogEntries(items:Vector.<Object>):void {
            var le:LogEntry;
            for each (var o:Object in items) {
                le = o as LogEntry;
                le.visible = false;
            }
            var log:EventLog = Globals.getInstance().getLog();
            log.reset();
            initData(log.getEntries());
            dg.validateNow();
        }

        function showAllLogEntries():void {
            var log:EventLog = Globals.getInstance().getLog();
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
