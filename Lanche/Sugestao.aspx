<%@ Page Title="" Language="C#" MasterPageFile="~/Usuariosmaster.master" AutoEventWireup="true" CodeFile="Sugestao.aspx.cs" Inherits="Sugestao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="corpoCadastro">
        <div class="box">
            <div class="formula">
                <h2>Sugestão</h2>
                <div class="row">
                    <div class="col-md-12 mt-3 mb-3">
                       <label class="label">Seu E-mail</label>
                        <asp:textbox id="lblemail" runat="server" type="text" Class="form-control"></asp:textbox>
                    </div>
                    
                    <div class="col-md-12 mb-3">
                        <label class="label">Assunto:</label>
                        <asp:textbox id="assunto" runat="server"  type="text" Class="form-control"></asp:textbox>
                    </div>
                    <div class="col-md-12 mb-3">
                        <label class="label">Descrição de assunto:</label>
                        <asp:textbox id="desc" runat="server" TextMode="MultiLine"  type="text" Class="form-control"></asp:textbox>
                    </div>
                    <div class="col-md-12 centro mt-3">
                               
                        <asp:button runat="server" text="Enviar" id="btnenvi" Onclick="btnc_Click" CssClass="btn botao corBotao "  width="120px"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

