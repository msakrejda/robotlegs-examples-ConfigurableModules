package org.robotlegs.examples.module.model.vo
{
    [Bindable]
    public class ModuleVO
    {
        public var title:String;
        public var color:uint;

        public function ModuleVO(title:String, color:uint)
        {
            this.title = title;
            this.color = color;
        }

    }
}