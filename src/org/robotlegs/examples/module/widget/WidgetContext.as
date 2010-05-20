package org.robotlegs.examples.module.widget
{
    import flash.display.DisplayObjectContainer;
    
    import org.robotlegs.core.IInjector;
    import org.robotlegs.examples.module.model.vo.ModuleVO;
    import org.robotlegs.examples.module.widget.view.WidgetModule;
    import org.robotlegs.examples.module.widget.view.model.WidgetModel;
    import org.robotlegs.mvcs.Context;

    public class WidgetContext extends Context
    {
        private var _config:ModuleVO;

        public function WidgetContext(config:ModuleVO, contextView:DisplayObjectContainer, parentInjector:IInjector, autoStart:Boolean=true)
        {
            super(contextView, false);

            _config = config;
            if (parentInjector) {
                super.injector = parentInjector.createChild();
            }
            // Remap with new injector
            mapInjections();
            if (autoStart) {
                _autoStartup = true;
                checkAutoStartup();
            }
        }
        
        public override function startup():void
        {
            viewMap.mapType(WidgetModule);

            injector.mapSingleton(WidgetModel);

            injector.mapValue(ModuleVO, _config);
        }

        
    }
}