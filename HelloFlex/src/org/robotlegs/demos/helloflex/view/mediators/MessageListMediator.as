package org.robotlegs.demos.helloflex.view.mediators
{
	import org.robotlegs.demos.helloflex.model.proxies.MessageProxy;
	import org.robotlegs.demos.helloflex.view.components.MessageList;
	import org.robotlegs.mvcs.Mediator;
	
	public class MessageListMediator extends Mediator
	{
		[Inject]
		public var messageList:MessageList;
		
		[Inject]
		public var messageProxy:MessageProxy;
		
		public function MessageListMediator()
		{
		}
		
		override public function onRegister():void
		{
			messageList.dataProvider = messageProxy.messageList;
		}
	
	}
}