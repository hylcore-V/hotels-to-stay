<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="hotels-list.aspx.cs" Inherits="hotels_list" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!--====== HOTELS LIST ==========-->
    <section class="hot-page2-alp hot-page2-pa-sp-top all-hot-bg">
        <div class="container">
            <div class="row inner_banner inner_banner_3 bg-none">
                <div class="hot-page2-alp-tit">
                    <h1>Hotel & Restaurants in Vancouver </h1>
                    <ul>
                        <li><a href="#inner-page-title">Home</a> </li>
                        <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                        <li><a href="#inner-page-title" class="bread-acti">Hotels & Restaurants</a> </li>
                    </ul>
                    <p>World's leading Hotel Booking website,Over 30,000 Hotel rooms worldwide. </p>
                </div>
            </div>
            <div class="row">
                <div class="hot-page2-alp-con">
                    <!--LEFT LISTINGS-->
                    <div class="col-md-3 hot-page2-alp-con-left">
                        <!--PART 1 : LEFT LISTINGS-->
                        <div class="hot-page2-alp-con-left-1">
                            <h3>Suggesting Hotels</h3>
                        </div>
                        <!--PART 2 : LEFT LISTINGS-->
                        <div class="hot-page2-hom-pre hot-page2-alp-left-ner-notb">
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
                                <!--LISTINGS-->
                            </ul>
                        </div>
                        <!--left search box by packages-->
                        <div class="hot-page2-alp-l3 hot-page2-alp-l-com">
                            <h4><i class="fa fa-calendar-check-o" aria-hidden="true"></i>ROOM AVAILABLE CHECK</h4>
                            <div class="hot-page2-alp-l-com1 hot-room-ava-check">
                                <div class="v2-search-form package-form">
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <cc1:AutoCompleteExtender ID="AutoCompleteExtProduct" runat="server" ServicePath="~/searchhotel.asmx"
                                                ServiceMethod="FromSearch" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                                CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                                FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="selectsearch">
                                            </cc1:AutoCompleteExtender>
                                            <asp:TextBox ID="selectsearch" CssClass="autosuggest" class="autosuggest" runat="server" Height="47px" placeholder="Select City or Place"></asp:TextBox>
                                            <label for="select-city-1"></label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <asp:Button type="submit" ID="Btn_package_search" runat="server" value="search" Text="search" class="waves-effect waves-light tourz-sear-btn v2-ser-btn" OnClick="Btn_package_search_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--END LEFT LISTINGS-->

                    <!--RIGHT LISTINGS-->
                    <div class="col-md-9 hot-page2-alp-con-right">
                        <asp:ListView ID="lv_hotels" runat="server">
                            <ItemTemplate>
                                <div class="col-md-12 col-lg-12 col-12 hot-page2-alp-con-right-1" style="padding:0px;">
                                    <div class="row">
                                        <div class="hot-page2-alp-r-list">
                                            <div class="col-md-3 hot-page2-alp-r-list-re-sp">
                                                <a href="hotel-details.aspx?hotel=<%#Eval("hotel") %>">
                                                    <div class="hotel-list-score">4.4</div>
                                                    <div class="hot-page2-hli-1">
                                                        <img src="images/Hotel_Images/<%#Eval("hotelimage") %>" alt="<%#Eval("hotel") %>">
                                                    </div>
                                                    <div class="hom-hot-av-tic hom-hot-av-tic-list">Available Rooms: 47 </div>
                                                </a>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="hot-page2-alp-ri-p2">
                                                    <a href="hotel-details.aspx">
                                                        <h3><%#Eval("hotel") %></h3>
                                                    </a>
                                                    <ul>
                                                        <li><%#Eval("city") %>-<%#Eval("district_code") %>, <%#Eval("state") %>, <%#Eval("country") %></li>
                                                        <li>+91 8999 292525, +91 8999 292525</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="hot-page2-alp-ri-p3">
                                                    <div class="hot-page2-alp-r-hot-page-rat">25% Off</div>
                                                    <span class="hot-list-p3-1">Price Per Night</span> <span class="hot-list-p3-2"><%#Eval("price_per_night") %></span><span class="hot-list-p3-4">
                                                        <a href="hotel-details.aspx?hotel=<%#Eval("hotel") %>&city=<%#Eval("city") %>" class="hot-page2-alp-quot-btn">Book Now</a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    <!--END RIGHT LISTINGS-->

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

