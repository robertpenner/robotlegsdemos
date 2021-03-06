/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.controllers.startup
{
	import org.robotlegs.demos.imagegallery.remote.services.FlickrImageService;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	
	import org.robotlegs.core.ICommand;
	import org.robotlegs.mvcs.Command;

	public class PrepServicesCommand extends Command implements ICommand
	{
		override public function execute():void
		{
			injector.bindSingletonOf( IGalleryImageService, FlickrImageService );
		}
	}
}