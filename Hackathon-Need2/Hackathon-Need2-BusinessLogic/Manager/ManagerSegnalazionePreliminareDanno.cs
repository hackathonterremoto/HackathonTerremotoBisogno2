using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Hackathon.Need2.Model;

namespace Hackathon.Need2.BusinessLogic
{
    public partial class Manager
    {
        #region GetByID

        public static SegnalazionePreliminareDanno SegnalazionePreliminareDanno_GetByID(
            Guid SegnalazionePreliminareDannoID
            )
        {
            SegnalazionePreliminareDanno aSegnalazionePreliminareDanno = null;

            NHibernate.ISession aNHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();
            try
            {
                aSegnalazionePreliminareDanno = 
                    aNHibernateSession.Get<SegnalazionePreliminareDanno>(SegnalazionePreliminareDannoID);
            }
            catch (Exception)
            {
            }

            return aSegnalazionePreliminareDanno;
        }

        public static SegnalazionePreliminareDanno SegnalazionePreliminareDanno_GetByID(
            String SegnalazionePreliminareDannoID
            )
        {
            return SegnalazionePreliminareDanno_GetByID(new Guid(SegnalazionePreliminareDannoID));
        }

        #endregion

        #region Create

        public static SegnalazionePreliminareDanno SegnalazionePreliminareDanno_Create(
            Recapito Recapito,
            OggettoSegnalazionePreliminareDanno Oggetto
            )
        {
            try
            {
                SegnalazionePreliminareDanno aSegnalazionePreliminareDanno =
                    new SegnalazionePreliminareDanno();

                NHibernate.ISession aNHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();

                aSegnalazionePreliminareDanno.Recapito = Recapito;
                aSegnalazionePreliminareDanno.Oggetto = Oggetto;
                aSegnalazionePreliminareDanno.DataCreazione = DateTime.Now;
                aSegnalazionePreliminareDanno.Definitivo = false;

                aNHibernateSession.Save(aSegnalazionePreliminareDanno);

                aNHibernateSession.Flush();

                return aSegnalazionePreliminareDanno;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static SegnalazionePreliminareDanno SegnalazionePreliminareDanno_Create(
            String Indirizzo,
            String Localita,
            String Provincia,
            Guid OggettoID
        )
        {
            try
            {
                NHibernate.ISession aNHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();

                Recapito aRecapito = Recapito_Create(
                    Indirizzo,
                    Localita,
                    Provincia
                    );

                OggettoSegnalazionePreliminareDanno aOggettoSegnalazionePreliminareDanno =
                    aNHibernateSession.Load<OggettoSegnalazionePreliminareDanno>(OggettoID);


                SegnalazionePreliminareDanno aSegnalazionePreliminareDanno =
                    SegnalazionePreliminareDanno_Create(
                        aRecapito,
                        aOggettoSegnalazionePreliminareDanno
                        );

                return aSegnalazionePreliminareDanno;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static SegnalazionePreliminareDanno SegnalazionePreliminareDanno_Create(
            String Indirizzo,
            String Localita,
            String Provincia,
            String OggettoID
        )
        {
            return SegnalazionePreliminareDanno_Create(
                Indirizzo,
                Localita,
                Provincia,
                new Guid(OggettoID)
                );
        }

        #endregion

        #region AddRiferimento

        public static void SegnalazionePreliminareDanno_AddRiferimento(
            SegnalazionePreliminareDanno SegnalazionePreliminareDanno,
            Riferimento Riferimento
            )
        {
            try
            {
                NHibernate.ISession aNHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();

                SegnalazionePreliminareDanno.Riferimento = Riferimento;

                aNHibernateSession.Flush();
            }
            catch (Exception)
            {
            }
        }

        public static void SegnalazionePreliminareDanno_AddRiferimento(
            Guid SegnalazionePreliminareDannoID,
            String Nominativo,
            String Telefono,
            String Email
        )
        {
            try
            {
                NHibernate.ISession aNHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();

                Riferimento aRiferimento = Riferimento_Create(
                    Nominativo,
                    Telefono,
                    Email
                    );

                SegnalazionePreliminareDanno aSegnalazionePreliminareDanno =
                    aNHibernateSession.Get<SegnalazionePreliminareDanno>(SegnalazionePreliminareDannoID);

                SegnalazionePreliminareDanno_AddRiferimento(
                    aSegnalazionePreliminareDanno,
                    aRiferimento
                    );
            }
            catch (Exception)
            {
            }
        }

        public static void SegnalazionePreliminareDanno_AddRiferimento(
            String SegnalazionePreliminareDannoID,
            String Nominativo,
            String Telefono,
            String Email
        )
        {
            SegnalazionePreliminareDanno_AddRiferimento(
                new Guid(SegnalazionePreliminareDannoID),
                Nominativo,
                Telefono,
                Email
                );
        }

        #endregion
    }
}
