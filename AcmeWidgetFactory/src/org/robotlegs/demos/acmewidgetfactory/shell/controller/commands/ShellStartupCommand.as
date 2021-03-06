package org.robotlegs.demos.acmewidgetfactory.shell.controller.commands
{
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.ILoggerModule;
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.IWidgetModule;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellLoggerEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.proxies.ActiveWidgetProxy;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.ControlPanelMediator;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.ControlPanelView;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.LoggerHolderMediator;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.LoggerHolderView;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.LoggerModuleMediator;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.WidgetHolderMediator;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.WidgetHolderView;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.WidgetModuleMediator;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class ShellStartupCommand extends Command
	{
		/**
		 * The Shell's Startup Command
		 *
		 * With larger contexts we'd split this up into separate commands, for example:
		 *
		 * PrepShellModelCommand
		 * PrepShellControllerCommand
		 * PrepShellServicesCommand
		 * PrepShellViewCommand
		 */
		override public function execute():void
		{
			// Controller
			commandFactory.mapCommand(ShellWidgetEvent.CREATE_WIDGET, CreateWidgetCommand);
			commandFactory.mapCommand(ShellWidgetEvent.POKE_WIDGET, PokeWidgetCommand);
			commandFactory.mapCommand(ShellWidgetEvent.REMOVE_WIDGET, RemoveWidgetCommand);
			commandFactory.mapCommand(ShellWidgetEvent.REMOVE_WIDGET_COMPLETE, UnregisterWidgetCommand);
			commandFactory.mapCommand(ShellLoggerEvent.CREATE_LOGGER, CreateLoggerCommand);
			
			// Model
			injector.bindSingleton(ActiveWidgetProxy);
			
			// View
			injector.bindValue( AcmeWidgetFactory, contextView );
			mediatorFactory.mapMediator(ControlPanelView, ControlPanelMediator);
			mediatorFactory.mapMediator(LoggerHolderView, LoggerHolderMediator);
			mediatorFactory.mapMediator(WidgetHolderView, WidgetHolderMediator);
			
			// Modules - notice FQCN::string style
			mediatorFactory.mapModuleMediator('org.robotlegs.demos.acmewidgetfactory.modules.logger::LoggerModule', ILoggerModule, LoggerModuleMediator);
			mediatorFactory.mapModuleMediator('org.robotlegs.demos.acmewidgetfactory.modules.widget::WidgetModule', IWidgetModule, WidgetModuleMediator);
			
			// Ready
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}