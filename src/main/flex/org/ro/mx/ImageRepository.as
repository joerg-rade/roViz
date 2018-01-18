package org.ro.mx {
public class ImageRepository {

    [Embed('../../../../resources/images/history.svg')]
    public static var LogIcon:Class;

    [Embed('../../../../resources/images/check-circle.svg')]
    public static var GreenIcon:Class;

    [Embed('../../../../resources/images/question-circle.svg')]
    public static var YellowIcon:Class;

    [Embed('../../../../resources/images/times-circle.svg')]
    public static var RedIcon:Class;

    [Embed('../../../../resources/images/cubes.svg')]
    public static var ObjectsIcon:Class;

    [Embed("../../../../resources/images/pencil-alt.svg")]
    public static var PencilIcon:Class;

    [Embed("../../../../resources/images/Magere_Brug_isis.png")]
    public static var AboutImage:Class;

    [Embed("../../../../resources/images/calendar.svg")]
    public static var CalendarIcon:Class;

    [Embed("../../../../resources/images/check.svg")]
    public static var CheckIcon:Class;

    [Embed("../../../../resources/images/times.svg")]
    [Bindable]
    public var TimesIcon:Class;

    [Embed("../../../../resources/images/step-forward.svg")]
    public static var StepForwardIcon:Class;

    [Embed("../../../../resources/images/step-backward.svg")]
    public static var StepBackwardIcon:Class;

    public function ImageRepository() {
    }
}
}
