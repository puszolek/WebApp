<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WebApp.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="load">
    <h2>Photo Gallery</h2>
    <p> Please press button to load new file! :)</p>
    <asp:FileUpload ID="FileUpload" runat="server" />
    <asp:Button ID="BtnUpload" runat="server" Text="Upload" OnClick="BtnUpload_Click" />
    <asp:Label ID="LblStatus" runat="server" Text="" Visible="true"></asp:Label>


    <asp:Repeater ID="RepeaterUserPhoto" runat="server">
    <ItemTemplate>
    <img id="imgUserPhotoImg" src="<%# Container.DataItem %>"
    style="width: 100px; height: 100px;" runat="server" alt="" onmouseover="preview.src=this.src" />
    </ItemTemplate>
    </asp:Repeater>    <img id="preview"
    src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAA‌​
    AAALAAAAAABAAEAAAICR‌​AEAOw==" alt="" width="400" />
</div>
  




</asp:Content>
