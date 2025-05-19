<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false" ValidateRequest="false" CodeFile="tourpackagemaster.aspx.vb" Inherits="Admin_tourpackagemaster" %>

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
<style>
    input[type="checkbox"] {
        margin: 3px 5px 0;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" Runat="Server">
<!-- Form components -->
                        <asp:Literal ID="litmsg" runat="server"></asp:Literal>
            <div class="form-horizontal" >



                <!-- Basic inputs -->
                <div class="panel panel-default" id="div1" runat="server">
                    <div class="panel-heading"><h6 class="panel-title">Add/Edit Tour Package </h6> 
                    <span style="text-align:right;display:block;">
                        <asp:Button ID="btnList" runat="server" Text="Tour Package List" CssClass="btn btn-primary" />
                    </span></div>
                    <div class="panel-body">
                        <asp:HiddenField ID="hfId" runat="server" />
                       <%-- <div class="alert alert-info fade in widget-inner">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            Default form components, including bootstrap additions and tags
                        </div>--%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Category </label>
                            <div class="col-sm-10">
                                
                                <asp:CheckBoxList ID="chkCategories" runat="server" Width="100%" AppendDataBoundItems="true" RepeatColumns="3" RepeatDirection="Horizontal">
                                </asp:CheckBoxList>
                               <%-- <asp:dropdownlist id="ddlCategory" class="form-control" AppendDataBoundItems="true"  runat="server">
                                    <asp:ListItem Value="">Select Category</asp:ListItem>
                                </asp:dropdownlist>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tour Package Name </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtProductName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Package Days </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtPackageDays" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Package Price (Per Person) </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtPackagePricePP" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Image 1 </label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Image 2 </label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="FileUpload2" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Image 3 </label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="FileUpload3" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Image 4 </label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="FileUpload4" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <%--<label class="col-sm-2 control-label">&nbsp; </label>--%>
                            <div class="col-sm-10">
                                <a href='../images/tours/<%= Image1 %>' target="_blank" >
                                    <img style="width:150px" alt="" src='../images/tours/<%= Image1 %>'></img></a>
                                <a href='../images/tours/<%= Image2 %>' target="_blank" >
                                    <img style="width:150px" alt="" src='../images/tours/<%= Image2 %>'></img></a>
                                <a href='../images/tours/<%= Image3 %>' target="_blank" >
                                    <img style="width:150px" alt="" src='../images/tours/<%= Image3 %>'></img></a>
                                <a href='../images/tours/<%= Image4 %>' target="_blank" >
                                    <img style="width:150px" alt="" src='../images/tours/<%= Image4 %>'></img></a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tour RoadMap </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtRoadMap" class="form-control" Height="40px" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tour RoadMap Image </label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="FileUpload5" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group" style="display:none">
                            <label class="col-sm-2 control-label">Short Description </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtShortDesc" class="form-control" Height="100px" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group" style="display:none">
                            <label class="col-sm-2 control-label">Tour Package Description </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtProductDesc" class="form-control" Height="300px" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tour Package Itinerary </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtPackageItinerary" class="form-control" Height="500px" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Tour Package Inclusion </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtPackageInclusion" class="form-control" Height="400px" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group" style="display:none">
                            <label class="col-sm-2 control-label">Location Map Embed</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtLocationEmbed" class="form-control" Height="50px" TextMode="MultiLine" runat="server"></asp:TextBox>
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
                         <div class="form-group">
                            <label class="col-sm-2 control-label">Show On Home Page </label>
                            <div class="col-sm-10">
                                <asp:DropDownList ID="ddlShow" class="select-full" runat="server">
                                 <asp:ListItem Value="1">Show</asp:ListItem>
                                <asp:ListItem Value="0">Hide</asp:ListItem>
                                </asp:DropDownList>
                                 
                            </div>
                        </div>

                         <div class="form-actions text-right">
                                <asp:Button ID="btnSubmit" runat="server" ValidationGroup="UserRegistration" class="btn btn-primary" Text="Submit" />
                       
                        </div>
                        </div>

                    <div class="panel panel-default" id="div3" runat="server">
                        <div class="panel-heading">
                            <h6 class="panel-title">Tour Gallary</h6>
                        </div>
                        <div class="panel-body">
                            <asp:Literal ID="litmsg2" runat="server"></asp:Literal>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Image 1 </label>
                                <div class="col-sm-10">
                                    <asp:FileUpload ID="FUImg1" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Image 2 </label>
                                <div class="col-sm-10">
                                    <asp:FileUpload ID="FUImg2" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Image 3 </label>
                                <div class="col-sm-10">
                                    <asp:FileUpload ID="FUImg3" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Image 4 </label>
                                <div class="col-sm-10">
                                    <asp:FileUpload ID="FUImg4" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Image 5 </label>
                                <div class="col-sm-10">
                                    <asp:FileUpload ID="FUImg5" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Image 6 </label>
                                <div class="col-sm-10">
                                    <asp:FileUpload ID="FUImg6" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <a href='../images/tours/<%= TourImg1 %>' target="_blank" >
                                        <img style="width:150px" alt="" src='../images/tours/<%= TourImg1 %>'/></a>
                                    <a href='../images/tours/<%= TourImg2 %>' target="_blank" >
                                        <img style="width:150px" alt="" src='../images/tours/<%= TourImg2 %>'/></a>
                                    <a href='../images/tours/<%= TourImg3 %>' target="_blank" >
                                        <img style="width:150px" alt="" src='../images/tours/<%= TourImg3 %>'/></a>
                                    <a href='../images/tours/<%= TourImg4 %>' target="_blank" >
                                        <img style="width:150px" alt="" src='../images/tours/<%= TourImg4 %>'/></a>
                                    <a href='../images/tours/<%= TourImg5 %>' target="_blank" >
                                        <img style="width:150px" alt="" src='../images/tours/<%= TourImg5 %>'/></a>
                                    <a href='../images/tours/<%= TourImg6 %>' target="_blank" >
                                        <img style="width:150px" alt="" src='../images/tours/<%= TourImg6 %>'/></a>
                                </div>
                            </div>
                             <div class="form-actions text-right">
                                    <asp:Button ID="btnAddTourImages" runat="server" ValidationGroup="UserRegistration" class="btn btn-primary" Text="Submit" />
                            </div>
                        </div>
                    </div>
                </div>

                         <div class="panel panel-default" id="div2" runat="server">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                <div class="panel-heading"><h6 class="panel-title">Tour Package List</h6>
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
                             <asp:TemplateField ItemStyle-Width="200px">
                                 <HeaderTemplate>Tour Package Name</HeaderTemplate>
                                 <ItemTemplate>
                                     <%#Eval("PackageName") %>                                                        
                                 </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField ItemStyle-Width="200px">
                                 <HeaderTemplate>Category</HeaderTemplate>
                                 <ItemTemplate>
                                     <%#Eval("ProductCategory") %>                                                        
                                 </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                 <ItemTemplate>
                                     <a href='../images/tours/<%#Eval("Image1") %>' target="_blank" >
                                    <img style="width:150px" alt="" src='../images/tours/<%#Eval("Image1") %>'></img></a>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:BoundField DataField="PackageDays" HeaderText="Package Days"></asp:BoundField>
                             <asp:BoundField DataField="PackagePricePP" HeaderText="Price PP"></asp:BoundField>
                             <asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>
                         
                   

                         <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton3" CommandArgument='<%#Eval("PackageId") %>' CommandName="Deactivate1" runat="server">Edit</asp:LinkButton>
                         </ItemTemplate>
                         
                         </asp:TemplateField>
                         
                         <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton2" CommandArgument='<%#Eval("PackageId") %>' CommandName="Delete1" runat="server">Delete</asp:LinkButton>
                         </ItemTemplate>
                         
                         </asp:TemplateField>
                         </Columns>
                        </asp:GridView>
                        </div></div>
</div>
</asp:Content>

