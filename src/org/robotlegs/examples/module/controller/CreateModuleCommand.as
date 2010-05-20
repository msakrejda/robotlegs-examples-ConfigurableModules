package org.robotlegs.examples.module.controller
{
    import org.robotlegs.examples.module.model.Modules;
    import org.robotlegs.examples.module.model.vo.ModuleVO;
    import org.robotlegs.mvcs.Command;

    public class CreateModuleCommand extends Command
    {
        [Inject]
        public var modules:Modules;
        [Inject]
        public var module:ModuleVO;
        
        public override function execute():void
        {
            modules.addModule(module);
        }
        
    }
}