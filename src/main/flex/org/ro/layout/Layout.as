package org.ro.layout {
import mx.containers.VBox;

/**
 * Parse layout specification.
 * In case of non-menu layout, build a UIComponent.
 */
public class Layout extends AbstractLayout {
    private const TAB_GROUP:String = "tabGroup";

    internal var row:Object; // which actually is a list of rows
    internal var rows:Vector.<RowLayout>;
    private var properties:Vector.<PropertyLayout>;
    private var propertyLabels:Object = {};

    public function Layout(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        var props:Array = extractProperties();
        initProperties(props);
        initRows(row);

        //TODO refactor train.wreck.s  
        // var s:Object = findPropertyBy(row, "fieldSet");
        function extractProperties():Array {
            var col:Object = row[1].cols[0].col;
            if (col.hasOwnProperty(TAB_GROUP)) {
                // special case for json1
                col = col.tabGroup[0].tab[0].row[0].cols[0].col;
            }
            var pArr:Array = col.fieldSet[0].property;
            return pArr;
        }
    }

    private function initProperties(props:Array):void {
        this.properties = new Vector.<PropertyLayout>();
        var l:PropertyLayout;
        for each(var json:Object in props) {
            l = new PropertyLayout(json);
            this.properties.push(l);
        }
    }

    private function initRows(row:Object):void {
        this.rows = new Vector.<RowLayout>();
        var l:RowLayout;
        for each(var json:Object in row) {
            l = new RowLayout(json);
            this.rows.push(l);
        }
    }
    
    public function addPropertyLabel(id:String, friendlyName:String):void {
        propertyLabels[id] = friendlyName;
    }

    public function getPropertyLabel(id:String):String {
        return propertyLabels[id];
    }

    public function arePropertyLabelsToBeSet():Boolean {
        var labelSize:uint = propertyLabels.length;
        var propsSize:uint = properties.length;
        return (labelSize < propsSize);
    }

    public function build():VBox {
        var result:VBox = new VBox();
        //TODO iterate over rows, recurse into columns, etc.
        for each(var r:RowLayout in rows) {
            result.addChild(r.build());
        }
        return result;
    }

    public function getProperties():Vector.<PropertyLayout> {
        return properties;
    }

    // recurse into attributes/fields/properties and 
    private function findPropertyBy(object:Object, name:String):Object {
        if (object.hasOwnProperty(name)) {
            return object[name];
        } else {
            for each(var o:Object in object) {
                if (isCollection(o) || isNamed(o)) {
                    return findPropertyBy(o, name);
                }
            }
        }
        return null;

        function isCollection(o:Object):Boolean {
            if ((o == null) || (o is String)) {
                return false;
            } else {
                return ((o is Object) || (o is Array));
            }
        }

        function isNamed(o:Object):Boolean {
            if ((o == null) || (o is String)) {
                return false;
            } else {
                return ((o.hasOwnProperty("col")) || (o.hasOwnProperty(TAB_GROUP)));
            }
        }
    }

}
}
