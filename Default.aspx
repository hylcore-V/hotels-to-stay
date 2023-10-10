<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .search-top {
            display: none;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HiddenField1" runat="server" />


    <!--Banner Search Section -->
    <section>
        <div class="tourz-search">
            <div class="container">
                <div class="row">
                    <div class="tourz-search-1">
                        <h1>Plan Your Travel Now!</h1>
                        <p>Experience the various exciting tour and travel packages and Make hotel reservations, find vacation packages, search cheap hotels and events</p>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="BtnSearch">
                            <div class="tourz-search-form">

                                <div class="input-field1">
                                    <asp:DropDownList ID="search_category" runat="server" BorderStyle="None" Height="47px" AutoPostBack="true" OnSelectedIndexChanged="search_category_SelectedIndexChanged">
                                        <asp:ListItem Value="-1" Selected disabled>Select category</asp:ListItem>
                                        <asp:ListItem Value="Hotels">Hotels</asp:ListItem>
                                        <asp:ListItem Value="Place">Place</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="input-field input-field2" runat="server" id="AutoCity">
                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtProduct" runat="server" ServicePath="~/sellproduct.asmx"
                                        ServiceMethod="FromSearch" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="selectsearch">
                                    </cc1:AutoCompleteExtender>
                                    <asp:TextBox ID="selectsearch" CssClass="autosuggest" class="autosuggest" runat="server" BorderStyle="None" Height="47px" placeholder="Search places or cities"></asp:TextBox>
                                    <asp:Label ID="lblemptysearch" runat="server" Text="" ForeColor="White" Visible="false"></asp:Label>
                                </div>

                                <div class="input-field input-field2" runat="server" id="AutoHotel" visible="false">
                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" ServicePath="~/searchhotelevent.asmx"
                                        ServiceMethod="FromSearch" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="selectsearchhotel">
                                    </cc1:AutoCompleteExtender>
                                    <asp:TextBox ID="selectsearchhotel" CssClass="autosuggest" class="autosuggest" onkeypress="handleEnter(event)" runat="server" BorderStyle="None" Height="47px" placeholder="Search hotels"></asp:TextBox>
                                    <asp:Label ID="lblemptysearchhotel" runat="server" Text="" ForeColor="White" Visible="false"></asp:Label>
                                </div>

                                <div class="input-field input-field3">
                                    <asp:Button ID="BtnSearch" runat="server" Text="search" class="waves-effect waves-light tourz-sear-btn" OnClick="BtnSearch_Click" />
                                </div>

                            </div>
                        </asp:Panel>
                    </div>
                    <div class="tourz-hom-ser">
                        <ul>
                            <li>
                                <a href="booking-tour-package.aspx" class="waves-effect waves-light btn-large tourz-pop-ser-btn wow fadeInUp" data-wow-duration="0.5s">
                                    <img src="images/icon/2.png" alt="">
                                    Tour</a>
                            </li>
                            <li>
                                <a href="booking-flight.aspx" class="waves-effect waves-light btn-large tourz-pop-ser-btn wow fadeInUp" data-wow-duration="1s">
                                    <img src="images/icon/31.png" alt="">
                                    Flight</a>
                            </li>
                            <li>
                                <a href="booking-car-rentals.aspx" class="waves-effect waves-light btn-large tourz-pop-ser-btn wow fadeInUp" data-wow-duration="1.5s">
                                    <img src="images/icon/30.png" alt="">
                                    Car Rentals</a>
                            </li>
                            <li>
                                <a href="booking-hotel.aspx" class="waves-effect waves-light btn-large tourz-pop-ser-btn wow fadeInUp" data-wow-duration="2s">
                                    <img src="images/icon/1.png" alt="">
                                    Hotel</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section>
        <div class="rows pad-bot-redu tb-space">
            <div class="container">
                <!-- TITLE & DESCRIPTION -->
                <div class="spe-title">
                    <h2>Popular <span>Cities</span> </h2>
                    <p>World's leading tour and travels Booking website,Over 30,000 packages worldwide.</p>
                </div>
                <asp:ListView ID="lv_place" runat="server">
                    <ItemTemplate>
                        <!-- TOUR PLACE 1 -->
                        <div class="col-md-4 col-sm-6 col-xs-12 b_packages wow slideInUp" data-wow-duration="0.5s">
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                            <!-- OFFER BRAND -->
                            <div class="band">
                                <img src="images/offer_images/<%# Eval("offer_image") %>" alt="" />
                            </div>
                            <!-- IMAGE -->
                            <div class="v_place_img">
                                <a href="tour-details.aspx?place=<%# Eval("place") %>">
                                    <img src="images/Place_Images/<%# Eval("placeimage") %>" alt="Tour Booking" title="Tour Booking" />
                                </a>
                            </div>
                            <!-- TOUR TITLE & ICONS -->
                            <div class="b_pack rows">
                                <!-- TOUR TITLE -->
                                <div class="col-md-8 col-sm-8">
                                    <h4><a href="tour-details.aspx?place=<%# Eval("place") %>"><%# Eval("place") %><span class="v_pl_name">(<%# Eval("country") %>)</span></a></h4>
                                </div>
                                <!-- TOUR ICONS -->
                                <div class="col-md-4 col-sm-4 pack_icon">
                                    <ul>
                                        <li>
                                            <a href="tour-details.aspx?place=<%# Eval("place") %>">
                                                <img src="images/clock.png" alt="Date" title="Tour Timing" />
                                            </a>
                                        </li>
                                        <li>
                                            <a href="tour-details.aspx?place=<%# Eval("place") %>">
                                                <img src="images/info.png" alt="Details" title="View more details" />
                                            </a>
                                        </li>
                                        <li>
                                            <a href="tour-details.aspx?place=<%# Eval("place") %>">
                                                <img src="images/price.png" alt="Price" title="Price" />
                                            </a>
                                        </li>
                                        <li>
                                            <a href="tour-details.aspx?place=<%# Eval("place") %>">
                                                <img src="images/map.png" alt="Location" title="Location" />
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>

    <!--Hotels Booking Open Now!-->
    <section>
        <div class="rows tb-space pad-top-o pad-bot-redu">
            <div class="container">
                <!-- TITLE & DESCRIPTION -->
                <div class="spe-title">
                    <h2>Hotels <span>booking open now! </span></h2>
                    <div class="title-line">
                        <div class="tl-1"></div>
                        <div class="tl-2"></div>
                        <div class="tl-3"></div>
                    </div>
                    <p>World's leading Hotel Booking website,Over 30,000 Hotel rooms worldwide. Book Hotel rooms and enjoy your holidays with distinctive experience</p>
                </div>
                <!-- HOTEL GRID -->
                <asp:ListView ID="lv_hotels" runat="server">
                    <ItemTemplate>
                        <asp:Label ID="lblid" runat="server" Text='=<%#Eval("Id") %>' Visible="false"></asp:Label>
                        <div class="to-ho-hotel">
                            <!-- HOTEL GRID -->
                            <div class="col-md-4">
                                <div class="to-ho-hotel-con">
                                    <a href="hotel-details.aspx?hotel=<%#Eval("hotel") %>">
                                        <div class="to-ho-hotel-con-1">
                                            <div class="hot-page2-hli-3">
                                                <img src="images/Hotel_Images/<%#Eval("hotelimage") %>" alt="<%#Eval("hotel") %>">
                                            </div>
                                            <div class="hom-hot-av-tic">Available Tickets: 42 </div>
                                            <img src="images/Hotel_Images/<%#Eval("hotelimage") %>" alt="<%#Eval("hotel") %>">
                                        </div>
                                        <div class="to-ho-hotel-con-23">
                                            <div class="to-ho-hotel-con-2">
                                                <a href="hotel-details.aspx?hotel=<%#Eval("hotel") %>">
                                                    <h4><%#Eval("hotel") %></h4>
                                                </a>
                                            </div>
                                            <div class="to-ho-hotel-con-3">
                                                <ul>
                                                    <li>City: <%#Eval("city") %>,<%#Eval("state") %>
                                                        <div class="dir-rat-star ho-hot-rat-star">
                                                            Rating: <i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star-o"
                                                                aria-hidden="true"></i>
                                                        </div>
                                                    </li>

                                                            <li><span class="ho-hot-pri-dis"><%#Eval("price_per_night") %></span><span class="ho-hot-pri"><%#Eval("price_per_night") %></span> </li>

                                                </ul>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>

    <!--Packages-->
    <section>
        <div class="rows pla pad-bot-redu tb-space expd">
            <div class="pla1 p-home container">
                <!-- TITLE & DESCRIPTION -->
                <div class="spe-title spe-title-1">
                    <h2>Top <span>Sight Seeing</span> in this month</h2>
                    <div class="title-line">
                        <div class="tl-1"></div>
                        <div class="tl-2"></div>
                        <div class="tl-3"></div>
                    </div>
                    <p>World's leading tour and travels Booking website,Over 30,000 packages worldwide. Book travel packages and enjoy your holidays with distinctive experience</p>
                </div>

                <asp:ListView ID="lv_honey" runat="server">
                    <ItemTemplate>
                        <asp:Label ID="lblid" runat="server" Text='=<%#Eval("Id") %>' Visible="false"></asp:Label>

                        <!-- Honeymoon Package -->
                        <div class="col-md-6 col-sm-6 col-xs-12 place honeypckg">
                            <div class="col-md-6 col-sm-12 col-12" style="padding: 15px 5px;">
                                <img src="images/Place_Images/<%# Eval("placeimage") %>" alt="" />
                            </div>
                            <div class="col-md-6 col-sm-12 col-12" style="padding: 5px 7px 10px;">
                                <h3 style="margin: 1px 0px 3px;"><%# Eval("package_place_name") %> : Rs <%# Eval("package_price") %></h3>
                                <h4 style="margin: 1px 0px 3px;"><%# Eval("packageDuration") %></h4>

                                <h4><%# Eval("Package_category_name") %> : </h4>
                                <ul>
                                    <li>Available Tickets : <%# Eval("packageAvailableTickets") %></li>
                                    <li>Start Date : <%# Eval("packageStartDate") %></li>
                                    <li>End Date : <%# Eval("packageEndDate") %></li>
                                </ul>
                                <a href="tour-details.aspx?place_name=<%# Eval("package_place_name") %>&package_category_id=<%# Eval("package_category_id") %>" class="link-btn">more info</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

            </div>
        </div>
    </section>

    <!--STANDARDIZED BUDGET ROOM-->
    <section>
        <div class="offer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="offer-l">
                            <span class="ol-1"></span><span class="ol-2"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span><span class="ol-4">Standardized Budget Rooms</span>                            <span class="ol-3"></span><span class="ol-5">$99/-</span>
                            <ul style="padding:0px;">
                                <li class="wow fadeInUp" data-wow-duration="0.5s">
                                    <a href="hotels-list.aspx" class="waves-effect waves-light btn-large offer-btn">
                                        <img src="images/icon/dis1.png" alt="">
                                    </a><span>Free WiFi</span>
                                </li>
                                <li class="wow fadeInUp" data-wow-duration="0.7s">
                                    <a href="hotels-list.aspx" class="waves-effect waves-light btn-large offer-btn">
                                        <img src="images/icon/dis2.png" alt="">
                                    </a><span>Breakfast</span>
                                </li>
                                <li class="wow fadeInUp" data-wow-duration="0.9s">
                                    <a href="hotels-list.aspx" class="waves-effect waves-light btn-large offer-btn">
                                        <img src="images/icon/dis3.png" alt="">
                                    </a><span>Pool</span>
                                </li>
                                <li class="wow fadeInUp" data-wow-duration="1.1s">
                                    <a href="hotels-list.aspx" class="waves-effect waves-light btn-large offer-btn">
                                        <img src="images/icon/dis4.png" alt="">
                                    </a><span>Television</span>
                                </li>
                                <li class="wow fadeInUp" data-wow-duration="1.3s">
                                    <a href="hotels-list.aspx" class="waves-effect waves-light btn-large offer-btn">
                                        <img src="images/icon/dis5.png" alt="">
                                    </a><span>GYM</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="offer-r">
                            <div class="or-1"><span class="or-11">go</span> <span class="or-12">Stays</span> </div>
                            <div class="or-2"><span class="or-21">Get</span> <span class="or-22">70%</span> <span class="or-23">Off</span> <span class="or-24">use code: RG5481WERQ</span> <span class="or-25"></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--Top Events In This Month-->
    <section>
        <div class="rows tb-space">
            <div class="container events events-1" id="inner-page-title">
                <!-- TITLE & DESCRIPTION -->
                <div class="spe-title">
                    <h2>Top <span>Events</span> in this month</h2>
                    <div class="title-line">
                        <div class="tl-1"></div>
                        <div class="tl-2"></div>
                        <div class="tl-3"></div>
                    </div>
                    <p>World's leading tour and travels Booking website,Over 30,000 packages worldwide. Book travel packages and enjoy your holidays with distinctive experience</p>
                </div>

                <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServicePath="~/searchhotelevent.asmx"
                    ServiceMethod="FromSearch" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                    CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                    FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="searchhotelevent">
                </cc1:AutoCompleteExtender>
                <asp:TextBox ID="searchhotelevent" CssClass="autosuggest" class="autosuggest" runat="server" Height="47px" placeholder="Search Event Name.."></asp:TextBox>

                <table id="myTable">
                    <tbody>
                        <tr>
                            <th>#</th>
                            <th>Event Name</th>
                            <th class="e_h1">Date</th>
                            <th class="e_h1">Time</th>
                            <th class="e_h1">Location</th>
                            <th>Book</th>
                        </tr>
                        <asp:ListView ID="lv_events" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("id") %></td>
                                    <td>
                                        <img src="images/Hotel_Images/<%#Eval("hotelimage") %>" alt="" /><a href="#" class="events-title"><%#Eval("eventHotelName") %></a> </td>
                                    <td class="e_h1"><%#Eval("eventDate") %></td>
                                    <td class="e_h1"><%#Eval("eventTime") %></td>
                                    <td class="e_h1"><%#Eval("eventLocation") %></td>
                                    <td><a href="booking.aspx" class="link-btn">Book Now</a> </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!--Top Branding For This Month-->
    <section>
        <div class="ho-popu tb-space pad-bot-redu">
            <div class="rows container">
                <!-- TITLE & DESCRIPTION -->
                <div class="spe-title">
                    <h2>Top <span>Branding</span> for this month</h2>
                    <div class="title-line">
                        <div class="tl-1"></div>
                        <div class="tl-2"></div>
                        <div class="tl-3"></div>
                    </div>
                    <p>World's leading tour and travels Booking website,Over 30,000 packages worldwide. Book travel packages and enjoy your holidays with distinctive experience</p>
                </div>
                <div class="ho-popu-bod">
                    <div class="col-md-4">
                        <div class="hot-page2-hom-pre-head">
                            <h4>Top Branding <span>Hotels</span></h4>
                        </div>
                        <div class="hot-page2-hom-pre">
                            <ul>
                                <!--LISTINGS-->
                                <asp:ListView ID="lv_SuggestingPackages" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <a href="hotel-details.aspx?hotel=<%#Eval("hotel") %>">
                                                <div class="hot-page2-hom-pre-1 hot-page2-alp-cl-1-1">
                                                    <img src="images/Hotel_Images/<%#Eval("hotelimage") %>" alt="<%#Eval("hotel") %>">
                                                </div>
                                                <div class="hot-page2-hom-pre-2 hot-page2-alp-cl-1-2">
                                                    <h5><%#Eval("hotel") %></h5>
                                                    <span>City:<%#Eval("city") %>,<%#Eval("state") %>,<%#Eval("country") %></span>
                                                </div>
                                                <div class="hot-page2-hom-pre-3 hot-page2-alp-cl-1-3"><span>4.4</span> </div>
                                            </a>
                                        </li>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="hot-page2-hom-pre-head">
                            <h4>Top Branding <span>Packages</span></h4>
                        </div>
                        <div class="hot-page2-hom-pre">
                            <ul>
                                <!--LISTINGS-->
                                <asp:ListView ID="lv_SuggestingPackages2" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <a href="tour-details.aspx?package_place=<%#Eval("package_place") %>">
                                                <div class="hot-page2-hom-pre-1 hot-page2-alp-cl-1-1">
                                                    <img src="images/package_image/<%#Eval("package_image") %>" alt="<%#Eval("package_image") %>">
                                                </div>
                                                <div class="hot-page2-hom-pre-2 hot-page2-alp-cl-1-2">
                                                    <h5><%#Eval("package_name") %></h5>
                                                    <span><%#Eval("package_desc") %>...</span>
                                                </div>
                                                <div class="hot-page2-hom-pre-3 hot-page2-alp-cl-1-3"><span>4.2</span> </div>
                                            </a>
                                        </li>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="hot-page2-hom-pre-head">
                            <h4>Top Branding <span>Reviewers</span></h4>
                        </div>
                        <div class="hot-page2-hom-pre">
                            <ul>
                                <!--LISTINGS-->
                                <li>
                                    <a href="hotels-list.aspx">
                                        <div class="hot-page2-hom-pre-1">
                                            <img src="images/reviewer/1.jpg" alt="">
                                        </div>
                                        <div class="hot-page2-hom-pre-2">
                                            <h5>Christopher</h5>
                                            <span>No of Reviews: 620, City: illunois</span>
                                        </div>
                                        <div class="hot-page2-hom-pre-3"><i class="fa fa-hand-o-right" aria-hidden="true"></i></div>
                                    </a>
                                </li>
                                <!--LISTINGS-->
                                <li>
                                    <a href="hotels-list.aspx">
                                        <div class="hot-page2-hom-pre-1">
                                            <img src="images/reviewer/2.png" alt="">
                                        </div>
                                        <div class="hot-page2-hom-pre-2">
                                            <h5>Matthew</h5>
                                            <span>No of Reviews: 48, City: Rio</span>
                                        </div>
                                        <div class="hot-page2-hom-pre-3"><i class="fa fa-hand-o-right" aria-hidden="true"></i></div>
                                    </a>
                                </li>
                                <!--LISTINGS-->
                                <li>
                                    <a href="hotels-list.aspx">
                                        <div class="hot-page2-hom-pre-1">
                                            <img src="images/reviewer/3.jpg" alt="">
                                        </div>
                                        <div class="hot-page2-hom-pre-2">
                                            <h5>Stephanie</h5>
                                            <span>No of Reviews: 560, City: Chennai</span>
                                        </div>
                                        <div class="hot-page2-hom-pre-3"><i class="fa fa-hand-o-right" aria-hidden="true"></i></div>
                                    </a>
                                </li>
                                <!--LISTINGS-->
                                <li>
                                    <a href="hotels-list.aspx">
                                        <div class="hot-page2-hom-pre-1">
                                            <img src="images/reviewer/4.jpg" alt="">
                                        </div>
                                        <div class="hot-page2-hom-pre-2">
                                            <h5>Robert</h5>
                                            <span>No of Reviews: 920, City: Beijing</span>
                                        </div>
                                        <div class="hot-page2-hom-pre-3"><i class="fa fa-hand-o-right" aria-hidden="true"></i></div>
                                    </a>
                                </li>
                                <!--LISTINGS-->
                                <li>
                                    <a href="hotels-list.aspx">
                                        <div class="hot-page2-hom-pre-1">
                                            <img src="images/reviewer/5.jpg" alt="">
                                        </div>
                                        <div class="hot-page2-hom-pre-2">
                                            <h5>Danielle</h5>
                                            <span>No of Reviews: 768, City: Berlin</span>
                                        </div>
                                        <div class="hot-page2-hom-pre-3"><i class="fa fa-hand-o-right" aria-hidden="true"></i></div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--mobile app?-->
    <section>
        <div class="foot-mob-sec tb-space">
            <div class="rows container">
                <!-- FAMILY IMAGE(YOU CAN USE ANY PNG IMAGE) -->
                <div class="col-md-6 col-sm-6 col-xs-12 family">
                    <img src="images/mobile.png" alt="" />
                </div>
                <!-- REQUEST A QUOTE -->
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <!-- THANK YOU MESSAGE -->
                    <div class="foot-mob-app">
                        <h2>Have you tried our mobile app?</h2>
                        <p>World's leading tour and travels Booking website,Over 30,000 packages worldwide. Book travel packages and enjoy your holidays with distinctive experience</p>
                        <ul>
                            <li><i class="fa fa-check" aria-hidden="true"></i>Easy Hotel Booking</li>
                            <li><i class="fa fa-check" aria-hidden="true"></i>Tour and Travel Packages</li>
                            <li><i class="fa fa-check" aria-hidden="true"></i>Package Reviews and Ratings</li>
                            <li><i class="fa fa-check" aria-hidden="true"></i>Manage your Bookings, Enquiry and Reviews</li>
                        </ul>
                        <a href="#">
                            <img src="images/android.png" alt="">
                        </a>
                        <a href="#">
                            <img src="images/apple.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
