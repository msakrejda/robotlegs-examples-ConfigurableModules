package org.robotlegs.examples.module.widget.view.model
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    
    import org.robotlegs.examples.module.model.vo.ModuleVO;
    import org.robotlegs.examples.module.signal.PokeModulesSignal;
    
    public class WidgetModel extends EventDispatcher
    {
        private var _config:ModuleVO;

        [Inject]
        public var pokeSignal:PokeModulesSignal;

        [Inject]
        public function set config(value:ModuleVO):void
        {
            _config = value;
            dispatchEvent(new Event('configChanged'));
        }
        
        [Bindable(event='configChanged')]
        public function get title():String
        {
            return _config.title;
        }
        
        [Bindable(event='configChanged')]
        public function get textColor():uint
        {
            var channels:Object = getRgb(_config.color);
            var textColor:uint = 0xffffff;
            for each (var channel:uint in channels) {
                if (channel > 0xCC) {
                    textColor = 0x000000;
                    break;
                }
            }

            return textColor;
        }
        
        [Bindable(event='configChanged')]
        public function get backgroundColor():uint
        {
            return _config.color;
        }        

        [Bindable(event='configChanged')]
        public function get description():String
        {
            const highThrehsold:uint = 192;
            const lowThrehsold:uint = 64;
            var channels:Object = getRgb(_config.color);
            
            if (channels.r > highThrehsold && channels.g < lowThrehsold && channels.b < lowThrehsold) {
                return 'a reddish module';
            } else if (channels.g > highThrehsold && channels.r < lowThrehsold && channels.b < lowThrehsold) {
                return 'a greenish module';
            } else if (channels.b > highThrehsold && channels.r < lowThrehsold && channels.g < lowThrehsold) {
                return 'a bluish module';
            } else {
                return 'a nondescript module';
            }
        }

        private function getRgb(color:uint):Object
        {
            return {
                r: (color >> 16) & 0xff,
                g: (color >> 8) & 0xff,
                b: color & 0xff
            };
        }

    }
}