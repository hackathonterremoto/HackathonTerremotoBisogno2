<%@ Page Language="C#" AutoEventWireup="true" Inherits="Default" Codebehind="default.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Casa Sicura - HackathonTerremoto</title> 
	<meta name="viewport" content="width=device-width, initial-scale=1"/> 

	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />

	<script src="http://code.jquery.com/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/custom-ant.js" type="text/javascript"></script>
	<script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDrGVnv0St1MdoAuiMcM-lhzLAvsh-S0_w&sensor=true"></script>
    <script type="text/javascript">

        navigator.geolocation.getCurrentPosition(gotPosition, errorGettingPosition, { 'enableHighAccuracy': true, 'timeout': 10000, 'maximumAge': 0 });

        function gotPosition(pos) {
            //var outputStr = "latitude:" + pos.coords.latitude + "<br>" + "longitude:" + pos.coords.longitude + "<br>" + "accuracy:" + pos.coords.accuracy + "<br>" + "altitude:" + pos.coords.altitude + "<br>" + "altitudeAccuracy:" + pos.coords.altitudeAccuracy + "<br>" + "heading:" + pos.coords.heading + "<br>" + "speed:" + pos.coords.speed + "";
            //crea geocoder per trovare indirizzo

            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude) }, function (results, status) {

                var pannello;
                pannello = document.getElementById('<%= Panel2.ClientID %>');

                if (status == google.maps.GeocoderStatus.OK && pannello != null) {
                    if (results[1]) {
                        var route = '';
                        var number = '';
                        var locality = '';
                        var sublocality = '';
                        for (i = 0; i < results[0].address_components.length; i++) {

                            for (j = 0; j < results[0].address_components[i].types.length; j++) {

                                if (results[0].address_components[i].types[j] == "route")
                                    route = results[0].address_components[i].long_name;

                                if (results[0].address_components[i].types[j] == "street_number")
                                    number = results[0].address_components[i].long_name

                                if (results[0].address_components[i].types[j] == "locality")
                                    locality = results[0].address_components[i].long_name;

                                if (results[0].address_components[i].types[j] == "sublocality")
                                    sublocality = results[0].address_components[i].long_name;
                            }

                            document.getElementById('<%= txtProv.ClientID %>').value = sublocality;
                            document.getElementById('<%= txtLocal.ClientID %>').value = locality;

                            if (number != '')
                                document.getElementById('<%= txtIndi.ClientID %>').value = route + ', ' + number;
                            else
                                document.getElementById('<%= txtIndi.ClientID %>').value = route;
                        }
                    }
                    else {
                        //alert("No results found");
                    }
                } else {
                    //alert("Geocoder fallito");
                }
            });
        }

        function errorGettingPosition(err) {
            if (err.code == 1) {
                alert("User denied geolocation.");
            }
            else if (err.code == 2) {
              //  alert("Position unavailable.");
            }
            else if (err.code == 3) {
               // alert("Timeout expired.");
            }
            else {
              //  alert("ERROR:" + err.message);
            }
        }


    
    </script>

 
 </head>

<body>
    
   <form id="form1" runat="server">
   
     <div data-role="page" data-theme="e" data-content-theme="e"> 
        <div data-role="header">
		   <img src="images/logo.png" alt="Logo" />
           CASA SICURA
	    </div>

        <asp:Panel ID="Panel1" runat="server">
            <div data-role="header">
    		    <h1>Codice Personale</h1>
	        </div>

            <div data-role="content" >	
		        <h4>Accedi con il codice che ti abbiamo fornito, oppure invia un SMS al 800123456 per riceverne uno.</h4>
                
                <label for="txtCode">Codice personale</label>
                <asp:TextBox ID="txtCode" runat="server" MaxLength="50" Text="fake1234"></asp:TextBox>
                
            
                <asp:LinkButton ID="lnkAccess" runat="server" data-role="button" 
                    data-icon="arrow-r" onclick="lnkAccess_Click">Accesso</asp:LinkButton>
            </div>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server">
            <div data-role="header">
    		    <h1>Identifica lo stabile da segnalare</h1>
	        </div>

            <div data-role="content" >	
		        <%--<h3>Identifica lo stabile da segnalare</h3>--%>
                <h5>Controlla che i campi compilati automaticamente siano corretti.</h5>
                <label for="txtIndi">Indirizzo</label>
                <asp:TextBox ID="txtIndi" runat="server" MaxLength="250"></asp:TextBox>

                <label for="txtLocal">Località</label>
                <asp:TextBox ID="txtLocal" runat="server" style="margin-right: 0px" 
                    MaxLength="250"></asp:TextBox>

                <label for="txtProv">Provincia</label>
                <asp:TextBox ID="txtProv" MaxLength="2" runat="server"></asp:TextBox>
            
                <label for="rbList">Tipo di danno</label>
                <asp:RadioButtonList ID="rbList" runat="server" DataTextField="Nome" DataValueField="ID" >
                </asp:RadioButtonList>
                <asp:LinkButton ID="lnkStep2" runat="server" data-role="button" 
                    data-icon="arrow-r" onclick="lnkStep2_Click">Prosegui</asp:LinkButton>
            </div>
        </asp:Panel>

        <asp:Panel ID="Panel3" runat="server">
            <div data-role="content" >	
		        <h3>Inserisci i tuoi dati</h3>
                <label for="txtIndi">Nominativo</label>
                <asp:TextBox ID="txtNominativo" runat="server" MaxLength="250"></asp:TextBox>
            
                <label for="txtLocal">Telefono</label>
                <asp:TextBox ID="txtTel" runat="server" MaxLength="250"></asp:TextBox>
            
                <label for="txtEmail">e-mail</label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            
            
                <asp:LinkButton ID="lnkStep3" runat="server" data-role="button" 
                    data-icon="arrow-r" onclick="lnkStep3_Click">Prosegui</asp:LinkButton>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel4" runat="server">
            <div data-role="content" >	
		        <h3>Descrivi i danni</h3>
                
                <label for="txtDexDanno">Descrizione del danno</label>
                <asp:TextBox ID="txtDexDanno" runat="server" TextMode="MultiLine" ></asp:TextBox>
            
                <label for="FileUpload1">Allega una foto</label>
                <asp:FileUpload ID="FileUpload1" runat="server" data-role="button" data-inline="true"  />
                
                 <br />
                 Immagini allegate:
                <asp:Repeater ID="repImg" runat="server">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "public/" + Eval("Nome") %>' />
                    </ItemTemplate>
                </asp:Repeater>
                
                <asp:LinkButton ID="lnkInvia" runat="server" data-role="button"
                    data-icon="arrow-r" onclick="lnkInvia_Click">Invia</asp:LinkButton>
            </div>
            

        </asp:Panel>
	    
        <asp:Panel ID="Panel5" runat="server">
            <div data-role="content" >	
		        <h3>Grazie per avere inserito la tua segnalazione.</h3>
                <h4>
                    <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></h4>
                
            </div>
        </asp:Panel>

	    <div data-role="footer" class="footer-docs" data-theme="e">
	        <p>Segnalazione preliminare di danno | Versione <% =ConfigurationManager.AppSettings["appVersionNumber"]  %></p>
	    </div>
    </div>
   


   


    </form>
</body>
</html>
