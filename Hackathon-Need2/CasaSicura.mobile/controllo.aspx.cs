using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hackathon.Need2.Model;



public partial class Controllo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cmdCerca_Click(object sender, EventArgs e)
    {
        SegnalazionePreliminareDanno segnalazione;
        
        segnalazione = Hackathon.Need2.BusinessLogic.Manager.SegnalazionePreliminareDanno_GetByID(txtGuid.Text);
        
        
   
    }
}