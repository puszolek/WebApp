<%@ Page Title="Zarządzanie kontem" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebApp.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Zmień ustawienia konta</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Hasło:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Zmień]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Utwórz]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                    <dt>Logowania zewnętrzne:</dt>
                    <dd><%: LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Zarządzaj]" runat="server" />

                    </dd>
                    <%--
                        Numery telefonów mogą być używane jako drugi etap w systemach uwierzytelniania dwuetapowego.
                        Zobacz <a href="http://go.microsoft.com/fwlink/?LinkId=403804">ten artykuł</a>,
                        aby uzyskać szczegółowe informacje na temat konfigurowania tej aplikacji ASP.NET do obsługi uwierzytelniania dwuetapowego przy użyciu wiadomości SMS.
                        Po skonfigurowaniu uwierzytelniania dwuetapowego usuń komentarz z następujących bloków
                    --%>
                    <%--
                    <dt>Numer telefonu:</dt>
                    <% if (HasPhoneNumber)
                       { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Dodaj]" />
                    </dd>
                    <% }
                       else
                       { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Zmień]" /> &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Usuń]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>
                    --%>

                    <dt>Uwierzytelnianie dwuetapowe:</dt>
                    <dd>
                        <p>
                            Nie skonfigurowano dostawców uwierzytelniania dwuetapowego. Zobacz <a href="https://go.microsoft.com/fwlink/?LinkId=403804">ten artykuł</a>,
                            aby uzyskać szczegółowe informacje na temat konfigurowania aplikacji ASP.NET do obsługi uwierzytelniania dwuetapowego.
                        </p>
                        <% if (TwoFactorEnabled)
                          { %> 
                        <%--
                        Włączono
                        <asp:LinkButton Text="[Wyłącz]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        --%>
                        <% }
                          else
                          { %> 
                        <%--
                        Wyłączono
                        <asp:LinkButton Text="[Włącz]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                        --%>
                        <% } %>
                    </dd>
                </dl>
            </div>
        </div>
    </div>

</asp:Content>
