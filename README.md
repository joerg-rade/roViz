# About
roViz is a viewer for [Restful Objects] written in Actionscript/MXML, 
ie. a generic client for applications that implement the Restful Objects Specification. 
An [Apache Isis] application with the restful objects interface enabled 
([SimpleApp], [ToDoApp] , etc.) can be used for the server part. 

A [Naked Objects for .NET] application should work as well, but is not tested yet.

image::images/roViz-0.1.0.png[Preview]

## References
* [Restful Objects] http://www.restfulobjects.org/
* [Apache Flex] http://flex.apache.org/
* [Apache Isis] https://isis.apache.org/
* [SimpleApp]  https://github.com/apache/isis/tree/master/example/application/simpleapp
* [ToDoApp] https://github.com/isisaddons/isis-app-todoapp

##TODO's for the PoC
* Load and render single object 
* Parse and transform layout.xml 
* Implement Filtered Table (see: 
https://www.google.de/search?q=actionscript+datagrid+filter&ie=UTF-8, 
https://stackoverflow.com/questions/10486218/how-to-add-a-working-stextinput-to-a-sdatagrid-headerrenderer)
* Gantt Chart for objects conforming to 'protocol' timelineable (start/stop begin/end)
* Transpile to Javascript (see: FlexJs https://cwiki.apache.org/confluence/display/FLEX/FlexJS)

## Tool Chain
* Apache Flex 1.16.1 
* IntelliJ 2017.2 (Ultimate)
* Moz://a FireFox 52 ESR
* Adobe FlashDebugger 27
* Windows 7

### GotChas
* Apache Flex could no be installed due to a firewall issue. Workaround: manual download and unzip.
* Browser (FF) was only showing a white page, browser debugger indicated: "ReferencEerror: swfobject is not defined"
In order for index.template.html to open the application, swfobject.js had to be placed in /html-template
see: http://ebanshi.cc/questions/5161462/how-to-integrate-flowplayer-in-extjs-4-1

https://helpx.adobe.com/flash-player/kb/configure-debugger-version-flash-player.html
http://www.filehorse.com/download-adobe-flash-player-debugger-firefox/

### Helpful Resources:
* https://stackoverflow.com/questions/5536420/intellij-idea-actionscript-project-cannot-connect-debugger-version-of-flash
* https://intellij-support.jetbrains.com/hc/en-us/community/posts/115000241004-IntelliJ-Flash-Debugger
* http://home.apache.org/~aharui/FlexJSWorldTour/FlexJS%20World%20Tour%20SF.pptx
* http://edutechwiki.unige.ch/en/Flash_datagrid_component_tutorial

## Out of Scope for the POC
* use FotAwesome 5 icons (via svg or *.js)
* scale svg's: https://stackoverflow.com/questions/5388290/how-to-display-svg-in-flex/5388543#5388543
* FlatSpark skins: do not support Menubar icons right now, see: https://cwiki.apache.org/confluence/display/FLEX/Using+FlatSpark+skins
* use SQL lite as store for url/credentials
* 'collapse' tabs into top/left/right/bootom area / dock
* drag & drop
* Visualizing Geolocations like in Google Maps, see: 
** https://cohaesus.co.uk/finding-a-new-way-six-alternatives-to-google-maps/
** http://wiki.openstreetmap.org/wiki/Potlatch_2
* Cairngorm FW: http://svn.code.sf.net/adobe/cairngorm/code/





