package org.ro.xhr {
import org.ro.core.Globals;
import org.ro.mx.ImageRepository;

public class XhrLogEntry {
    public var icon:Class;
    public var url:String;
    public var method:String;
    public var start:uint;
    public var startDate:Date;
    public var endDate:Date;
    public var offset:uint;
    public var fault:String;
    public var requestLength:uint;
    public var responseLength:uint;
    public var response:String;
    public var duration:int = 0;
    internal var visible:Boolean = true;

    public function XhrLogEntry(url:String, method:String, requestLength:uint) {
        this.startDate = new Date();
        this.start = startDate.time;
        this.url = url;
        this.method = method;
        this.requestLength = requestLength;
        this.icon = ImageRepository.YellowIcon;
    }

    internal function calculate():void {
        this.duration = endDate.time - start;
        var logStartTime:int = Globals.getDsp().log.getLogStartTime();
        this.offset = start - logStartTime;
    }

    public function setError(fault:String):void {
        this.endDate = new Date();
        this.calculate();
        this.fault = fault;
        this.icon = ImageRepository.RedIcon;
    }

    public function setSuccess(response:String):void {
        this.endDate = new Date();
        this.calculate();
        this.response = response;
        this.responseLength = response.length;
        this.icon = ImageRepository.GreenIcon;
    }

    public function toString():String {
        var s:String = url + "/n";
        s = s + method + "/n";
        return s;
    }

    internal function setVisible(bool:Boolean):void {
        this.visible = bool;
    }

}
}
