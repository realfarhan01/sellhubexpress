<%@ Page Title="" Language="VB" MasterPageFile="~/web.master" AutoEventWireup="false" CodeFile="tools.aspx.vb" Inherits="tools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="page-title" style="background-image: url(images/background/2.jpg);">
		<div class="auto-container">
			<div class="title-outer">
				<h1 class="title">Tools</h1>
				<ul class="page-breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Tools</li>
				</ul>
			</div>
		</div>
	</section>

	<section class="tool-section">
		<div class="auto-container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="form-design">
						<div class="sec-title" style="margin-bottom: 20px;">
							<h4>Volumetric Weight Calculator & Formula</h4>
							<span class="sub-title">Calculate the volumetric weight of your parcel</span>
						</div>
						<div class="calculation-form">
							<img src="images/calculation-img.png" style="padding-bottom: 30px;">
								<div class="row radio-btn">
									<div class="col-md-4">
										<h6>Package type</h6>
									</div>
									<div class="col-md-8">
                                        <asp:RadioButtonList ID="RadioButtonList1" RepeatDirection="Horizontal" Width="400px" runat="server">
                                            <asp:ListItem Value="Box">Box</asp:ListItem>
                                            <asp:ListItem Value="Tube">Tube</asp:ListItem>
                                        </asp:RadioButtonList>
									</div>
								</div>
								<div class="row radio-btn">
									<div class="col-md-4">
										<h6>Units of Measure</h6>
									</div>
									<div class="col-md-8">
                                        <asp:RadioButtonList ID="RadioButtonList2" RepeatDirection="Horizontal" Width="400px" runat="server">
                                            <asp:ListItem Value="Cm/Kg">Cm/Kg</asp:ListItem>
                                            <asp:ListItem Value="Inches/Pounds">Inches/Pounds</asp:ListItem>
                                        </asp:RadioButtonList>
									</div>
								</div>
								<div class="row input-field">
									<div class="col-md-8">
										<label>Length ( cm )</label>
                                        <asp:TextBox ID="txtLength" runat="server" MaxLength="6" placeholder="Length" class="form-control" required></asp:TextBox>

										<label>Width ( cm )</label>
										<asp:TextBox ID="txtWidth" runat="server" MaxLength="6" placeholder="Width" class="form-control" required></asp:TextBox>

										<label>Height ( cm )</label>
										<asp:TextBox ID="txtHeight" runat="server" MaxLength="6" placeholder="Height" class="form-control" required></asp:TextBox>
                                        <asp:Button ID="btnSubmit" runat="server" class="calculation-submit-btn" Text="CONVERT" />
                                        <div runat="server" id="divresult" visible="false">
										    <h6>Volumetric Weight</h6>
							                <span class="sub-title" style="color:#ca1f26; font-weight:bold;border:1px solid red;padding: 2px 20px;">
                                                <asp:Literal ID="LitResult" runat="server"></asp:Literal>
							                </span>
                                        </div>
								</div>
									
								<div class="col-md-4">
									<img src="images/calculation-img02.png" style="padding-top: 30px;">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</section>
</asp:Content>

