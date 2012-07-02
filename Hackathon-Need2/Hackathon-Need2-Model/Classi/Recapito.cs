using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Hackathon.Need2.Model
{
    public class Recapito
    {
        #region Campi

        #region Tipi base

        private Guid m_ID;

        private String m_Indirizzo;
        private String m_Localita;
        private String m_Provincia;

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

        
        public virtual String Indirizzo
        {
            get { return m_Indirizzo; }
            set { m_Indirizzo = value; }
        }

        public virtual String Localita
        {
            get { return m_Localita; }
            set { m_Localita = value; }
        }

        public virtual String Provincia
        {
            get { return m_Provincia; }
            set { m_Provincia = value; }
        }


        #endregion

        #region Entità del dominio

        #endregion

        #region Collezioni

        #endregion

        #endregion
    }
}
