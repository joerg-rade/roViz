package org.ro.core {
public class StringUtils {

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

}
}
