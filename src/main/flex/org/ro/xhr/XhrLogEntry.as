package org.ro.xhr {
import org.ro.core.Globals;
import org.ro.mx.ImageRepository;

public class XhrLogEntry {
    public var icon:Class;
    public var url:String;
    public var urlTitle:String;
    public var method:String;
    public var start:uint;
    public var startDate:Date;
    public var endDate:Date;
    public var offset:uint;
    public var fault:String;
    public var request:String;    //TODO
    public var requestLength:uint;
    public var responseLength:uint;
    public var response:String;
    public var duration:int = 0;
    internal var visible:Boolean = true;
    public var cacheHits:uint = 0;

    public function XhrLogEntry(url:String, method:String, body:String) {
        this.startDate = new Date();
        this.start = startDate.time;
        this.url = url;
        this.urlTitle = stripHostPort(url);
        this.method = method;
        this.request = body;
        if (body != null) {
            this.requestLength = body.length;
        }
        this.icon = ImageRepository.YellowIcon;
    }

    internal function calculate():void {
        this.duration = endDate.time - start;
        var logStartTime:int = Globals.getInstance().getLog().getLogStartTime();
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
        // TODO format output more nicely, eventually have tooltip render it?
        this.response = response; //.replace("\r\n", "");
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

    public function getResponse():String {
        return response;
    }

    public function retrieveResponse():String {
        cacheHits = cacheHits + 1;
        return response;
    }

    public function stripHostPort(url:String):String {
        var result:String = url;
        result = result.replace("http://localhost:8080/restful/", "");
        return result;
    }
    
    public function printString():String {
        var result:String = "[";
        result += "url: "+ url + "\n";
        result += "arguments: " + request + "\n";
        result +=  "response: " + response + "]";
        return result;
    }

}
}
