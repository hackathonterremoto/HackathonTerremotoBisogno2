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

        public static Riferimento Riferimento_GetByID(
            Guid RiferimentoID
            )
        {
            Riferimento aRiferimento = null;

            NHibernate.ISession aNHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();
            try
            {
                aRiferimento =
                    aNHibernateSession.Get<Riferimento>(RiferimentoID);
            }
            catch (Exception)
            {
            }

            return aRiferimento;
        }

        public static Riferimento Riferimento_GetByID(
            String RiferimentoID
            )
        {
            return Riferimento_GetByID(new Guid(RiferimentoID));
        }

        #endregion

        #region Create

        public static Riferimento Riferimento_Create(
            String Nominativo,
            String Telefono,
            String EMail
            )
        {
            try
            {
                Riferimento aRiferimento =
                    new Riferimento();

                NHibernate.ISession aNHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();

                aRiferimento.Nominativo = Nominativo;
                aRiferimento.Telefono = Telefono;
                aRiferimento.EMail = EMail;

                aNHibernateSession.Save(aRiferimento);

                aNHibernateSession.Flush();

                return aRiferimento;
            }
            catch (Exception)
            {
                return null;
            }
        }

        #endregion

    }
}
