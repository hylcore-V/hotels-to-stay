<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!--====== QUICK ENQUIRY FORM ==========-->
    <section>
        <div class="form form-spac rows con-page">
            <div class="container">
                <!-- TITLE & DESCRIPTION -->
                <div class="spe-title col-md-12">
                    <h2><span>Contact us</span></h2>
                    <div class="title-line">
                        <div class="tl-1"></div>
                        <div class="tl-2"></div>
                        <div class="tl-3"></div>
                    </div>
                    <p>World's leading tour and travels Booking website,Over 30,000 packages worldwide. Book travel packages and enjoy your holidays with distinctive experience</p>
                </div>

                <!--====== LOCATON ==========-->
                <section>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-sm-12 col-12">
                                <div class="rows contact-map map-container">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6290413.804893654!2d-93.99620524741552!3d39.66116578737809!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880b2d386f6e2619%3A0x7f15825064115956!2sIllinois%2C+USA!5e0!3m2!1sen!2sin!4v1469954001005" allowfullscreen></iframe>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="">
                                    <div class="contact__form v2-search-form" method="post" action="">
                                        <div class="alert alert-success contact__msg" style="display: none" role="alert">
                                            Thank you for arranging a wonderful trip for us! Our team will contact you shortly!
						
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <asp:TextBox ID="cntname" placeholder="Enter your name" runat="server" required></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <asp:TextBox ID="cntphone" placeholder="Enter your phone" runat="server" required></asp:TextBox>
                                            </div>
                                            <div class="input-field col s6">
                                                <asp:TextBox ID="cntemail" placeholder="Enter your email" runat="server" required></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <asp:TextBox ID="cntcity" placeholder="Select City or Place" runat="server" required></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <asp:Button ID="BtnContactPage" runat="server" Text="Contact Now"  class="waves-effect waves-light tourz-sear-btn v2-ser-btn" OnClick="BtnContactPage_Click"/>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </section>

                <div class="pg-contact">
                    <div class="col-md-3 col-sm-6 col-xs-12 new-con new-con1">
                        <h2>The <span>Places To Go<p>is an Indian online travel company founded in 2023.the company provides online travel services including airline tickets, domestic and international holiday packages, hotel reservations, rail.</p>
                        </span></h2>

                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 new-con new-con1">
                        <img src="img/contact/1.png" alt="" />
                        <h4>Address</h4>
                        <p>
                           Kanchan Villa , Sanjay Colony , Bhilwara 
                                <br />
                            Landmark : Next To Vardhman Colony
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 new-con new-con3">
                        <img src="img/contact/2.png" alt="" />
                        <h4>CONTACT INFO:</h4>
                        <p>
                            <a href="tel:8999292525" class="contact-icon">Phone: +91 8999 292525</a>
                            <br />
                            <a href="tel:8999292525" class="contact-icon">Mobile: +91 8999 292525</a>
                            <br />
                            <a href="mailto:omsharma9367@gmail.com" class="contact-icon">Email: omsharma9367@gmail.com</a>
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 new-con new-con4">
                        <img src="img/contact/3.png" alt="" />
                        <h4>Website</h4>
                        <p>
                            <a href="https://www.instagram.com/1ommsharma/">Instagram: www.instagram.com</a>
                            <br />
                            <a href="https://www.facebook.com/profile.php?id=100026688728467">Facebook: www.facebook.com</a>
                            <br />
                            <a href="https://www.linkedin.com/in/om-sharma-9abb3a258/">Blog: www.linkedin.com</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <!--====== TIPS BEFORE TRAVEL ==========-->


</asp:Content>

