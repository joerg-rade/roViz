package org.ro.core {
public class Utils {

    public static function endsWith(obj:String, qry:String):Boolean {
        var qLen:uint = qry.length;
        var oLen:uint = obj.length;
        if (qLen > oLen) {
            return false;
        }
        var end:String = obj.substr(oLen - qLen, oLen);
        return (end == qry);
    }

    public static function camelCase(input:String):String {
        var firstChar:String = input.charAt(0).toUpperCase();
        var output:String = firstChar + input.substr(1, input.length);
        return output;
    }

    public static function deCamel(input:String):String {
        var output:String = "";
        var c:String;
        for (var i:uint = 0; i < input.length; i++) {
            c = input.charAt(i);
            if (i == 0) {
                output += c.toUpperCase();
            } else {
                if (c.toUpperCase() == c) {
                    c = " " + c;
                }
                output += c;
            }
        }
        return output;
    }

    public static function isEmptyObject(obj:Object):Boolean {
        return JSON.stringify(obj) === '{}';
    }

    // https://stackoverflow.com/questions/15816008/in-as3-how-to-check-if-two-json-objects-are-equal
    public static function areEqual(a:Object, b:Object):Boolean {
        if (a === null || a is Number || a is Boolean || a is String) {
            // Compare primitive values.
            return a === b;
        } else {
            var p:*;
            for (p in a) {
                // Check if a and b have different values for p.
                if (!areEqual(a[p], b[p])) {
                    return false;
                }
            }
            for (p in b) {
                // Check if b has a value which a does not.
                if (!a[p]) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

}
}
