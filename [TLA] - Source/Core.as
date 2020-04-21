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

	public class Core extends MovieClip {
		
		public var btnCopyNotDownloaded: Button;
		public var btnCopyDownloaded: Button;
		public var btnClearNotDownloaded: Button;
        public var btnClearDownloadad: Button;
		public var btnDownload: Button;
		
		public var txtNotDownloaded: TextArea;
        public var txtDownloaded: TextArea;
		public var txtVersion:TextField;
		
		public var listDownload: Array;
		public var version: String = "v0.0.1";

		public function Core() {
			txtVersion.text = version;
			btnCopyNotDownloaded.addEventListener(MouseEvent.CLICK, onButtonClick);
			btnCopyDownloaded.addEventListener(MouseEvent.CLICK, onButtonClick);
			btnClearNotDownloaded.addEventListener(MouseEvent.CLICK, onButtonClick);
			btnClearDownloadad.addEventListener(MouseEvent.CLICK, onButtonClick);
			btnDownload.addEventListener(MouseEvent.CLICK, onButtonClick);
		}
		
		public function onButtonClick(event: MouseEvent):void {
			trace("[Request] v4 SWF Downloader Button Click (" + event.currentTarget.name + ")");
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