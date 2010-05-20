package org.robotlegs.examples.module.widget.view.model
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    
    import org.robotlegs.examples.module.model.vo.ModuleVO;
    
    public class WidgetModel extends EventDispatcher
    {
        private var _config:ModuleVO;
        
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
        public function get color():uint
        {
            return _config.color;
        }

        [Bindable(event='configChanged')]
        public function get description():String
        {
            var r:uint = (_config.color & 0xff) >> 16;
            var g:uint = (_config.color & 0xff) >> 8;
            var b:uint = _config.color & 0xff;
            if (r > 192 && g < 32 && b < 32) {
                return 'a reddish module';
            } else if (g > 192 && r < 32 && b < 32) {
                return 'a greenish module';
            } else if (b > 192 && r < 32 && g < 32) {
                return 'a bluish module';
            } else {
                return 'a nondescript module';
            }
        }

        

    }
}