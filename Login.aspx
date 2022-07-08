<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Taller_Mecanico.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link rel="stylesheet" href="css/css.css" />
</head>
<body style="height: 489px">
    <form id="form1" runat="server">
        <div class="container">
            <div class="form">
                <div class="login">
                    <p class="tittle">LOGIN</p>
                    
                    <asp:TextBox ID="txtMail" runat="server" CssClass="textboxs" placeHolder="E-Mail"></asp:TextBox>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="textboxs" placeHolder="Password"></asp:TextBox>
                    <asp:LinkButton ID="linkAdmin" runat="server" CssClass="link" Font-Names="Bell MT" ForeColor="Black" OnClick="linkAdmin_Click">Eres Admin? Click Aquí</asp:LinkButton>
                    <br />
                    <br />
                    <asp:TextBox ID="txtCodeAdmin" runat="server" CssClass="textboxs" placeHolder="Ingresa tu codigo de Admin"></asp:TextBox>
                    <div class="">
                        <asp:Button ID="btnLogin" runat="server" CssClass="button" OnClick="btnLogin_Click" Text="Inicio Sesion" />                   
                        <asp:Button ID="btnRegister" runat="server" CssClass="button" OnClick="btnRegister_Click" Text="Registrate" />
                    </div>
                    <br />
                    <asp:Label ID="lblAlertas" CssClass="alertas" runat="server"></asp:Label>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
