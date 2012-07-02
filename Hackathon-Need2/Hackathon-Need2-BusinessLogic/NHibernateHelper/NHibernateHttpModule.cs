using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Hackathon.Need2.BusinessLogic
{
    class NHibernateHttpModule : System.Web.IHttpModule
    {
        #region IHttpModule Members

        public void Dispose()
        {

        }

        public void Init(System.Web.HttpApplication context)
        {
            context.BeginRequest += new EventHandler(context_BeginRequest);
            context.EndRequest += new EventHandler(context_EndRequest);
        }

        #endregion

        private void context_BeginRequest(object sender, EventArgs e)
        {
            System.Web.HttpApplication aHttpApplication = (System.Web.HttpApplication)sender;
            System.Web.HttpContext aHttpContext = aHttpApplication.Context;
            
            NHibernateHelper.GetOrCreateCurrentSession(aHttpContext);
        }

        private void context_EndRequest(object sender, EventArgs e)
        {
            System.Web.HttpApplication aHttpApplication = (System.Web.HttpApplication)sender;
            System.Web.HttpContext aHttpContext = aHttpApplication.Context;

            NHibernate.ISession aNHibernateSession = NHibernateHelper.GetCurrentSession(aHttpContext);

            if (aNHibernateSession != null)
            {
                aNHibernateSession.Flush();
                aNHibernateSession.Close();
            }

            NHibernateHelper.DisposeCurrentSession(aHttpContext);
        }

    }
}
