/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.views.events
{
	import flash.events.Event;
	
	public class GallerySearchEvent extends Event
	{
		public static const SEARCH:String = "search";
		
		public var searchTerm:String;
		
		public function GallerySearchEvent(type:String, searchTerm:String)
		{
			this.searchTerm = searchTerm;
			super(type, false, false);
		}
		
		override public function clone() : Event
		{
			return new GallerySearchEvent(this.type, this.searchTerm);
		}
	}
}