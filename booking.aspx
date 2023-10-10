<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="booking.aspx.cs" Inherits="booking" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
            .ajax__calendar_container {
            z-index: 1000;
        }

        .v2-search-form .imgPopup {
            background: #fff;
            border: 0px;
            height: 35px;
            vertical-align: middle;
            border-radius: 0px;
            padding: 0px;
            box-sizing: border-box;
            border: none;
        }

        #alertmsg {
            display: none;
        }

        #ContentPlaceHolder1_BtnBooking {
            padding: 6px 15px;
            border-radius: 2px;
            display: inline-block;
            font-family: 'Quicksand', sans-serif;
            font-weight: 700;
            text-decoration: none;
            text-transform: uppercase;
            cursor: pointer;
            color: #fff !important;
            font-size: 13px;
            background: linear-gradient(to bottom,#f4364f,#dc2039);
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--DASHBOARD-->
    <section>
        <div class="tr-register">
            <div class="tr-regi-form v2-search-form">
                <h4>Booking by <span>Email</span></h4>
                <p>It's free and always will be.</p>
                <div id="bookingForm" class="contact__form" method="post" action="">

                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="txtname" runat="server" type="text" class="validate" name="txtname" required></asp:TextBox>
                            <label>Enter your name</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <asp:TextBox ID="txtphone" runat="server" type="number" class="validate" name="txtphone" required></asp:TextBox>
                            <label>Enter your phone</label>
                        </div>
                        <div class="input-field col s6">
                            <asp:TextBox ID="txtemail" runat="server" type="email" class="validate" name="txtemail" required></asp:TextBox>
                            <label>Enter your email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <cc1:AutoCompleteExtender ID="AutoCompleteExtProduct" runat="server" ServicePath="~/sellproduct.asmx"
                                ServiceMethod="FromSearch" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="selectsearch">
                            </cc1:AutoCompleteExtender>
                            <asp:TextBox ID="selectsearch" CssClass="autosuggest" class="autosuggest" name="selectsearch" runat="server" required placeholder="Select City or Place"></asp:TextBox>
                        </div>
                        <div class="input-field col s12">
                            <asp:DropDownList ID="ddl_packages" runat="server">
                                <asp:ListItem Value="" disabled Selected>Select your package *</asp:ListItem>
                                <asp:ListItem Value="Honeymoon Package">Honeymoon Package</asp:ListItem>
                                <asp:ListItem Value="Family Package">Family Package</asp:ListItem>
                                <asp:ListItem Value="Holiday Package">Holiday Package</asp:ListItem>
                                <asp:ListItem Value="Group Package">Group Package</asp:ListItem>
                                <asp:ListItem Value="Regular Package">Regular Package</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <link href="css/CSS.css" rel="stylesheet" type="text/css" />
                            <script src="js/Extension.min.js" type="text/javascript"></script>

                            <asp:TextBox ID="txtArrivalDate" runat="server" CssClass="disable_past_dates" Style="width: 80%; float:left;" required />
                            <asp:ImageButton runat="server" ID="imgPopup" CssClass="imgPopup" ImageUrl="images/Calendar.png" style="float:right;padding:0px;" />

                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtArrivalDate"
                                PopupButtonID="imgPopup" />
                            <label for="txtDate">Arrival Date</label>

                        </div>
                        <div class="input-field col s6">
                            <link href="css/CSS.css" rel="stylesheet" type="text/css" />
                            <script src="js/Extension.min.js" type="text/javascript"></script>

                            <asp:TextBox ID="txtDepartureDate" runat="server" CssClass="disable_past_dates" Style="width: 80%;float:left;" required />
                            <asp:ImageButton runat="server" ID="imgPopup2" CssClass="imgPopup" ImageUrl="images/Calendar.png" style="float:right;padding:0px;" />

                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDepartureDate" PopupButtonID="imgPopup2" />
                            <label for="txtDepartureDate">Departure Date</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <asp:DropDownList ID="ddl_adults" runat="server" required>
                                <asp:ListItem Value="" disabled Selected>No of adults *</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                                <asp:ListItem Value="6">6</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="input-field col s6">
                            <asp:DropDownList ID="ddl_childrens" runat="server" required>
                                <asp:ListItem Value="" disabled Selected>No of childrens *</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                                <asp:ListItem Value="6">6</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s6">
                            <asp:DropDownList ID="ddl_minprice" runat="server" required>
                                <asp:ListItem Value="" disabled Selected>Min Price *</asp:ListItem>
                                <asp:ListItem Value="Rs 7,500">Rs 7,500</asp:ListItem>
                                <asp:ListItem Value="Rs 15,000">Rs 15,000</asp:ListItem>
                                <asp:ListItem Value="Rs 24,000">Rs 24,000</asp:ListItem>
                                <asp:ListItem Value="Rs 38,000">Rs 38,000</asp:ListItem>
                                <asp:ListItem Value="Rs 60,500">Rs 60,500</asp:ListItem>
                                <asp:ListItem Value="Rs 90,000">Rs 90,000</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="input-field col s6">
                            <asp:DropDownList ID="ddl_maxprice" runat="server" required>
                                <asp:ListItem Value="" disabled Selected>Max Price *</asp:ListItem>
                                <asp:ListItem Value="Rs 17,500">Rs 17,500</asp:ListItem>
                                <asp:ListItem Value="Rs 115,000">Rs 115,000</asp:ListItem>
                                <asp:ListItem Value="Rs 124,000">Rs 124,000</asp:ListItem>
                                <asp:ListItem Value="Rs 138,000">Rs 138,000</asp:ListItem>
                                <asp:ListItem Value="Rs 160,500">Rs 160,500</asp:ListItem>
                                <asp:ListItem Value="Rs 190,000">Rs 190,000</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:Button ID="BtnBooking" OnClick="BtnBooking_Click" runat="server" Text="Book Now" class="w-auto border-solid background-black" />
                        </div>
                    </div>
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

