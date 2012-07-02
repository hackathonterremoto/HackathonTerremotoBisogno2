using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Hackathon.Need2.Model;

namespace Hackathon.Need2.BusinessLogic
{
    public partial class Manager
    {
        public static SegnalazionePreliminareDanno Test()
        {
            SegnalazionePreliminareDanno aSegnalazionePreliminareDanno = 
                new SegnalazionePreliminareDanno();

            NHibernate.ISession aNHibernateISession = NHibernateHelper.GetOrCreateCurrentSession();

            aSegnalazionePreliminareDanno.Oggetto = Manager.OggettiSegnalazionePreliminareDanno_GetAll()[0];
            aSegnalazionePreliminareDanno.DataCreazione = DateTime.Now;
            aSegnalazionePreliminareDanno.Definitivo = true;

            aNHibernateISession.Save(aSegnalazionePreliminareDanno);

            Recapito aRecapito =
                new Recapito();

            aRecapito.Indirizzo = "Indirizzo";
            aRecapito.Localita = "Città";
            aRecapito.Provincia = "Provincia";

            aNHibernateISession.Save(aRecapito);

            aSegnalazionePreliminareDanno.Recapito = aRecapito;

            //aNHibernateISession.Flush();

            DettaglioSegnalazionePreliminareDanno aDettaglio =
                new DettaglioSegnalazionePreliminareDanno();

            aDettaglio.Corpo = "Commento danni da segnalare...";
            aDettaglio.DataCreazione = DateTime.Now;

            aSegnalazionePreliminareDanno.Dettagli.Add(aDettaglio);
            aDettaglio.SegnalazionePreliminareDanno = aSegnalazionePreliminareDanno;

            aNHibernateISession.Save(aDettaglio);

            File aFile = new File();

            aFile.Nome = "Crepa.jpg";

            aFile.Estensione = ".jpg";

            aNHibernateISession.Save(aFile);

            aDettaglio.File = aFile;


            Riferimento aRiferimento =
                new Riferimento();

            aRiferimento.Nominativo = "Nome Cognome";
            aRiferimento.EMail = "test@test.it";
            aRiferimento.Telefono = "123456789";

            aNHibernateISession.Save(aRiferimento);

            aSegnalazionePreliminareDanno.Riferimento = aRiferimento;

            aNHibernateISession.Flush();

            return aSegnalazionePreliminareDanno;
        }
    }
}
