<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false" ValidateRequest="false" CodeFile="hotels.aspx.vb" Inherits="Admin_hotels" %>

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
<!-- Form components -->
            <div class="form-horizontal" >



                <!-- Basic inputs -->
                <div class="panel panel-default" id="div1" runat="server">
                    <div class="panel-heading"><h6 class="panel-title">Add/Edit Destination </h6> </div>
                    <div class="panel-body">
                        <asp:HiddenField ID="hfId" runat="server" />
                       <%-- <div class="alert alert-info fade in widget-inner">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            Default form components, including bootstrap additions and tags
                        </div>--%>
                        <asp:Literal ID="litmsg" runat="server"></asp:Literal>
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
                                <asp:dropdownlist id="ddlPlace" class="form-control" AppendDataBoundItems="true"  runat="server">
                                    <asp:ListItem Value="">Select Place</asp:ListItem>
                                </asp:dropdownlist>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Type </label>
                            <div class="col-sm-10">
                                <asp:dropdownlist id="ddlHotelType" class="form-control" AppendDataBoundItems="true"  runat="server">
                                    <asp:ListItem Value="">Select Type</asp:ListItem>
                                </asp:dropdownlist>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Hotel Name </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtDestination" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Hotel Image </label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="FileUpload" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Description </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtProductDesc" class="form-control" Height="200px" TextMode="MultiLine" runat="server"></asp:TextBox>
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
                        </div></div>

                         <div class="panel panel-default" id="div2" runat="server">
                <div class="panel-heading"><h6 class="panel-title">Hotel List</h6>
                    <span style="text-align:right;display:block;">
                        <asp:Button ID="btnAdd" runat="server" Text="Add New" CssClass="btn btn-primary" />
                    </span>

                </div>
                <div class="table-responsive">
                
                        <asp:GridView ID="DataDisplay" class="table table-bordered table-check" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No" >
                            <ItemTemplate>
                                <%#Container.DataItemIndex + 1%>
                            </ItemTemplate>
                                                          
                            </asp:TemplateField>
                             <asp:BoundField DataField="HotelName" HeaderText="Hotel Name"></asp:BoundField>
                             <asp:BoundField DataField="HotelType" HeaderText="Type"></asp:BoundField>
                             <asp:TemplateField>
                                 <ItemTemplate>
                                     <a href='../images/hotels/<%#Eval("ImageName") %>' target="_blank" >
                                    <img style="width:150px" alt="" src='../images/hotels/<%#Eval("ImageName") %>'></img></a>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:BoundField DataField="State" HeaderText="State"></asp:BoundField>
                             <asp:BoundField DataField="Place" HeaderText="Place"></asp:BoundField>
                             <asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>
                         
                   

                         <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton3" CommandArgument='<%#Eval("Cnt") %>' CommandName="Edit1" runat="server">Edit</asp:LinkButton>
                         </ItemTemplate>
                         
                         </asp:TemplateField>
                         
                         <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton2" CommandArgument='<%#Eval("Cnt") %>' CommandName="Delete1" runat="server">Delete</asp:LinkButton>
                         </ItemTemplate>
                         
                         </asp:TemplateField>
                         </Columns>
                        </asp:GridView>
                        </div></div>
</div>
</asp:Content>

