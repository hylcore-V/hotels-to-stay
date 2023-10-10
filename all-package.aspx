<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="all-package.aspx.cs" Inherits="all_package" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--====== HOTELS LIST ==========-->
    <section class="hot-page2-alp hot-page2-pa-sp-top">
        <div class="container">
            <div class="row inner_banner inner_banner_3 bg-none">
                <div class="hot-page2-alp-tit">
                    <h1>Top Travel Packages</h1>
                    <ul>
                        <li><a href="#inner-page-title">Home</a> </li>
                        <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                        <li><a href="#inner-page-title" class="bread-acti">All Packages</a> </li>
                    </ul>
                    <p>World's leading Hotel Booking website,Over 30,000 Hotel rooms worldwide. </p>
                </div>
            </div>
            <div class="row">
                <div class="hot-page2-alp-con">
                    <!--LEFT LISTINGS-->
                    <div class="col-md-3 hot-page2-alp-con-left">
                        <!--PART 1 : LEFT LISTINGS Suggesting Packages-->
                        <div class="hot-page2-alp-con-left-1">
                            <h3>Suggesting Packages</h3>
                        </div>
                        <!--PART 2 : LEFT LISTINGS-->
                        <div class="hot-page2-hom-pre hot-page2-alp-left-ner-notb">
                            <ul>
                                <!--LISTINGS-->
                                <asp:ListView ID="lv_SuggestingPackages" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <a href="booking-tour-package.aspx">
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
                                <!--LISTINGS-->
                            </ul>
                        </div>
                        <!--left search box by packages-->
                        <div class="hot-page2-alp-l3 hot-page2-alp-l-com">
                            <h4><i class="fa fa-calendar-check-o" aria-hidden="true"></i>Travel Available Check</h4>
                            <div class="hot-page2-alp-l-com1 hot-room-ava-check">
                                <div class="v2-search-form package-form">
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <cc1:AutoCompleteExtender ID="AutoCompleteExtProduct" runat="server" ServicePath="~/sellproduct.asmx"
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
                        <!--PART 5 : LEFT LISTINGS-->
                        <div class="hot-page2-alp-l3 hot-page2-alp-l-com">
                            <h4><i class="fa fa-dollar" aria-hidden="true"></i>Select Price Range</h4>
                            <div class="hot-page2-alp-l-com1 hot-page2-alp-p5">
                                <asp:DropDownList ID="ddl_priceChk" runat="server" required AutoPostBack="true" OnSelectedIndexChanged="ddl_priceChk_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Selected disabled>Select Price Range</asp:ListItem>
                                    <asp:ListItem Value="1" Text="Below - Rs 50,000"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Rs 50,000 - Rs 1,00,000"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Rs 1,00,000 - Rs 2,50,000"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="Rs 2,50,000 - Rs 5,00,000"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="Rs 5,00,000 - Above"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <!--END PART 5 : LEFT LISTINGS-->
                        <!--PART 6 : LEFT LISTINGS-->
                        <div id="select_by_ratings" class="hot-page2-alp-l3 hot-page2-alp-l-com">
                            <h4><i class="fa fa-star-o" aria-hidden="true"></i>Select Ratings</h4>
                            <div class="hot-page2-alp-l-com1 hot-page2-alp-p5">
                                <asp:DropDownList ID="ddl_ratingChk" runat="server" required AutoPostBack="true" OnSelectedIndexChanged="ddl_ratingChk_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Selected disabled>Select By Ratings</asp:ListItem>
                                    <asp:ListItem Value="1" Text="5.0"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="4.5"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="4.0"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="3.5"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="3.0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <!--END PART 5 : LEFT LISTINGS-->
                    </div>
                    <!--END LEFT LISTINGS-->

                    <!--RIGHT LISTINGS-->
                    <div class="col-md-9 col-lg-9 col-12">
                        <asp:ListView ID="lv_packages" runat="server">
                            <ItemTemplate>
                                <div class="col-md-12 hot-page2-alp-con-right">
                                    <div class="hot-page2-alp-con-right-1">
                                        <div class="row">
                                            <div class="hot-page2-alp-r-list">
                                                <div class="col-md-3 hot-page2-alp-r-list-re-sp">
                                                    <a href="booking-tour-package.aspx">
                                                        <div class="hotel-list-score"><%#Eval("package_rating") %></div>
                                                        <div class="hot-page2-hli-1">
                                                            <img src="images/package_image/<%#Eval("package_image") %>" alt="<%#Eval("package_image") %>">
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="trav-list-bod">
                                                        <a href="booking-tour-package.aspx">
                                                            <h3><%#Eval("package_name") %></h3>
                                                        </a>
                                                        <p><%#Eval("package_desc") %></p>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="hot-page2-alp-ri-p3 tour-alp-ri-p3">
                                                        <div class="hot-page2-alp-r-hot-page-rat">25%Off</div>
                                                        <span class="hot-list-p3-1">Prices Starting</span> <span class="hot-list-p3-2">Rs <%#Eval("package_price") %></span><span class="hot-list-p3-4">
                                                            <a href="booking-tour-package.aspx" class="hot-page2-alp-quot-btn">Book Now</a>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="trav-ami">
                                                        <h4>Detail and Includes</h4>
                                                        <ul>
                                                            <li>
                                                                <img src="images/icon/a14.png" alt="">
                                                                <span>Sightseeing</span></li>
                                                            <li>
                                                                <img src="images/icon/a15.png" alt="">
                                                                <span>Hotel</span></li>
                                                            <li>
                                                                <img src="images/icon/a16.png" alt="">
                                                                <span>Transfer</span></li>
                                                            <li>
                                                                <img src="images/icon/a17.png" alt="">
                                                                <span>Luggage</span></li>
                                                            <li>
                                                                <img src="images/icon/a18.png" alt="">
                                                                <span>Duration 8N/9D</span></li>
                                                            <li>
                                                                <img src="images/icon/a19.png" alt="">
                                                                <span>Location : <%#Eval("package_place") %></span></li>
                                                            <li>
                                                                <img src="images/icon/dbl4.png" alt="">
                                                                <span>Stay Plan</span></li>
                                                        </ul>
                                                    </div>
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

