using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Hackathon.Need2.Model
{
    public class OggettoSegnalazionePreliminareDanno
    {
        #region Campi

        #region Tipi base

        private Guid m_ID;

        private String m_Nome;

        #endregion

        #region Entità del dominio

        #endregion

        #region Collezioni

        #endregion

        #endregion

        #region Proprietà

        #region Tipi base

        public virtual Guid ID
        {
            get { return m_ID; }
            set { m_ID = value; }
        }

        public virtual String Nome
        {
            get { return m_Nome; }
            set { m_Nome = value; }
        }

        #endregion

        #region Entità del dominio

        #endregion

        #region Collezioni

        #endregion

        #endregion
    }
}
