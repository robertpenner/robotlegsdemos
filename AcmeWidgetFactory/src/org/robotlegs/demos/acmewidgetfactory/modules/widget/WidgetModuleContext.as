package org.robotlegs.demos.acmewidgetfactory.modules.widget
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.adapters.SwiftSuspendersReflector;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.controller.WidgetStartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class WidgetModuleContext extends Context
	{
		public function WidgetModuleContext(contextView:DisplayObjectContainer)
		{
			super(contextView, new SwiftSuspendersInjector(), new SwiftSuspendersReflector());
		}
		
		override public function startup():void
		{
			// Map Startup Commands
			commandFactory.mapCommand(ContextEvent.STARTUP, WidgetStartupCommand, true);
			// And away we go!
			super.startup();
		}
	
	}
}