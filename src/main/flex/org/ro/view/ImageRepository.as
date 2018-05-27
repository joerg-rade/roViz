package org.ro.view {
public class ImageRepository {

    [Embed('../../../../resources/images/history.svg')]
    [Bindable]
    public static var LogIcon:Class;

    [Embed('../../../../resources/images/check-circle.svg')]
    [Bindable]
    public static var GreenIcon:Class;

    [Embed('../../../../resources/images/question-circle.svg')]
    [Bindable]
    public static var YellowIcon:Class;

    [Embed('../../../../resources/images/times-circle.svg')]
    [Bindable]
    public static var RedIcon:Class;

    [Embed('../../../../resources/images/info-circle.svg')]
    [Bindable]
    public static var BlueIcon:Class;

    [Embed('../../../../resources/images/cubes.svg')]
    [Bindable]
    public static var ObjectsIcon:Class;

    [Embed('../../../../resources/images/cube.svg')]
    [Bindable]
    public static var ObjectIcon:Class;

    [Embed("../../../../resources/images/pencil-alt.svg")]
    [Bindable]
    public static var PencilIcon:Class;

    [Embed("../../../../resources/images/Magere_Brug_isis.png")]
    [Bindable]
    public static var AboutImage:Class;

    [Embed("../../../../resources/images/calendar.svg")]
    [Bindable]
    public static var CalendarIcon:Class;

    [Embed("../../../../resources/images/check.svg")]
    [Bindable]
    public static var CheckIcon:Class;

    [Embed("../../../../resources/images/times.svg")]
    [Bindable]
    public static var TimesIcon:Class;

 //TODO check when App.mxml is the right place for icons ...
    
    public function ImageRepository() {
    }
}
}
