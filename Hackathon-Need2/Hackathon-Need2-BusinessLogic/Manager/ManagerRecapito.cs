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

        public static Recapito Recapito_GetByID(
            Guid RecapitoID
            )
        {
            Recapito aRecapito = null;

            NHibernate.ISession aNHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();
            try
            {
                aRecapito =
                    aNHibernateSession.Get<Recapito>(RecapitoID);
            }
            catch (Exception)
            {
            }

            return aRecapito;
        }

        public static Recapito Recapito_GetByID(
            String RecapitoID
            )
        {
            return Recapito_GetByID(new Guid(RecapitoID));
        }

        #endregion

        #region Create

        public static Recapito Recapito_Create(
            String Indirizzo,
            String Localita,
            String Provincia
            )
        {
            try
            {
                Recapito aRecapito =
                    new Recapito();

                NHibernate.ISession aNHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();

                aRecapito.Indirizzo = Indirizzo;
                aRecapito.Localita = Localita;
                aRecapito.Provincia = Provincia;

                aNHibernateSession.Save(aRecapito);

                aNHibernateSession.Flush();

                return aRecapito;
            }
            catch (Exception)
            {
                return null;
            }
        }

        #endregion

    }
}
