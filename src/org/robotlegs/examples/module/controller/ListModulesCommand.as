package org.robotlegs.examples.module.controller
{
    import org.robotlegs.examples.module.model.Modules;
    import org.robotlegs.mvcs.Command;

    public class ListModulesCommand extends Command
    {
        [Inject]
        public var modules:Modules;
        
        public override function execute():void
        {
            modules.listModules();
        }
        
    }
}