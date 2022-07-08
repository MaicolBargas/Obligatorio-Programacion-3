<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Taller_Mecanico.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link rel="stylesheet" href="css/home.css" />

</head>
<body style="height: 494px">
    <form id="form1" runat="server">
        <div class="main">
           
           <div class="navbar">

               <asp:LinkButton ID="linkMenu" runat="server" CssClass="btnMenu" OnClick="linkMenu_Click">Cerrar Sesion</asp:LinkButton>

           </div>
            <div class="ContainerVehiculos">
            <p class="titulo"> Tus Vehiculos: </p>
            <asp:GridView ID="GridVehiculos" runat="server" AutoGenerateColumns ="False" Width="700px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" >
                <Columns>
                    <asp:BoundField DataField="IdVehiculo" HeaderText="Id" />
                    <asp:BoundField DataField="Matricula" HeaderText="Matricula" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" />
                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                    <asp:BoundField DataField="Anio" HeaderText="Año" />
                    <asp:BoundField DataField="Color" HeaderText="Color" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkView" runat="server" CommandArgument='<%# Eval("IdVehiculo") %>' OnClick="linkAgendarReparacion_Click" >Deseo Repararlo</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkView1" runat="server" CommandArgument='<%# Eval("IdVehiculo") %>' OnClick="linkVerReparaciones_Click" >Ver Historial de Reparaciones</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
            <br />
            </div>
            <div class="ContainerFiltrar"> 
            <div class="filtrar">  
              
            <p>Inicio Reparacion :<asp:TextBox ID="txtFechaInicio" runat="server" type="date" /></p>
            <p> Fin Reparación : <asp:TextBox ID="txtFechaFin" runat="server" type="date" />
            <asp:Button ID="btnFiltrar" runat="server" CssClass="btnFiltrar" OnClick="btnFiltrar_Click" Text="Filtrar" /></div> </p>
            <br />
             <asp:GridView ID="GridReparaciones" runat="server" AutoGenerateColumns ="False" Width="593px" Height="35px" Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None" >
                 <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IdReparacion" HeaderText="Id" />
                    <asp:BoundField DataField="IdVehiculo" HeaderText="Vehiculo" />
                    <asp:BoundField DataField="FchEntrada" HeaderText="Fecha Entrada" />
                    <asp:BoundField DataField="FchSalida" HeaderText="Fecha Salida" />
                    <asp:BoundField DataField="IdMecanico" HeaderText="Mecanico" />
                    <asp:BoundField DataField="DscEntrada" HeaderText="Desc. Entrada" />
                    <asp:BoundField DataField="DscSalida" HeaderText="Desc. Salida" />
                    <asp:BoundField DataField="KmsEntrada" HeaderText="KMS" />
                </Columns>
                 <EditRowStyle BackColor="#2461BF" />
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#EFF3FB" />
                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </div>
            <div class="ContainerAgenda">
            <asp:Label ID="lblAlertas" runat="server"></asp:Label>
            <br />
            <br />
           
            <p class="header1"> Vehiculo seleccionado</p>
            <p class="labels"> Id:<asp:TextBox ID="txtId" runat="server" Enabled="False"></asp:TextBox></p>           
            <p class="labels"> Matricula:<asp:TextBox ID="txtMatricula" runat="server" Enabled="False"></asp:TextBox></p>
            <p class="labels"> Marca:<asp:TextBox ID="txtMarca" runat="server" Enabled="False"></asp:TextBox></p>
            <p class="labels"> Modelo:<asp:TextBox ID="txtModelo" runat="server" Enabled="False"></asp:TextBox></p>
         
            <p class="labels"> Describenos que problema tiene tu vehiculo:</p>
            <asp:TextBox ID="txtDscEntrada" runat="server" Height="36px" Width="223px"></asp:TextBox>
          
            <asp:Button ID="btnAlta" runat="server" CssClass="btnFiltrar"  Height="28px" OnClick="btnAlta_Click" Text="Agendar" Width="119px" />
         </div>
            <br />
            <asp:GridView ID="GridAgenda" runat="server" AutoGenerateColumns ="False" Width="888px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" />
                    <asp:BoundField DataField="IdVehiculo" HeaderText="Vehiculo" />
                    <asp:BoundField DataField="DscEntrada" HeaderText="Descripcion" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkEliminar" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="linkEliminarAgenda_Click" >Cancelar Agenda</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            
   <br />
   <br />

        </div>
    </form>
</body>
</html>
