package org.ro.layout {
import mx.containers.VBox;

/**
 * Parse layout specification.
 * In case of non-menu layout, build a UIComponent.
 */
public class Layout extends AbstractLayout {

    internal var row:Object; // which actually is a list of rows

    public var rows:Vector.<RowLayout>;

    public function Layout(jsonObj:Object = null) {
        fromObject(jsonObj);
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
        //FIXME this qualifies as train.wreck ... and must be refactored
//        var s:Object = findPropertyBy(row, "fieldSet");
        var col:Object = row[1].cols[0].col;
        if (col.hasOwnProperty("tabGroup")) {
            // special case for json1
            col = col.tabGroup[0].tab[0].row[0].cols[0].col;
        }
        var pArr:Array = col.fieldSet[0].property;

        var result:Vector.<PropertyLayout> = new Vector.<PropertyLayout>();
        var pl:PropertyLayout;
        for each(var json:Object in pArr) {
            pl = new PropertyLayout(json);
            result.push(pl);
        }
        return result;
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
            } else if ((o is Object) || (o is Array)) {
                return true;
            } else {
                return false;
            }
        }

        function isNamed(o:Object):Boolean {
            if ((o == null) || (o is String)) {
                return false;
            } else if ((o.hasOwnProperty("col")) || (o.hasOwnProperty("tabGroup"))) {
                return true;
            } else {
                return false;
            }
        }

    }


}
}
