using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.IO;
using System.Globalization;
using Hackathon.Need2.Model;
using Hackathon.Need2.BusinessLogic;
using CasaSicura.mobile;



public partial class Default : System.Web.UI.Page
{
    

protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            

            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;


            rbList.DataSource = Hackathon.Need2.BusinessLogic.Manager.OggettiSegnalazionePreliminareDanno_GetAll();
            rbList.DataBind();

        }
        
    }


    protected void lnkAccess_Click(object sender, EventArgs e)
    {
        //controllo del codice da implementare
        if (txtCode.Text == "fake1234")
        {
            //avanti
            Panel1.Visible = false;
            Panel2.Visible = true;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
        }
        else {

            alert.Show("Il codice inserito non è valido.");


        };
    }

protected void lnkStep2_Click(object sender, EventArgs e)
    {

        if (txtIndi.Text != "" && txtLocal.Text != "")
        {

            if (rbList.SelectedItem != null)
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = true;
                Panel4.Visible = false;
                Panel5.Visible = false;
            }
            else
            {
                alert.Show("Nessun tipo di danno selezionato");
            }
        }
        else
        {
            alert.Show("Indirizzo e Città obbligatori.");
        }
    }

    protected void lnkStep3_Click(object sender, EventArgs e)
    {
        if ( txtNominativo.Text != "" && txtTel.Text !="" && txtEmail.Text != "" )
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = true;
            Panel5.Visible = false;
        }
        else
        {
            alert.Show("Controlla di aver compilato tutti i campi.");
        }

    }

    protected void lnkInvia_Click(object sender, EventArgs e)
    {

        //salvataggio

        SegnalazionePreliminareDanno s = AddDanno();

        if (s != null)
        {
            //prepara la mial da inviare
            string sID = Convert.ToString(s.ID);
                       

            string subject = "Conferma inserimento danno";
            string body = PrepareMailBodyWith("templateDanno.htm", 
                                            "nominativo", txtNominativo.Text,
                                            "indi", txtIndi.Text, 
                                            "local",  txtLocal.Text,
                                            "prov", txtProv.Text,
                                            "email", txtEmail.Text, 
                                            "tel", txtTel.Text,
                                            "tipo_danno", rbList.SelectedItem.Text,
                                            "dex_danno", txtDexDanno.Text,
                                            "id", sID);

             
            if (SendMail("", txtEmail.Text, subject, body))
            {
                lblEmail.Text = "Problema durante la spedizione della mail di conferma. I dati sono stati comunque salvati.";
            }
            else
            {
                lblEmail.Text = "Una e-mail è stata inviata all'indirizzo: " + txtEmail.Text;
            }
            //cambia schermata
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = true;

        }
        else {
            alert.Show("Problema durante il salvataggio dei dati.");
        }
    }


    protected SegnalazionePreliminareDanno AddDanno()
    {
        SegnalazionePreliminareDanno aSegnalazionePreliminareDanno =
                   new SegnalazionePreliminareDanno();

        NHibernate.ISession aNHibernateISession = NHibernateHelper.GetOrCreateCurrentSession();

        aSegnalazionePreliminareDanno.Oggetto = Manager.OggettiSegnalazionePreliminareDanno_GetAll()[rbList.SelectedIndex];
        aSegnalazionePreliminareDanno.DataCreazione = DateTime.Now;
        aSegnalazionePreliminareDanno.Definitivo = true; // false se si vuole gestire la pratica successivamente

        aNHibernateISession.Save(aSegnalazionePreliminareDanno);

        //RECAPITO
        Recapito aRecapito = new Recapito();

        aRecapito.Indirizzo = txtIndi.Text;
        aRecapito.Localita = txtLocal.Text;
        aRecapito.Provincia = txtProv.Text;

        aNHibernateISession.Save(aRecapito);

        aSegnalazionePreliminareDanno.Recapito = aRecapito;

        //aNHibernateISession.Flush();

        //DETTAGLIO
        DettaglioSegnalazionePreliminareDanno aDettaglio = new DettaglioSegnalazionePreliminareDanno();

        aDettaglio.Corpo = txtDexDanno.Text;
        aDettaglio.DataCreazione = DateTime.Now;
             
        aSegnalazionePreliminareDanno.Dettagli.Add(aDettaglio);
        aDettaglio.SegnalazionePreliminareDanno = aSegnalazionePreliminareDanno;

        aNHibernateISession.Save(aDettaglio);

        //FILE IMMAGINE
        if (FileUpload1.HasFile)
        {
            Random r = new Random();
            string sFilename = r.Next(10001, 99999) + "_" + FileUpload1.FileName.Trim();
            FileUpload1.SaveAs(Server.MapPath("public/" + sFilename));
            Hackathon.Need2.Model.File aFile = new Hackathon.Need2.Model.File();
            aFile.Nome = sFilename;
            aFile.Estensione = "";
            aDettaglio.File = aFile;
            aNHibernateISession.Save(aFile);
            aDettaglio.File = aFile;

        };

        
        //RIFERIMENTO PERSONALE
        Riferimento aRiferimento = new Riferimento();

        aRiferimento.Nominativo = txtNominativo.Text;
        aRiferimento.EMail = txtEmail.Text;
        aRiferimento.Telefono = txtTel.Text;

        aNHibernateISession.Save(aRiferimento);

        aSegnalazionePreliminareDanno.Riferimento = aRiferimento;

        aNHibernateISession.Flush();

        return aSegnalazionePreliminareDanno;
    }

    protected void lnkSaveImage_Click(object sender, EventArgs e)
    {
        //se il file è presente, caricarlo
       
    }




	public static bool SendMail(string fromAddress, string toAddress, string subject, string body)
	{
		//Dim mm As MailMessage = BuildMessageWith(fromAddress, toAddress.Replace(",", ";"), subject, body)

		bool bRet = false;
		MailMessage msg = new MailMessage();

        msg.From = new MailAddress("hackathon@antonioreggiani.it");
		msg.To.Add(new MailAddress(toAddress));
        //msg.Bcc.Add(new MailAddress(""));

		msg.Subject = subject;
		msg.SubjectEncoding = System.Text.Encoding.GetEncoding("iso-8859-15");
		//body
		msg.Body = body;

		msg.BodyEncoding = System.Text.Encoding.GetEncoding("iso-8859-15");

		msg.IsBodyHtml = true;

		try {
			SmtpClient smtp = new SmtpClient();
            smtp.EnableSsl = true;
            
			smtp.Send(msg);
		} catch (Exception e) {
			bRet = true;
		}

		return bRet;
		// se c'e' errore ritorna true

	}



	private static MailMessage BuildMessageWith(string fromAddress, string toAddress, string subject, string body)
	{
		MailMessage message = new MailMessage(fromAddress, "", subject, body);


		string[] tos = toAddress.Split(';');

		foreach (string sTo in tos) {
			message.To.Add(new MailAddress(sTo));
		}
		return message;
	}


	//// read the text in template file and return it as a string 

	private static string ReadFileFrom(string templateName)
	{
		string filePath = System.Web.HttpContext.Current.Server.MapPath("~/MailTemplates/" + templateName);
		string body = System.IO.File.ReadAllText(filePath);
		return body;

	}

	//// get the template body, cache it and return the text    

	private static string GetMailBodyOfTemplate(string templateName)
	{
		string cacheKey = string.Concat("mailTemplate:", templateName);
		string body = null;
		body = (string) System.Web.HttpContext.Current.Cache[cacheKey];

		if ((string.IsNullOrEmpty(body))) {
			////read template file text  
			body = ReadFileFrom(templateName);

			if ((string.IsNullOrEmpty(body))) {
				System.Web.HttpContext.Current.Cache.Insert(cacheKey, body, null, DateTime.Now.AddHours(1), System.Web.Caching.Cache.NoSlidingExpiration);
			}
		}
		return body;
	}

	//// replace the tokens in template body with corresponding values   
	
    public static string PrepareMailBodyWith(string templateName, params string[] pairs)
	{
		string body = GetMailBodyOfTemplate(templateName);
		for (int i = 0; i <= pairs.Length - 1; i += 2) {
			//body = body.Replace("<%={0}%>".FormatWith(pairs(i)), pairs(i + 1))
			body = body.Replace(string.Format("<%={0}%>", pairs[i]), pairs[i + 1]);
		}
		return body;
	}

	public static string FormatWith(string target, params object[] args)
	{
		return string.Format(CultureInfo.CurrentCulture, target, args);
	}


}

