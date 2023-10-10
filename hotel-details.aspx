<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="hotel-details.aspx.cs" Inherits="hotel_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--====== BANNER ==========-->
    <asp:ListView ID="lv_main" runat="server">
        <ItemTemplate>
            <section>
                <div class="rows inner_banner inner_banner_2" style="background: url(images/Hotel_images/<%# Eval("hotel_bannerimage") %>) no-repeat center center;">
                    <div class="container">
                        <h2><span><%# Eval("hotel") %></span></h2>
                        <ul>
                            <li><a href="#inner-page-title">Home</a>
                            </li>
                            <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                            <li><a href="#inner-page-title" class="bread-acti">Hotel Booking</a>
                            </li>
                        </ul>
                        <p>Location: <%# Eval("city") %>, <%# Eval("state") %>, <%# Eval("country") %>.</p>
                    </div>
                </div>
            </section>

            <!--====== TOUR DETAILS - BOOKING ==========-->
            <section>
                <div class="rows banner_book" id="inner-page-title">
                    <div class="container">
                        <div class="banner_book_1">
                            <ul>
                                <li class="dl1">Location : <%# Eval("city") %></li>
                                <asp:ListView ID="lv_price_per_night" runat="server">
                                    <ItemTemplate>
                                        <li class="dl2">Price : <%# Eval("price_per_night") %></li>
                                    </ItemTemplate>
                                </asp:ListView>
                                <li class="dl3">Duration : One Night</li>
                                <li class="dl4"><a href="booking.aspx">Book Now</a> </li>
                            </ul>

                            <ul class="nav nav-tabs" id="TourDetails_tabs" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="hotel_tab" data-bs-toggle="tab" data-bs-target="#nearby_hotel_tab" type="button" role="tab" aria-controls="nearby_hotel_tab" aria-selected="false">Nearby Hotels</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="airport_tab" data-bs-toggle="tab" data-bs-target="#nearby_airport_tab" type="button" role="tab" aria-controls="nearby_airport_tab" aria-selected="false">Nearby Airports</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="railway_tab" data-bs-toggle="tab" data-bs-target="#nearby_railway_tab" type="button" role="tab" aria-controls="nearby_railway_tab" aria-selected="false">Nearby Railways</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="mall_tab" data-bs-toggle="tab" data-bs-target="#nearby_mals_tab" type="button" role="tab" aria-controls="nearby_mals_tab" aria-selected="false">Nearby Malls</button>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane my-1 color-white fs-bold" id="nearby_hotel_tab" role="tabpanel" aria-labelledby="hotel_tab"><%# Eval("nearby_malls") %></div>
                                <div class="tab-pane my-1 color-white fs-bold" id="nearby_airport_tab" role="tabpanel" aria-labelledby="airport_tab"><%# Eval("nearby_airport") %></div>
                                <div class="tab-pane my-1 color-white fs-bold" id="nearby_railway_tab" role="tabpanel" aria-labelledby="railway_tab"><%# Eval("nearby_railways") %></div>
                                <div class="tab-pane my-1 color-white fs-bold" id="nearby_mals_tab" role="tabpanel" aria-labelledby="mall_tab"><%# Eval("nearby_bus") %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </ItemTemplate>
    </asp:ListView>
    <!--====== TOUR DETAILS ==========-->

    <section>
        <div class="rows inn-page-bg com-colo">
            <div class="container inn-page-con-bg tb-space">
                <div class="col-md-9">
                    <asp:ListView ID="lv_sub" runat="server">
                        <ItemTemplate>
                            <!--====== TOUR TITLE ==========-->
                            <div class="tour_head">
                                <h2><%# Eval("hotel") %> <span class="tour_star"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star-half-o" aria-hidden="true"></i></span><span class="tour_rat">4.5</span></h2>
                            </div>
                            <!--====== TOUR DESCRIPTION ==========-->
                            <div class="tour_head1 hotel-com-color">
                                <h3>About GRAND HOTEL</h3>
                                <%# Eval("hotel_desc") %>
                            </div>
                            <!--====== ROOMS: HOTEL slider ==========-->
                            <div class="tour_head1 hotel-book-room">
                                <h3>Photo Gallery</h3>
                                <div id="carouselId" class="carousel slide" data-bs-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <asp:ListView ID="lv_slider_indicators" runat="server">
                                            <ItemTemplate>
                                                <li data-bs-target="#carouselId" data-bs-slide-to="<%#Eval("Id") %>" class="active" aria-current="true" aria-label="First slide"></li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </ol>
                                    <div class="carousel-inner" role="listbox">
                                        <asp:ListView ID="lv_slider" runat="server">
                                            <ItemTemplate>
                                                <div class="carousel-item <%# Eval("active").ToString() == "1" ? "active" : "" %>">
                                                    <img src="images/Hotel_Images/<%#Eval("placeimage") %>" class="w-100 d-block" alt="First slide">
                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>

                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev" style="background: transparent;">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next" style="background: transparent;">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>

                            <!--====== HOTEL ROOM TYPES ==========-->
                            <div class="tour_head1">
                                <h3>ROOMS & AVAILABILITIES</h3>
                                <div class="tr-room-type">
                                    <ul>
                                        <asp:ListView ID="lv_roomtypes" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <div class="tr-room-type-list">
                                                        <div class="col-md-3 tr-room-type-list-1">
                                                            <img src="images/Hotel_Images/<%# Eval("room_image") %>" alt="" />
                                                        </div>
                                                        <div class="col-md-6 tr-room-type-list-2">
                                                            <h4><%# Eval("room_type") %></h4>
                                                            <p><b>Amenities: </b><%# Eval("hotel_amenities") %> more.. </p>
                                                            <span><b>Includes</b> : <%# Eval("includes") %></span> <span><b>Maxinum </b>: <%# Eval("maxinum") %> Persons</span>
                                                        </div>
                                                        <div class="col-md-3 tr-room-type-list-3"><span class="hot-list-p3-1">Price Per Night</span> <span class="hot-list-p3-2"><%# Eval("price_per_night") %></span> <a href="booking.aspx" class="hot-page2-alp-quot-btn spec-btn-text">Book Now</a> </div>
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </ul>
                                </div>
                            </div>
                            <!--====== AMENITIES ==========-->
                            <div class="tour_head1 hot-ameni">
                                <h3>Hotel Amenities</h3>
                                <ul>
                                    <asp:ListView ID="lv_HotelAmenities" runat="server">
                                        <ItemTemplate>
                                            <li><i class="fa fa-check" aria-hidden="true"></i><%# Eval("HotelAmenities") %></li>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </ul>
                            </div>

                            <!--====== place map location ==========-->
                            <div class="tour_head1 tout-map map-container">
                                <h3>Location</h3>
                                <%#Eval("hotel_map") %>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                    <div>
                        <!-- Ratings Form -->
                        <div class="dir-rat">
                            <div class="dir-rat-inn dir-rat-title">
                                <h3>Write Your Rating Here</h3>
                                <p>If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text</p>
                                <fieldset class="rating">
                                    <asp:TextBox runat="server" type="radio" ID="star5" name="rating" value="5"></asp:TextBox>
                                    <label class="full" for="star5" title="Awesome - 5 stars"></label>
                                    <input type="radio" id="star4half" name="rating" value="4 and a half" />
                                    <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
                                    <input type="radio" id="star4" name="rating" value="4" />
                                    <label class="full" for="star4" title="Pretty good - 4 stars"></label>
                                    <input type="radio" id="star3half" name="rating" value="3 and a half" />
                                    <label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                                    <input type="radio" id="star3" name="rating" value="3" />
                                    <label class="full" for="star3" title="Meh - 3 stars"></label>
                                    <input type="radio" id="star2half" name="rating" value="2 and a half" />
                                    <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                                    <input type="radio" id="star2" name="rating" value="2" />
                                    <label class="full" for="star2" title="Kinda bad - 2 stars"></label>
                                    <input type="radio" id="star1half" name="rating" value="1 and a half" />
                                    <label class="half" for="star1half" title="Meh - 1.5 stars"></label>
                                    <input type="radio" id="star1" name="rating" value="1" />
                                    <label class="full" for="star1" title="Sucks big time - 1 star"></label>
                                    <input type="radio" id="starhalf" name="rating" value="half" />
                                    <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                                </fieldset>
                            </div>
                            <div class="dir-rat-inn">
                                <div class="dir-rat-form">

                                    <div class="form-group col-md-6 pad-left-o">
                                        <asp:TextBox ID="txname" runat="server" type="text" class="form-control" placeholder="Enter Name" required></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6 pad-left-o">
                                        <asp:TextBox ID="txnumber" runat="server" type="number" class="form-control" placeholder="Enter Mobile" required></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6 pad-left-o">
                                        <asp:TextBox ID="txmail" runat="server" type="email" class="form-control" placeholder="Enter Email id" required></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6 pad-left-o">
                                        <asp:TextBox ID="txcity" runat="server" type="text" class="form-control" placeholder="Enter your City" required></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-12 pad-left-o">
                                        <asp:TextBox ID="txmsg" runat="server" type="textarea" TextMode="MultiLine" Style="font-size: 15px;" placeholder="Write your message" required></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-12 pad-left-o">
                                        <asp:Button ID="BtnRatingsForm" OnClick="BtnRatingsForm_Click1" runat="server" Text="Button" type="submit" value="SUBMIT" class="link-btn" />
                                    </div>

                                </div>
                            </div>
                            <!--COMMENT RATING-->
                            <div class="dir-rat-inn dir-rat-review">
                                <div class="row">
                                    <div class="col-md-3 dir-rat-left">
                                        <img src="images/reviewer/4.jpg" alt="">
                                        <p>Orange Fab & Weld <span>19th January, 2017</span> </p>
                                    </div>
                                    <div class="col-md-9 dir-rat-right">
                                        <div class="dir-rat-star"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i></div>
                                        <p>Michael & his team have been helping us with our eqiupment finance for the past 5 years - I think that says a quite a lot.. Michael is always ready to go the extra mile, always available, always helpfull that goes the same for his team that work with him - definatley our first phone call.</p>
                                        <ul>
                                            <li><a href="#"><span>Like</span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></a> </li>
                                            <li><a href="#"><span>Dis-Like</span><i class="fa fa-thumbs-o-down" aria-hidden="true"></i></a> </li>
                                            <li><a href="#"><span>Report</span> <i class="fa fa-flag-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><span>Comments</span> <i class="fa fa-commenting-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><span>Share Now</span>  <i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!--COMMENT RATING-->
                            <div class="dir-rat-inn dir-rat-review">
                                <div class="row">
                                    <div class="col-md-3 dir-rat-left">
                                        <img src="images/reviewer/3.jpg" alt="">
                                        <p>Orange Fab & Weld <span>19th January, 2017</span> </p>
                                    </div>
                                    <div class="col-md-9 dir-rat-right">
                                        <div class="dir-rat-star"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i></div>
                                        <p>Michael & his team have been helping us with our eqiupment finance for the past 5 years - I think that says a quite a lot.. Michael is always ready to go the extra mile, always available, always helpfull that goes the same for his team that work with him - definatley our first phone call.</p>
                                        <ul>
                                            <li><a href="#"><span>Like</span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></a> </li>
                                            <li><a href="#"><span>Dis-Like</span><i class="fa fa-thumbs-o-down" aria-hidden="true"></i></a> </li>
                                            <li><a href="#"><span>Report</span> <i class="fa fa-flag-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><span>Comments</span> <i class="fa fa-commenting-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><span>Share Now</span>  <i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!--COMMENT RATING-->
                            <div class="dir-rat-inn dir-rat-review">
                                <div class="row">
                                    <div class="col-md-3 dir-rat-left">
                                        <img src="images/reviewer/1.jpg" alt="">
                                        <p>Orange Fab & Weld <span>19th January, 2017</span> </p>
                                    </div>
                                    <div class="col-md-9 dir-rat-right">
                                        <div class="dir-rat-star"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i></div>
                                        <p>Michael & his team have been helping us with our eqiupment finance for the past 5 years - I think that says a quite a lot.. Michael is always ready to go the extra mile, always available, always helpfull that goes the same for his team that work with him - definatley our first phone call.</p>
                                        <ul>
                                            <li><a href="#"><span>Like</span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></a> </li>
                                            <li><a href="#"><span>Dis-Like</span><i class="fa fa-thumbs-o-down" aria-hidden="true"></i></a> </li>
                                            <li><a href="#"><span>Report</span> <i class="fa fa-flag-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><span>Comments</span> <i class="fa fa-commenting-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><span>Share Now</span>  <i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <asp:ListView ID="lv_tripInfo" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3 tour_r">
                            <!--====== SPECIAL OFFERS ==========-->
                            <div class="tour_right tour_offer">
                                <div class="band1">
                                    <img src="images/offer.png" alt="" />
                                </div>
                                <p>Special Offer</p>
                                <h4><%#Eval("trip_price") %><span class="n-td">
                                    <span class="n-td-1"><%#Eval("trip_price") %></span>
                                </span>
                                </h4>
                                <a href="booking.aspx" class="link-btn">Book Now</a>
                            </div>

                            <!--====== TRIP INFORMATION ==========-->
                            <div class="tour_right tour_incl tour-ri-com">
                                <h3>Trip Information</h3>
                                <ul>
                                    <li>Location : <%#Eval("city") %>,<%#Eval("state") %></li>
                                    <li>Arrival Date: <%#Eval("arrival_date") %></li>
                                    <li>Departure Date: <%#Eval("departure_date") %></li>
                                    <li>Free Sightseeing & Hotel</li>
                                </ul>
                            </div>

                            <!--====== PACKAGE SHARE ==========-->
                            <div class="tour_right head_right tour_social tour-ri-com">
                                <h3>Share This Package</h3>
                                <ul>
                                    <li><a href="https://www.facebook.com/profile.php?id=100026688728467"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="mailto:omsharma9367@gmail.com"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                    <li><a href="https://www.instagram.com/1ommsharma/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                    <li><a href="http://omsharma.pcbhilwara.com/"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                    <li><a href="tel:<%#Eval("help_number") %>"><i class="fa fa-whatsapp" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>

                            <!--====== HELP PACKAGE ==========-->
                            <div class="tour_right head_right tour_help tour-ri-com">
                                <h3>Help & Support</h3>
                                <div class="tour_help_1">
                                    <h4 class="tour_help_1_call">Call Us Now</h4>
                                    <h4><i class="fa fa-phone" aria-hidden="true"></i><a style="font-size: 20px; color: black;" href="tel:<%#Eval("help_number") %>"><%#Eval("help_number") %></a></h4>
                                </div>
                            </div>

                            <!--====== PUPULAR TOUR PACKAGES ==========-->
                            <div class="tour_right tour_rela tour-ri-com">
                                <h3>Popular Packages</h3>
                                <asp:ListView ID="lv_showpackages" runat="server">
                                    <ItemTemplate>
                                        <div class="tour_rela_1">
                                            <img src="images/Place_Images/<%# Eval("placeimage") %>" alt="" />
                                            <h4><%#Eval("package_place_name") %> <%#Eval("packageDuration") %></h4>
                                            <h4><%#Eval("package_category_name") %></h4>

                                            <p>Rs <%#Eval("package_price") %></p>
                                            <a href="booking.aspx" class="link-btn">View this Package</a>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
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
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
    </script>
</asp:Content>

