using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using FluorineFx;
using System.Net.Mail;

[RemotingService]
public class Email
{
    #region --- ATRIBUTOS ---
    private String nome;
    public String Nome
    {
        get { return nome; }
        set { nome = value; }
    }

    private String userMail;
    public String UserMail
    {
        get { return userMail; }
        set { userMail = value; }
    }

    private String assunto;
    public String Assunto
    {
        get { return assunto; }
        set { assunto = value; }
    }

    private String mensagem;
    public String Mensagem
    {
        get { return mensagem; }
        set { mensagem = value; }
    }
    #endregion

    public Email()
    { }

    #region --- MÉTODOS ---
    /// <summary>
    /// Envia o email.
    /// </summary>
    /// <returns>Retorna True caso dê tudo certo e false caso gere algum erro.</returns>
    public void EnviarEmail(Email _email)
    {
        MailMessage message = new MailMessage();
        SmtpClient client = new SmtpClient();

        //E-mail do rementente
        message.From = new MailAddress("mail@prohar.com.br", "Contatosite");
        message.IsBodyHtml = true;
        message.Body = "Nome: " + _email.nome + "<br />E-mail: " + _email.userMail + "<br />Assunto: " + _email.assunto + "<br />Mesagem: " + _email.mensagem;
        message.Subject = _email.assunto;
        //E-mail do destinatário
        message.To.Add(new MailAddress("contato@inovacontabilidade.com.br", "Destinatário"));

        //E-mail e senha para enviar a mensagem
        client.Credentials = new System.Net.NetworkCredential("mail@prohar.com.br/envio", "prohar.com.br");
        //Número da porta:
        client.Port = 25;
        //Seu host para envio do e-mail
        client.Host = "mail.prohar.com.br";

        client.Send(message);
        message.Dispose();
        message = null;
        client = null;
    }
    #endregion
}