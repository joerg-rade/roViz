package org.ro.to {
import org.ro.core.Adaptable;
import org.ro.core.ObjectAdapter;
import org.ro.core.Utils;

dynamic public class TObject extends TitledTO implements Adaptable {
    public var domainType:String;
    public var instanceId:uint;

    public function TObject(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromJSON(jsonObj);
            init();
        }
    }

    /*    override protected function init():void {
            super.init();
        }    */

    //TODO eventually pull up
    public function getLayoutLink():Link {
        var href:String;
        for each(var l:Link in linkList) {
            href = l.getHref();
            //TODO can be "object-layout" >= 1.16
            if (Utils.endsWith(href, "layout")) {
                return l;
            }
        }
        return null;
    }

    public function getDomainType():String {
        return this.domainType;
    }

    public function getId():String {
        return domainType + "/" + instanceId;
    }

    public function getProperties():Vector.<Invokeable> {
        var result:Vector.<Invokeable> = new Vector.<Invokeable>();
        for each(var m:Member in memberList) {
            if (m.memberType == Member.PROPERTY) {
                result.push(m);
            }
        }
        return result;
    }

    /**
     * @param members (attributes and functions) of the object
     */
    public static function createObject(members:Vector.<Invokeable>):TObject {
        var o:TObject = new TObject();
        for each(var m:Member in members) {
            if (m.getMemberType() == Member.PROPERTY) {
                addAsProperty(o, m);
            }
        }
        return o;
    }

    private static function addAsProperty(dynObj:TObject, property:Member):void {
        var attribute:Object = null;
        var value:Object = property.getValue();
        if (value != null) {
            var typeSpec:Class = property.getType();
            attribute = new typeSpec(value);
        }
        // if value={} (ie. of class Object), 
        // it is represented as [object Object] 
        if (value == "[object Object]") {
            var link:Link = new Link(value);
            attribute = new ObjectAdapter(link, link.getTitle(), "Link");
        }
        var key:String = property.getId();
        dynObj[key] = attribute;
    }

}
}
