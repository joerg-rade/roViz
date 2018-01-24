package org.ro.core {
import mx.collections.ArrayCollection;

import org.ro.to.Member;

public class ObjectList {

    private var limit:int;
    private var count:int;
    public var list:Array;

    public function ObjectList(limit:int) {
        this.limit = limit;
        this.list = [];
    }

    public function init(members:ArrayCollection):Boolean {
        var object:Object = create(members);
        list.push(object);
        count = count + 1;
        return (count >= limit);
    }

    public static function create(members:ArrayCollection):Object {
        var result:Object = {};
        for each(var m:Member in members) {
            result[m.id] = m.value;
        }
        return result;
    }

}
}