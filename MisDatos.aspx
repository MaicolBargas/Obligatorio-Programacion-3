<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MisDatos.aspx.cs" Inherits="Taller_Mecanico.MisDatos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/forms.css" />
</head>
<body>
    <form id="form1" runat="server">
 <div class="main">
            <div class="navbar">
                <asp:LinkButton ID="linkMenu" runat="server" cssClass="linkMenu" OnClick="linkMenu_Click">Menu</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="Mis Datos"></asp:Label>            
            </div>
            <hr />
            <div class="formulario" style="margin-left:30%;">
                <div class="datos">
                    <asp:TextBox ID="txtNombre"  CssClass="inputs" placeHolder="Nombre" runat="server"></asp:TextBox>
            
                    <asp:TextBox ID="txtCI"  CssClass="inputs" placeHolder="CI" runat="server" Enabled="false"></asp:TextBox>
            
                    <asp:TextBox ID="txtTelefono"  CssClass="inputs"  placeHolder="Telefono" runat="server"></asp:TextBox>
          
                    <asp:TextBox ID="txtMail"  CssClass="inputs" placeHolder="Mail" runat="server"></asp:TextBox>

                    <asp:TextBox ID="txtPassword" CssClass="inputs" placeHolder="Password" runat="server" ></asp:TextBox>
                </div>
                <div class="buttons">
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" style="margin-left:30%; width:max-content;" CssClass="btn" OnClick="btnModificar_Click" />
                </div>
            </div>    
            <div class="ContainerAlerts">
                <asp:Label ID="lblAlertas"  CssClass="alerts" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
