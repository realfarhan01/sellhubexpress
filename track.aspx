<%@ Page Title="" Language="VB" MasterPageFile="~/web.master" AutoEventWireup="false" CodeFile="track.aspx.vb" Inherits="track" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="page-title" style="background-image: url(images/background/2.jpg);">
        <div class="auto-container">
            <div class="title-outer">
                <h1 class="title">Track</h1>
                <ul class="page-breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li>Track</li>
                </ul>
            </div>
        </div>
    </section>

    <section class="tracking-section pull-down">
        <div class="auto-container">
            <div class="outer-box">
                <div class="arrow-box wow fadeInRight animated" style="visibility: visible; animation-name: fadeInRight;">
                    <img src="images/icons/arrow-2.png" alt="" class="icon">
                </div>
                <div class="tracking-form" style="margin: 50px 0px;">
                    <h4 class="title">Track Your Order</h4>
                    <div class="track">
                        <div class="row">
                            <div class="form-group col-lg-8 col-md-12 col-sm-12">
                                <span class="icon lnr-icon-earth"></span>
                                <asp:TextBox ID="txtTrackingNo" placeholder="Enter Your Tracking Id" class="form-control" runat="server"></asp:TextBox>
                                <%--								<input type="text" name="field_name">--%>
                            </div>
                            <div class="form-group col-lg-4 col-md-12 col-sm-12 text-end">
                                <a href="https://app.couriermitra.com/tracking/Tracking?Token=9KlanSjS40TL7Wu7cI7AsyWsf&AwbNo" class="btn-title theme-btn btn-style-one ">Track Order</a>
                                <%--<asp:Button ID="btnSubmit" runat="server" class="btn-title theme-btn btn-style-one " Text="Track Order" />--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <span style="padding: 20px; font-size: 20px; color: red;">
                <asp:Literal ID="litmsg" runat="server"></asp:Literal></span>
            <div class="row" style="padding-bottom: 50px;" id="divdetail" runat="server" visible="false">
                <h2>Tracking Details</h2>
                <div class="col-md-6">
                    <div class="tracking-table">
                        <div class="shipment-box">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h6 style="color: #fff;">Shipment Details</h6>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="bg-box">
                                        <asp:Literal ID="LitTrackingNo" runat="server"></asp:Literal></h6>
                                </div>
                            </div>
                        </div>
                        <table class="table">
                            <tr>
                                <td><strong>AWB NO</strong></td>
                                <td>
                                    <asp:Literal ID="LitAWBNo" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td><strong>Shipping Date</strong></td>
                                <td>
                                    <asp:Literal ID="LitShippingDate" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td><strong>Tracking No</strong></td>
                                <td>
                                    <asp:Literal ID="LitTrackingNo2" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td><strong>Service Provider</strong></td>
                                <td>
                                    <asp:Literal ID="LitServiceProvider" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td><strong>Destination</strong></td>
                                <td>
                                    <asp:Literal ID="LitDestination" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td><strong>Consignee Name</strong></td>
                                <td>
                                    <asp:Literal ID="LitConsigneeName" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td><strong>Delivery Status</strong></td>
                                <td>
                                    <asp:Literal ID="LitDeliveryStatus" runat="server"></asp:Literal></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="track-order-details">
                        <h4 class="text-center">
                            <asp:Literal ID="LitDeliveryStatus2" runat="server"></asp:Literal></h4>
                        <div class="progress_bar">
                            <ul>
                                <asp:Literal ID="LitProcessBar" runat="server"></asp:Literal>
                                <%--<li><span class="box-bodr"><i class="fa fa-check"></i></span>Shipment</li>
								<li><span class="box-bodr"><i class="fa fa-check"></i></span>Shipment</li>
								<li><span class="box-bodr"><i class="fa fa-check"></i></span>Shipment</li>
								<li><span class="green-box"><i class="fa fa-check"></i></span>Shipment</li>--%>
                            </ul>
                        </div>
                        <h5 class="text-center" style="margin: 30px 0px;">
                            <asp:Literal ID="LitServiceProvider2" runat="server"></asp:Literal>
                            -
                            <asp:Literal ID="LitAWBNo2" runat="server"></asp:Literal></h5>



                        <div class="section light-bg">
                            <div class="sigma_timeline" style="height: 500px; overflow-y: scroll;">
                                <asp:Repeater ID="rptData" runat="server">
                                    <ItemTemplate>
                                        <div class="row g-0 justify-content-end justify-content-md-around align-items-start sigma_timeline-nodes">
                                            <div class="col-10 col-md-10 order-3 sigma_timeline-content">
                                                <div class="sigma_timeline-date">
                                                    <span><%# Eval("DeliveryStatus") %></span><br />
                                                    <span class="sigma_timeline-month"><%# Eval("Dated") %></span>
                                                </div>
                                                <p><%# Eval("DeliveryDetails") %></p>
                                            </div>
                                            <div class="col-2 col-sm-1 px-md-3 order-2 sigma_timeline-image text-md-center">
                                                <i class="far fa-circle"></i>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
        </div>
    </section>
</asp:Content>

