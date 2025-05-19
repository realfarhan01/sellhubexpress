<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false" ValidateRequest="false" CodeFile="BannerManager.aspx.vb" Inherits="Admin_BannerManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Visible="false">
    <div class="form-horizontal" >
        <div class="panel panel-default">
    <div class="panel-heading">
        <h6 class="panel-title">Banner Manager</h6>
        <div class="form-actions text-right">
            <asp:Button ID="btnShowData" runat="server" class="btn btn-primary" Text="Show List" />
        </div>
    </div>
            <div class="panel-body">
                <asp:HiddenField ID="hfId" runat="server" />
                <asp:Literal ID="litmsg" runat="server"></asp:Literal>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Banner </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtBannerName" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Title </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txttitle" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqIntro" runat="server" ControlToValidate="txttitle"
                                ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" style="display:none">
                    <label class="col-sm-2 control-label">Sub Title </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtsubtitle" class="form-control" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtsubtitle"
                                ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Banner Picture </label>
                    <div class="col-sm-10">
                        <asp:FileUpload ID="FUImage" runat="server" />
                        <asp:Image ID="Image1" Width="300px" Visible="false" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Banner Link </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtLink" class="form-control" MaxLength="200" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLink"
                                ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Status </label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlStatus" class="select-full" runat="server">
                            <asp:ListItem Value="0">Active</asp:ListItem>
                            <asp:ListItem Value="1">Deactive</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-actions text-right">
                    <asp:Button ID="btnSubmit" runat="server" ValidationGroup="UserRegistration" class="btn btn-primary" Text="Submit" />
                </div>
            </div>
        </div>
    </div>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server">
    <div class="panel panel-default">
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <div class="panel-heading">
            <h6 class="panel-title">Banner List</h6>
            <%--<div class="form-actions text-right">
                <asp:Button ID="btnAddNew" runat="server" class="btn btn-primary" Text="Add New" />
            </div>--%>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="DataDisplay" class="table table-bordered table-check" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="S.No" >
                    <ItemTemplate>
                        <%#Container.DataItemIndex + 1%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="BannerName" HeaderText="Banner"></asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title"></asp:BoundField>
                <asp:BoundField DataField="Bannersize" HeaderText="Banner Size"></asp:BoundField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <img src="../images/banner/<%#Eval("BannerPic") %>" width="200px" />
                        <asp:HiddenField ID="hfimg" Value='<%#Eval("BannerPic") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="BannerLink" HeaderText="Link"></asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("Cnt") %>' CommandName="edit1" runat="server">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" CommandArgument='<%#Eval("Cnt") %>' CommandName="delete1" runat="server">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Panel>

</asp:Content>

