using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Hackathon.Need2.Model
{
    public class Riferimento
    {
        #region Campi

        #region Tipi base

        private Guid m_ID;

        private string m_EMail;
        private string m_Nominativo;
        private string m_Telefono;

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


        public virtual string EMail
        {
            get { return m_EMail; }
            set { m_EMail = value; }
        }

        public virtual string Nominativo
        {
            get { return m_Nominativo; }
            set { m_Nominativo = value; }
        }

        public virtual string Telefono
        {
            get { return m_Telefono; }
            set { m_Telefono = value; }
        }

        #endregion

        #region Entità del dominio

        #endregion

        #region Collezioni

        #endregion

        #endregion
    }
}
