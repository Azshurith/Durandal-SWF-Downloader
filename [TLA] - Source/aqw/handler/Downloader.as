package aqw.handler {
	
	import flash.events.*;
	import flash.net.*
	import flash.utils.*;
	import flash.filesystem.*;
	import flash.display.MovieClip;

	/**
	 * The Downloader class handles downloading files from URLs.
	 */
	public class Downloader {

		/**
		 * The ByteArray object to hold the downloaded file data.
		 */
		public var fileData: ByteArray = new ByteArray();
		
		/**
		 * The URLStream object for loading the file from a URL.
		 */
		public var urlStream: URLStream = new URLStream();
		
		/**
		 * The URL of the file to be downloaded.
		 */
		public var urlData: String;
		
		/**
		 * Reference to the root MovieClip class.
		 */
		public var rootClass: MovieClip;

		/**
		 * Initiates the download process.
		 * @param core The root MovieClip class.
		 * @param url The URL of the file to download.
		 */
		public function download(core: MovieClip, url: String) {
			trace("[DOWNLOADING] : " + url);	
			var urlRequest: URLRequest = new URLRequest(url);
			urlStream.addEventListener(Event.COMPLETE, onDownloadComplete);
			urlStream.load(urlRequest);
			urlData = url;
			rootClass = core;
		}

		/**
		 * Event handler for when the download is complete.
		 * @param event The complete event.
		 */
		public function onDownloadComplete(event: Event): void {
			trace("[DOWNLOADED] : " + urlData);
			var path:String = urlData.replace("https://game.aq.com/game/", "");
			urlStream.readBytes(fileData, 0, urlStream.bytesAvailable);
			var file: File = File.desktopDirectory.resolvePath(path);
			var fileStream: FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeBytes(fileData, 0, fileData.length);
			fileStream.close();
			
			rootClass.listDownload.splice(rootClass.listDownload.indexOf(urlData), 1);
			rootClass.txtDownloaded.text += urlData + "\n";
			rootClass.txtNotDownloaded.text = rootClass.txtNotDownloaded.text.replace(urlData,"");
		}
	
	}

}