package org.ro.xhr {
import mx.controls.Image;

public class XhrLogEntry {
    public var icon:Class;
    public var url:String;
    public var start:Date;
    public var fault:String;
    public var size:int;
    public var duration:int = 0;

    public function XhrLogEntry() {
    }

    public function getColorCode():String {
        if (fault != null) {
            return "#C0504D"; //red
        } else if (duration == 0) {
            return "#F79646"; //orange 
        } else {
            return "#9BBB59"; // green
        }
    }
}
}
