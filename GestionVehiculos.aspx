<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionVehiculos.aspx.cs" Inherits="Taller_Mecanico.GestionVehiculos" %>

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
                <asp:LinkButton ID="linkMenu" runat="server" CssClass="linkMenu" OnClick="linkMenu_Click">Menu</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="Gestion Vehiculos"></asp:Label>
            </div>
            <hr />
            <div class="formulario">
                <div class="datos">
                    <asp:TextBox ID="txtMatricula" CssClass="inputs" placeHolder="Matricula"  runat="server"></asp:TextBox>
 
                    <asp:TextBox ID="txtMarca" CssClass="inputs" placeHolder="Marca"  runat="server"></asp:TextBox>

                    <asp:TextBox ID="txtModelo" CssClass="inputs" placeHolder="Modelo"  runat="server"></asp:TextBox>
            
                    <asp:TextBox ID="txtAnio" CssClass="inputs" placeHolder="Año"  runat="server"></asp:TextBox>
              
                    <asp:TextBox ID="txtColor" CssClass="inputs" placeHolder="Color"  runat="server"></asp:TextBox>
               
                    <asp:DropDownList ID="txtDueno" CssClass="inputs"  runat="server" Height="40px">
                    </asp:DropDownList>
                </div>
                <div class="buttons">
                    <asp:Button ID="btnAlta" runat="server" CssClass="btn" Text="Alta" OnClick="btnAlta_Click" />
                    <asp:Button ID="btnBaja" runat="server" CssClass="btn" Text="Baja" OnClick="btnBaja_Click" />
                    <asp:Button ID="btnModificar" runat="server" CssClass="btn" Text="Modificar" OnClick="btnModificar_Click" />
                    <asp:Button ID="btnLimpiar" runat="server" CssClass="btn" Text="Limpiar" OnClick="btnLimpiar_Click" />
                </div>

            </div>
            <div class="grid">
                <asp:GridView ID="GridVehiculos" runat="server" AutoGenerateColumns ="False" Width="888px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" >
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="IdVehiculo" HeaderText="Id" />
                        <asp:BoundField DataField="Matricula" HeaderText="Matricula" />
                        <asp:BoundField DataField="Marca" HeaderText="Marca" />
                        <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                        <asp:BoundField DataField="Anio" HeaderText="Año" />
                        <asp:BoundField DataField="Color" HeaderText="Color" />
                        <asp:BoundField DataField="DuenoVehiculo" HeaderText="Dueño del vehiculo" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkView" runat="server" CommandArgument='<%# Eval("IdVehiculo") %>' OnClick="link_OnClick" >Seleccionar</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <div class="containerAlerts">
                    <asp:Label ID="lblAlertas" CssClass="alerts" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
