package mapeamento
{
	[RemoteClass(alias="Email")]
	public class Email
	{		
		private var nome:String;
        public function get Nome():String{
        	 return this.nome;
       	}
        public function set Nome(valor:String):void{
        	 this.nome = valor;
       	}        

        private var userEmail:String;        
        public function get UserMail():String{
        	return this.userEmail;
        }
        public function set UserMail(valor:String):void{
        	this.userEmail = valor;
        }        

        private var assunto:String;
        public function get Assunto():String{
        	return this.assunto;
        }   
        public function set Assunto(valor:String):void{
        	this.assunto = valor;
        }
        
        private var mensagem:String;
        public function get Mensagem():String{
        	return this.mensagem;
        }       
        public function set Mensagem(valor:String):void{
        	this.mensagem = valor;
        }
		
		//Construtor
		public function Email()
		{
		}
	}
}