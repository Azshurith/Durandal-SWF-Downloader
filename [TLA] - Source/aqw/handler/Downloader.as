package aqw.handler {
	
	import flash.events.*;
	import flash.net.*
	import flash.utils.*;
	import flash.filesystem.*;
	import flash.display.MovieClip;

	public class Downloader {

		public var fileData: ByteArray = new ByteArray();
		public var urlStream: URLStream = new URLStream();
		public var urlData: String;
		public var rootClass: MovieClip;

		public function download(core: MovieClip, url: String) {
			trace("[DOWNLOADING] : " + url);	
			var urlRequest: URLRequest = new URLRequest(url);
			urlStream.addEventListener(Event.COMPLETE, onDownloadComplete);
			urlStream.load(urlRequest);
			urlData = url;
			rootClass = core;
		}

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