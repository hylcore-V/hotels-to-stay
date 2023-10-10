<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--====== NAVIGATION MENU ==========-->
    <section>
        <div class="rows main_menu">
            <div class="container res-menu">
                <nav class="navbar navbar-inverse">
                    <div>
                        <!-- Brand and toggle get grouped for better mobile display(MOBILE MENU) -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                            <img src="images/logo.png" alt="" class="mob_logo" />
                        </div>
                        <!-- NAVIGATION MENU -->
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav">
                                <li><a href="main.aspx">Home</a> </li>
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Packages <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="family-package.aspx">Family Package</a> </li>
                                        <li><a href="honeymoon-package.aspx">Honeymoon Package</a> </li>
                                        <li><a href="group-package.aspx">Group Package</a> </li>
                                        <li><a href="weekend-package.aspx">WeekEnd Package</a> </li>
                                        <li><a href="regular-package.aspx">Regular Package</a> </li>
                                    </ul>
                                </li>
                                <li><a href="hotels-list.aspx">Hotels</a> </li>
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Sight Seeing <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="places.aspx">Tour Place - 1</a> </li>
                                        <li><a href="places-1.aspx">Tour Place - 2</a> </li>
                                        <li><a href="places-2.aspx">Tour Place - 3</a> </li>
                                    </ul>
                                </li>
                                <li><a href="events.aspx">Events</a> </li>
                                <li><a href="blog.aspx">Blog</a> </li>
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Pages <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="about.aspx">About Us</a> </li>
                                        <li><a href="testimonials.aspx">Testimonials</a> </li>
                                        <li><a href="events.aspx">Events</a> </li>
                                        <li><a href="tips.aspx">Tips Before Travel</a> </li>
                                        <li><a href="price-list.aspx">Price List</a> </li>
                                        <li><a href="discount.aspx">Discount</a> </li>
                                        <li><a href="faq.aspx">FAQ</a> </li>
                                        <li><a href="sitemap.aspx">Site map</a> </li>
                                        <li><a href="404.aspx">404 Page</a> </li>
                                    </ul>
                                </li>
                                <li><a href="contact.aspx">Contact Us</a> </li>
                            </ul>
                            <div class="menu_book"><a href="booking.aspx">Book Your Package</a> </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </section>
    <!--DASHBOARD-->
    <section>
        <div class="tr-register">
            <div class="tr-regi-form">
                <h4>Create an Account</h4>
                <p>It's free and always will be.</p>
                <div class="col s12">
                    <div class="row">
                        <div class="input-field col m6 s12">
                            <asp:TextBox ID="txtfname" type="text" placeholder="First Name" runat="server" required></asp:TextBox>
                        </div>
                        <div class="input-field col m6 s12">
                            <asp:TextBox ID="txtlname" type="text" placeholder="Last Name" runat="server" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="txtmobile" type="number" placeholder="Mobile" runat="server" OnTextChanged="txtmobile_TextChanged" AutoPostBack="true" required></asp:TextBox>
                            <asp:Label ID="lblmobile" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="txtemail" type="email" placeholder="Email" runat="server" OnTextChanged="txtemail_TextChanged" AutoPostBack="true" required></asp:TextBox>
                            <asp:Label ID="lblemail" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="txtpassword" type="password" placeholder="Password" runat="server" OnTextChanged="txtpassword_TextChanged" AutoPostBack="true" required></asp:TextBox>
                            <asp:Label ID="lblpassword" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="txtconfirmpassword" type="password" placeholder="Confirm Password" runat="server" OnTextChanged="txtconfirmpassword_TextChanged" AutoPostBack="true" required></asp:TextBox>
                            <asp:Label ID="lblconfirmpassword" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:Button ID="BtnRegister" OnClick="BtnRegister_Click" runat="server" Text="submit"  type="submit" value="submit" class="waves-effect waves-light btn-large full-btn"/>
                        </div>
                    </div>
                </div>
                <p>
                    Are you a already member ? <a href="login.aspx">Click to Login</a>
                </p>
            </div>
        </div>
    </section>
    <!--END DASHBOARD-->
    <!--====== TIPS BEFORE TRAVEL ==========-->
    <section>
        <div class="rows tips tips-home tb-space home_title">
            <div class="container tips_1">
                <!-- TIPS BEFORE TRAVEL -->
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <h3>Tips Before Travel</h3>
                    <div class="tips_left tips_left_1">
                        <h5>Bring copies of your passport</h5>
                        <p>Aliquam pretium id justo eget tristique. Aenean feugiat vestibulum blandit.</p>
                    </div>
                    <div class="tips_left tips_left_2">
                        <h5>Register with your embassy</h5>
                        <p>Mauris efficitur, ante sit amet rhoncus malesuada, orci justo sollicitudin.</p>
                    </div>
                    <div class="tips_left tips_left_3">
                        <h5>Always have local cash</h5>
                        <p>Donec et placerat ante. Etiam et velit in massa. </p>
                    </div>
                </div>
                <!-- CUSTOMER TESTIMONIALS -->
                <div class="col-md-8 col-sm-6 col-xs-12 testi-2">
                    <!-- TESTIMONIAL TITLE -->
                    <h3>Customer Testimonials</h3>
                    <div class="testi">
                        <h4>John William</h4>
                        <p>Ut sed sem quis magna ultricies lacinia et sed tortor. Ut non tincidunt nisi, non elementum lorem. Aliquam gravida sodales</p>
                        <address>Illinois, United States of America</address>
                    </div>
                    <!-- ARRANGEMENTS & HELPS -->
                    <h3>Arrangement & Helps</h3>
                    <div class="arrange">
                        <ul>
                            <!-- LOCATION MANAGER -->
                            <li>
                                <a href="#">
                                    <img src="images/Location-Manager.png" alt="">
                                </a>
                            </li>
                            <!-- PRIVATE GUIDE -->
                            <li>
                                <a href="#">
                                    <img src="images/Private-Guide.png" alt="">
                                </a>
                            </li>
                            <!-- ARRANGEMENTS -->
                            <li>
                                <a href="#">
                                    <img src="images/Arrangements.png" alt="">
                                </a>
                            </li>
                            <!-- EVENT ACTIVITIES -->
                            <li>
                                <a href="#">
                                    <img src="images/Events-Activities.png" alt="">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

