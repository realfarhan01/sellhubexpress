<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false" ValidateRequest="false" CodeFile="Destinations2.aspx.vb" Inherits="Admin_Destinations2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="tinymce/tinymce.min.js"></script>
<script type="text/javascript">
    tinymce.init({
        selector: "textarea",
        extended_valid_elements: 'span',
        theme: "modern",
        plugins: [
        "advlist autolink lists link image charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars code fullscreen",
        "insertdatetime media nonbreaking save table contextmenu directionality",
        "emoticons template paste textcolor colorpicker textpattern imagetools"
    ],
        toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
        toolbar2: "print preview media | forecolor backcolor emoticons",
        image_advtab: true,
        templates: [
        { title: 'Test template 1', content: 'Test 1' },
        { title: 'Test template 2', content: 'Test 2' }
    ]
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Visible="false">
    <div class="form-horizontal" >
        <div class="panel panel-default">
    <div class="panel-heading">
        <h6 class="panel-title">Destinations</h6>
        <div class="form-actions text-right">
            <asp:Button ID="btnShowData" runat="server" class="btn btn-primary" Text="Show List" />
        </div>
    </div>
            <div class="panel-body">
                <asp:HiddenField ID="hfId" runat="server" />
                <asp:Literal ID="litmsg" runat="server"></asp:Literal>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Destination Name </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txttitle" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqIntro" runat="server" ControlToValidate="txttitle"
                                ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Picture </label>
                    <div class="col-sm-10">
                        <asp:FileUpload ID="FUImage" runat="server" />
                        <asp:Image ID="Image1" Width="300px" Visible="false" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Description </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtNews" class="form-control" TextMode="multiLine" Columns="60" Rows="10" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">State </label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlState" AppendDataBoundItems="true" class="select-search" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Place </label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlCity" AppendDataBoundItems="true" class="select-search" runat="server">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                        </asp:DropDownList>
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
        <h6 class="panel-title">Destinations</h6>
        <div class="form-actions text-right">
            <asp:Button ID="btnAddNew" runat="server" class="btn btn-primary" Text="Add New" />
        </div>
    </div>
    <div class="table-responsive">
        <asp:GridView ID="DataDisplay" class="table table-bordered table-check" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:TemplateField HeaderText="S.No" >
                <ItemTemplate>
                    <%#Container.DataItemIndex + 1%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Title" HeaderText="Title"></asp:BoundField>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <img src="../images/news/<%#Eval("NewsPic") %>" width="200px" />
                    <asp:HiddenField ID="hfimg" Value='<%#Eval("NewsPic") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("Cnt") %>' CommandName="edit1" runat="server">Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%#Eval("Cnt") %>' CommandName="delete1" runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>
</asp:Panel>

</asp:Content>

