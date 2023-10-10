<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--DASHBOARD-->
    <section>
        <div class="tr-register">
            <div class="tr-regi-form">
                <h4>Sign In</h4>
                <p>It's free and always will be.</p>
                <div class="col s12">
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="txtusername" type="email" placeholder="Email" runat="server" OnTextChanged="txtusername_TextChanged" AutoPostBack="true" required></asp:TextBox>
                            <asp:Label ID="lblusername" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <<div class="input-field col s12">
                            <asp:TextBox ID="txtpassword" type="password" placeholder="Password" runat="server" OnTextChanged="txtpassword_TextChanged" AutoPostBack="true" required></asp:TextBox>
                            <asp:Label ID="lblpassword" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Button ID="BtnLogIn" OnClick="BtnLogIn_Click" runat="server" Text="Log In" type="submit" value="Log In" class="waves-effect waves-light btn-large full-btn" />
                        </div>
                </div>
                <p>
                    <a href="forgot-pass.aspx">forgot password</a> | Are you a new user ? <a href="register.aspx">Register</a>
                </p>
                <div class="soc-login">
                    <h4>Sign in using</h4>
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook fb1"></i>Facebook</a> </li>
                        <li><a href="#"><i class="fa fa-twitter tw1"></i>Twitter</a> </li>
                        <li><a href="#"><i class="fa fa-google-plus gp1"></i>Google</a> </li>
                    </ul>
                </div>
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

