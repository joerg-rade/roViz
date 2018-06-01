package org.ro.xhr {
import org.ro.core.Globals;
import org.ro.to.TObject;
import org.ro.view.ImageRepository;

public class LogEntry {
    public var icon:Class;
    public var url:String;
    public var urlTitle:String;
    public var method:String;
    public var start:uint;
    public var createdAt:Date;
    public var updatedAt:Date;
    public var lastAccessedAt:Date;
    public var offset:uint;
    public var fault:String;
    public var request:String;    //TODO
    public var requestLength:uint;
    public var responseLength:uint;
    public var response:String;
    public var duration:int = 0;
    public var tObject:TObject;
    internal var visible:Boolean = true;
    public var cacheHits:uint = 0;

    public function LogEntry(url:String, method:String, body:String) {
        this.createdAt = new Date();
        this.start = createdAt.time;
        this.url = url;
        this.urlTitle = stripHostPort(url);
        this.method = method;
        this.request = body;
        if (body != null) {
            this.requestLength = body.length;
        }
        this.icon = ImageRepository.YellowIcon;
    }

    // alternative constructor for UI events (eg. from user interaction)
    public static function create(description:String):LogEntry {
        var le:LogEntry = new LogEntry(description, null, null);
        le.icon = ImageRepository.BlueIcon;
        return le;
    }

    internal function calculate():void {
        this.duration = updatedAt.time - start;
        var logStartTime:int = Globals.getInstance().getLog().getLogStartTime();
        this.offset = start - logStartTime;
    }

    public function setError(fault:String):void {
        this.updatedAt = new Date();
        this.calculate();
        this.fault = fault;
        this.icon = ImageRepository.RedIcon;
    }

    public function setSuccess(response:String):void {
        this.updatedAt = new Date();
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

    // region response
    /**
     * This is for access from the views only.
     * DomainObjects have to use retrieveResponse, 
     * since we want to have access statistics 
     * and an cache function.
     * @return
     */
    public function getResponse():String {
        return response;
    }
    public function retrieveResponse():String {
        cacheHits = cacheHits + 1;
        return response;
    }
    //end region response
    
    public function getObject():TObject {
        return tObject;
    }

    public function stripHostPort(url:String):String {
        var result:String = url;
        result = result.replace("http://localhost:8080/restful/", "");
        return result;
    }

    public function printString():String {
        var result:String = "[";
        result += "url: " + url + "\\n";
        result += "arguments: " + request + "\\n";
        result += "response: " + response + "]";
        return result;
    }

}
}
