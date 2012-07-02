<%@ Page Language="C#" AutoEventWireup="True" Inherits="Controllo" Codebehind="controllo.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Casa Sicura - HackathonTerremoto</title> 
	<meta name="viewport" content="width=device-width, initial-scale=1"/> 

	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />

	<script src="http://code.jquery.com/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtGuid" runat="server" Text="eabe6fa2-4253-4a74-b5f8-74191de4a7ed"></asp:TextBox>
        <asp:Button ID="cmdCerca" runat="server" Text="Cerca" 
            onclick="cmdCerca_Click" />
    
    </div>
    </form>
</body>
</html>
