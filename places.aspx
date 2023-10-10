<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="places.aspx.cs" Inherits="places" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!--====== BANNER ==========-->
    <section>
        <div class="rows inner_banner inner_banner_1">
            <div class="container">
                <h2><span>Now Book -</span> Your Top Sight Seeing Places</h2>
                <ul>
                    <li><a href="#inner-page-title">Home</a>
                    </li>
                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                    <li><a href="#inner-page-title" class="bread-acti">Sight Seeing</a>
                    </li>
                </ul>
                <p>Book travel packages and enjoy your holidays with distinctive experience</p>
            </div>
        </div>
    </section>
    <!--====== PLACES ==========-->
    <section>
        <div class="rows inn-page-bg com-colo">
            <div class="container inn-page-con-bg tb-space pad-bot-redu" id="inner-page-title">
                <!-- TITLE & DESCRIPTION -->
                <div class="spe-title col-md-12">
                    <h2>Top <span>Sight Seeings</span></h2>
                    <div class="title-line">
                        <div class="tl-1"></div>
                        <div class="tl-2"></div>
                        <div class="tl-3"></div>
                    </div>
                    <p>World's leading tour and travels Booking website,Over 30,000 packages worldwide. Book travel packages and enjoy your holidays with distinctive experience</p>
                </div>

                <asp:ListView ID="lv_place" runat="server">
                    <ItemTemplate>
                        <div>
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

