package classes
{
	    import flash.events.Event;
        import flash.events.MouseEvent;
        import flash.events.ProgressEvent;
        import flash.net.FileReference;
        import flash.net.URLRequest;
        import flash.net.URLRequestMethod;
        import flash.net.FileFilter;

        import mx.containers.TitleWindow;
        import mx.controls.Button;
        import mx.controls.ProgressBar;
        import mx.core.Application;
        import mx.managers.PopUpManager;

        public class uploadButton extends Button
        {
       
		// Define qual o arquivo .NET será chamado para realizar o upload físico do arquivo
                
        public var UPLOAD_URL:String = "uploadFile.ashx";

        private var fr:FileReference;
        private var pb:ProgressBar = new ProgressBar();
        private var tw:TitleWindow;

       // Inicializa o FileReference e adiciona os EventListeners 
                
       	public function uploadButton():void {
                    fr = new FileReference();
                    fr.addEventListener(Event.SELECT, selectHandler);
                    fr.addEventListener(Event.OPEN, openHandler);
                    fr.addEventListener(ProgressEvent.PROGRESS, progressHandler);
                    fr.addEventListener(Event.COMPLETE, completeHandler);
      	}

       	// Prepara o label da barra de progressão para informar o % de envio do arquivo
               
       	private function openHandler(event:Event):void {
                    pb.label = "Enviando... %3%%";
       	}

       	// Atualiza o percentual concluído.
               
       	private function progressHandler(event:ProgressEvent):void {
                    pb.setProgress(event.bytesLoaded, event.bytesTotal);
       	}

        // Após o upload completo, é alterado o label da barra de progressão, informando ao usuário o fim da operação 
              
       	private function completeHandler(event:Event):void {
                    pb.label = "Arquivo enviado com Sucesso!";
                    PopUpManager.removePopUp(tw);
                }

                
       	// Após o arquivo selecionado o upload é executado. 
                 
      	private function selectHandler(event:Event):void {
                    var request:URLRequest = new URLRequest();
                    request.url = UPLOAD_URL;
                    request.method = URLRequestMethod.POST;
                    openWindow()
                    fr.upload(request);
       	}

       	// Abre popUp com a progressBar. 
               
       	private function openWindow():void{
                        tw = new TitleWindow();
                        tw.title = "Enviando Arquivo...!";
                        tw.width= 250;
                        tw.height= 80;
                        pb.percentHeight = 100;
                        pb.percentWidth = 100;
                        tw.addChild(pb); 
                        PopUpManager.addPopUp(tw, this, true);
                        tw.x = (Application.application.width - tw.width) / 2; 
                        tw.y = (Application.application.height - tw.height) / 2;
      	}               

        // Abre a janela para escolher o arquivo a ser feito o upload.           
                                     
    	override protected function clickHandler(event:MouseEvent):void {
                   
				var tipos:FileFilter = new FileFilter("Arquivos *.txt; *.zip; *.xls;"
													 ,"*.txt; *.zip; *.xls");
				var tiposArray:Array = new Array(tipos);
				fr.browse(tiposArray);
		                  
        }
        }
}
