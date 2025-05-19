<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false" ValidateRequest="false" CodeFile="ordermaster.aspx.vb" Inherits="Admin_ordermaster" %>

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
            <asp:Literal ID="litmsg" runat="server"></asp:Literal>
            <div class="form-horizontal" >
                <div class="panel panel-default" id="div1" runat="server" visible="false">
                    <div class="panel-heading"><h6 class="panel-title">Order Details</h6>
                    <span style="text-align:right;display:block;">
                        <asp:Button ID="btnList" runat="server" Text="View Order List" CssClass="btn btn-primary" />
                    </span></div>
                    <div class="panel-body">
                        <asp:HiddenField ID="hfId" runat="server" />
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tracking No. </label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtTrackingNo" class="form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTrackingNo"
                                        ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>
                            </div>
                            <label class="col-sm-2 control-label">AWB No.</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtAWBNo" class="form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAWBNo"
                                        ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Shipping Date </label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtShippingDate" runat="server" Width="300px"  class="form-control datepicker"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtShippingDate"
                                        ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>
                            </div>
                            <label class="col-sm-2 control-label">Service Provider</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtServiceProvider" Width="300px" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtServiceProvider"
                                        ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Destination</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtDestination" Width="300px" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDestination"
                                        ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>
                            </div>
                            <label class="col-sm-2 control-label">Consignee Name</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtConsigneeName" Width="300px" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtConsigneeName"
                                        ErrorMessage="*" ValidationGroup="UserRegistration">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Delivery Status </label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddlStatus" class="select" Width="400px" runat="server">
                                    <asp:ListItem Value="Shipment Booked">Shipment Booked</asp:ListItem>
                                    <asp:ListItem Value="In Transit">In Transit</asp:ListItem>
                                    <asp:ListItem Value="Out For Delivery">Out For Delivery</asp:ListItem>
                                    <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-actions text-right">
                            <asp:Button ID="btnSubmit" runat="server" ValidationGroup="UserRegistration" class="btn btn-primary" Text="Submit" />
                        </div>
                        </div></div>

                         <div class="panel panel-default" id="div2" runat="server">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                        <div class="panel-heading"><h6 class="panel-title">Order List</h6>
                            <span style="text-align:right;display:block;">
                                <asp:Button ID="btnAdd" runat="server" Text="Add New Order" CssClass="btn btn-primary" />
                            </span></div>
                <div class="table-responsive">
                
                        <asp:GridView ID="DataDisplay" class="table table-bordered table-check" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No" >
                            <ItemTemplate>
                                <%#Container.DataItemIndex + 1%>
                            </ItemTemplate>
                                                          
                            </asp:TemplateField>
                             <asp:TemplateField>
                                 <ItemTemplate>
                                     <asp:LinkButton ID="LinkButton2" CommandArgument='<%#Eval("OrderId") %>' CommandName="Add1" runat="server">Add Status</asp:LinkButton>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:BoundField DataField="OrderId" HeaderText="Order Id"></asp:BoundField>
                             <asp:BoundField DataField="TrackingNo" HeaderText="Tracking No"></asp:BoundField>
                             <asp:BoundField DataField="AWBNo" HeaderText="AWB No"></asp:BoundField>
                             <asp:BoundField DataField="Dated" HeaderText="Shipping Date"></asp:BoundField>
                             <asp:BoundField DataField="ServiceProvider" HeaderText="Service Provider"></asp:BoundField>
                             <asp:BoundField DataField="Destination" HeaderText="Destination"></asp:BoundField>
                             <asp:BoundField DataField="ConsigneeName" HeaderText="ConsigneeName"></asp:BoundField>
                             <asp:BoundField DataField="DeliveryStatus" HeaderText="Delivery Status"></asp:BoundField>
                             <asp:TemplateField>
                                 <ItemTemplate>
                                     <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("OrderId") %>' CommandName="Edit1" runat="server">Edit</asp:LinkButton>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField>
                                 <ItemTemplate>
                                     <asp:LinkButton ID="LinkButton3" CommandArgument='<%#Eval("OrderId") %>' OnClientClick="if ( !confirm('Are you sure you want to delete?')) return false;" CommandName="Delete1" runat="server">Delete</asp:LinkButton>
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                        </asp:GridView>
                        </div></div>
                
                <div class="panel panel-default" id="div3" runat="server" visible="false">
                    <div class="panel-heading"><h6 class="panel-title">Order Details</h6>
                    <span style="text-align:right;display:block;">
                        <asp:Button ID="btnList2" runat="server" Text="View Order List" CssClass="btn btn-primary" />
                    </span></div>
                    <div class="panel-body">
                        <asp:HiddenField ID="HiddenField2" runat="server" />
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tracking No. </label>
                            <div class="col-sm-4">
                                <asp:Literal ID="LitTrackingNo" runat="server"></asp:Literal>
                            </div>
                            <label class="col-sm-2 control-label">AWB No.</label>
                            <div class="col-sm-4">
                                <asp:Literal ID="LitAWBNo" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Date </label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtDate1" runat="server" Width="300px"  class="form-control datepicker"></asp:TextBox>
                            </div>
                            <label class="col-sm-2 control-label">Delivery Status </label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddlDeliveryStatus1" class="select" Width="400px" runat="server">
                                    <asp:ListItem Value="Shipment Booked">Shipment Booked</asp:ListItem>
                                    <asp:ListItem Value="In Transit">In Transit</asp:ListItem>
                                    <asp:ListItem Value="Out For Delivery">Out For Delivery</asp:ListItem>
                                    <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Delivery Details</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtDeliveryDetails1" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-actions text-right">
                            <asp:Button ID="btnAddDetails" runat="server" class="btn btn-primary" Text="Submit" />
                        </div>
                        </div>
                    <div class="table-responsive">
                
                        <asp:GridView ID="gvdetails" class="table table-bordered table-check" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No" >
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                </ItemTemplate>                
                            </asp:TemplateField>
                             <asp:BoundField DataField="Dated" HeaderText="Dated"></asp:BoundField>
                             <asp:BoundField DataField="DeliveryStatus" HeaderText="Delivery Status"></asp:BoundField>
                            <asp:TemplateField HeaderText="Details" >
                                <ItemTemplate>
                                    <%#Eval("DeliveryDetails") %>
                                </ItemTemplate>                
                            </asp:TemplateField>
                         </Columns>
                        </asp:GridView>
                        </div>
                </div>
</div>
</asp:Content>

