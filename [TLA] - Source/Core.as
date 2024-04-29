package {

	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.text.*;
	import flash.net.*
	import flash.system.*;
	import flash.utils.*;
	import flash.filesystem.*;
	
	import fl.controls.Button;
	import fl.controls.TextArea;
	
	import aqw.handler.Downloader;

	/**
	 * The Core class serves as the main class for the SWF Downloader application.
	 */
	public class Core extends MovieClip {
		
		/**
		 * The button for copying not downloaded URLs.
		 */
		public var btnCopyNotDownloaded: Button;
		
		/**
		 * The button for copying downloaded URLs.
		 */
		public var btnCopyDownloaded: Button;
		
		/**
		 * The button for clearing not downloaded URLs.
		 */
		public var btnClearNotDownloaded: Button;
        
		/**
		 * The button for clearing downloaded URLs.
		 */
		public var btnClearDownloadad: Button;
		
		/**
		 * The button for initiating downloads.
		 */
		public var btnDownload: Button;
		
		/**
		 * The text area for displaying not downloaded URLs.
		 */
		public var txtNotDownloaded: TextArea;
        
		/**
		 * The text area for displaying downloaded URLs.
		 */
		public var txtDownloaded: TextArea;
		
		/**
		 * The text field for displaying the application version.
		 */
		public var txtVersion:TextField;
		
		/**
		 * An array to hold the list of URLs to download.
		 */
		public var listDownload: Array;
		
		/**
		 * The version number of the application.
		 */
		public var version: String = "v0.0.1";

		/**
		 * Constructor function for initializing the Core class.
		 */
		public function Core() {
			txtVersion.text = version;
			btnCopyNotDownloaded.addEventListener(MouseEvent.CLICK, onButtonClick);
			btnCopyDownloaded.addEventListener(MouseEvent.CLICK, onButtonClick);
			btnClearNotDownloaded.addEventListener(MouseEvent.CLICK, onButtonClick);
			btnClearDownloadad.addEventListener(MouseEvent.CLICK, onButtonClick);
			btnDownload.addEventListener(MouseEvent.CLICK, onButtonClick);
		}
		
		/**
		 * Event handler for button clicks.
		 * @param event The MouseEvent object representing the click event.
		 */
		public function onButtonClick(event: MouseEvent):void {
			trace("[Request] SWF Downloader Button Click (" + event.currentTarget.name + ")");
			switch (event.currentTarget.name) {
                case "btnCopyNotDownloaded":
					System.setClipboard(txtNotDownloaded.text);
					break;
                case "btnCopyDownloaded":
					System.setClipboard(txtDownloaded.text);
					break;
				case "btnClearNotDownloaded":
					txtNotDownloaded.text = "";
					break;
                case "btnClearDownloadad":
					txtDownloaded.text = "";
					break;
				case "btnDownload":
					listDownload = txtNotDownloaded.text.split("\r");
					for each(var url in listDownload) {
						var downloader:Downloader = new Downloader();
						downloader.download(this, url);
					}
                    break;
			}
		}

	}

}