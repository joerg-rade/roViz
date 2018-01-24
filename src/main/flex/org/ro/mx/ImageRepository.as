package org.ro.mx {
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

    [Embed('../../../../resources/images/cubes.svg')]
    [Bindable]
    public static var ObjectsIcon:Class;

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
    public var TimesIcon:Class;

    [Embed("../../../../resources/images/step-forward.svg")]
    [Bindable]
    public static var StepForwardIcon:Class;

    [Embed("../../../../resources/images/step-backward.svg")]
    [Bindable]
    public static var StepBackwardIcon:Class;

    public function ImageRepository() {
    }
}
}
