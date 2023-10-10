<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="booking-car-rentals.aspx.cs" Inherits="booking_car_rentals" %>

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
    <!--HEADER SECTION-->
    <section>
        <div class="v2-hom-search">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="v2-ho-se-ri">
                            <h5>World's leading tour and travels template</h5>
                            <h1>Car Rentals easy now!</h1>
                            <p>Experience the various exciting tour and travel packages and Make hotel reservations, find vacation packages, search cheap hotels and events</p>
                            <div class="tourz-hom-ser v2-hom-ser">
                                <ul>
                                    <li>
                                        <a href="booking-tour-package.aspx" class="waves-effect waves-light btn-large tourz-pop-ser-btn">
                                            <img src="images/icon/2.png" alt="">
                                            Tour</a>
                                    </li>
                                    <li>
                                        <a href="booking-flight.aspx" class="waves-effect waves-light btn-large tourz-pop-ser-btn">
                                            <img src="images/icon/31.png" alt="">
                                            Flight</a>
                                    </li>
                                    <li>
                                        <a href="booking-car-rentals.aspx" class="waves-effect waves-light btn-large tourz-pop-ser-btn">
                                            <img src="images/icon/30.png" alt="">
                                            Car Rentals</a>
                                    </li>
                                    <li>
                                        <a href="booking-hotel.aspx" class="waves-effect waves-light btn-large tourz-pop-ser-btn">
                                            <img src="images/icon/1.png" alt="">
                                            Hotel</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="">
                            <div id="bookingForm" class="contact__form v2-search-form" method="post" action="">

                                <div id="alertmsg" class="alertmsg alert-success">
                                    Thank you for arranging a wonderful trip for us! Our team will contact you shortly!
                               
                                </div>
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
                                        <asp:TextBox ID="selectsearch" CssClass="autosuggest" class="autosuggest" name="selectsearch" runat="server" required placeholder="Pick up location"></asp:TextBox>
                                    </div>
                                    <div class="input-field col s12">
                                        <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServicePath="~/sellproduct.asmx"
                                            ServiceMethod="FromSearch" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                            CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                            FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="selectsearch">
                                        </cc1:AutoCompleteExtender>
                                        <asp:TextBox ID="txtdroploc" CssClass="autosuggest" class="autosuggest" name="selectsearch" runat="server" required placeholder="Dropping off location"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <link href="css/CSS.css" rel="stylesheet" type="text/css" />
                                        <script src="js/Extension.min.js" type="text/javascript"></script>
                                        <asp:TextBox ID="txtArrivalDate" runat="server" CssClass="disable_past_dates" Style="width: 80%;" required />
                                        <asp:ImageButton runat="server" ID="imgPopup" CssClass="imgPopup" ImageUrl="images/Calendar.png" />
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtArrivalDate" PopupButtonID="imgPopup" />
                                        <label for="txtArrivalDate">Pick up date</label>
                                    </div>

                                    <div class="input-field col s6">
                                        <asp:DropDownList ID="ddl_picktime" runat="server" required>
                                            <asp:ListItem Value="" disabled selected>Pick up time</asp:ListItem>
                                            <asp:ListItem Value="24:00 midnight">24:00 midnight</asp:ListItem>
                                            <asp:ListItem Value="01:00 AM">01:00 AM</asp:ListItem>
                                            <asp:ListItem Value="02:00 AM">02:00 AM</asp:ListItem>
                                            <asp:ListItem Value="03:00 AM">03:00 AM</asp:ListItem>
                                            <asp:ListItem Value="04:00 AM">04:00 AM</asp:ListItem>
                                            <asp:ListItem Value="05:00 AM">05:00 AM</asp:ListItem>
                                            <asp:ListItem Value="06:00 AM">06:00 AM</asp:ListItem>
                                            <asp:ListItem Value="07:00 AM">07:00 AM</asp:ListItem>
                                            <asp:ListItem Value="08:00 AM">08:00 AM</asp:ListItem>
                                            <asp:ListItem Value="09:00 AM">09:00 AM</asp:ListItem>
                                            <asp:ListItem Value="10:00 AM">10:00 AM</asp:ListItem>
                                            <asp:ListItem Value="11:00 AM">11:00 AM</asp:ListItem>
                                            <asp:ListItem Value="12:00 noon">12:00 noon</asp:ListItem>
                                            <asp:ListItem Value="13:00 PM">13:00 PM</asp:ListItem>
                                            <asp:ListItem Value="14:00 PM">14:00 PM</asp:ListItem>
                                            <asp:ListItem Value="15:00 PM">15:00 PM</asp:ListItem>
                                            <asp:ListItem Value="16:00 PM">16:00 PM</asp:ListItem>
                                            <asp:ListItem Value="17:00 PM">17:00 PM</asp:ListItem>
                                            <asp:ListItem Value="18:00 PM">18:00 PM</asp:ListItem>
                                            <asp:ListItem Value="19:00 PM">19:00 PM</asp:ListItem>
                                            <asp:ListItem Value="20:00 PM">20:00 PM</asp:ListItem>
                                            <asp:ListItem Value="21:00 PM">21:00 PM</asp:ListItem>
                                            <asp:ListItem Value="22:00 PM">22:00 PM</asp:ListItem>
                                            <asp:ListItem Value="23:00 PM">23:00 PM</asp:ListItem>
                                            <asp:ListItem Value="24:00 midnight">06:00 AM</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <link href="css/CSS.css" rel="stylesheet" type="text/css" />
                                        <script src="js/Extension.min.js" type="text/javascript"></script>
                                        <asp:TextBox ID="txtdropdate" runat="server" CssClass="disable_past_dates" Style="width: 80%;" required />
                                        <asp:ImageButton runat="server" ID="ImageButton1" CssClass="imgPopup" ImageUrl="images/Calendar.png" />
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtdropdate" PopupButtonID="ImageButton1" />
                                        <label for="txtdropdate">Drop off date</label>
                                    </div>

                                    <div class="input-field col s6">
                                        <asp:DropDownList ID="ddl_droptime" runat="server" required>
                                            <asp:ListItem Value="" disabled selected>Drop off time</asp:ListItem>
                                            <asp:ListItem Value="24:00 midnight">24:00 midnight</asp:ListItem>
                                            <asp:ListItem Value="01:00 AM">01:00 AM</asp:ListItem>
                                            <asp:ListItem Value="02:00 AM">02:00 AM</asp:ListItem>
                                            <asp:ListItem Value="03:00 AM">03:00 AM</asp:ListItem>
                                            <asp:ListItem Value="04:00 AM">04:00 AM</asp:ListItem>
                                            <asp:ListItem Value="05:00 AM">05:00 AM</asp:ListItem>
                                            <asp:ListItem Value="06:00 AM">06:00 AM</asp:ListItem>
                                            <asp:ListItem Value="07:00 AM">07:00 AM</asp:ListItem>
                                            <asp:ListItem Value="08:00 AM">08:00 AM</asp:ListItem>
                                            <asp:ListItem Value="09:00 AM">09:00 AM</asp:ListItem>
                                            <asp:ListItem Value="10:00 AM">10:00 AM</asp:ListItem>
                                            <asp:ListItem Value="11:00 AM">11:00 AM</asp:ListItem>
                                            <asp:ListItem Value="12:00 noon">12:00 noon</asp:ListItem>
                                            <asp:ListItem Value="13:00 PM">13:00 PM</asp:ListItem>
                                            <asp:ListItem Value="14:00 PM">14:00 PM</asp:ListItem>
                                            <asp:ListItem Value="15:00 PM">15:00 PM</asp:ListItem>
                                            <asp:ListItem Value="16:00 PM">16:00 PM</asp:ListItem>
                                            <asp:ListItem Value="17:00 PM">17:00 PM</asp:ListItem>
                                            <asp:ListItem Value="18:00 PM">18:00 PM</asp:ListItem>
                                            <asp:ListItem Value="19:00 PM">19:00 PM</asp:ListItem>
                                            <asp:ListItem Value="20:00 PM">20:00 PM</asp:ListItem>
                                            <asp:ListItem Value="21:00 PM">21:00 PM</asp:ListItem>
                                            <asp:ListItem Value="22:00 PM">22:00 PM</asp:ListItem>
                                            <asp:ListItem Value="23:00 PM">23:00 PM</asp:ListItem>
                                            <asp:ListItem Value="24:00 midnight">06:00 AM</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <asp:DropDownList ID="ddl_selectcar" runat="server" required>
                                            <asp:ListItem Value="" disabled Selected>Select car type</asp:ListItem>
                                            <asp:ListItem Value="Micro">Micro</asp:ListItem>
                                            <asp:ListItem Value="Mini">Mini</asp:ListItem>
                                            <asp:ListItem Value="Prime">Prime</asp:ListItem>
                                            <asp:ListItem Value="Prime SUV">Prime SUV</asp:ListItem>
                                            <asp:ListItem Value="Luxury Cars">Luxury Cars</asp:ListItem>
                                            <asp:ListItem Value="Mini Van">Mini Van</asp:ListItem>
                                            <asp:ListItem Value="Small Bus">Small Bus</asp:ListItem>
                                            <asp:ListItem Value="Luxury Bus">Luxury Bus</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="input-field col s6">
                                        <asp:DropDownList ID="ddl_totalpassangers" runat="server" required>
                                            <asp:ListItem Value="" disabled Selected>Total passengers</asp:ListItem>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="15">15</asp:ListItem>
                                            <asp:ListItem Value="20">20</asp:ListItem>
                                            <asp:ListItem Value="50">50</asp:ListItem>
                                            <asp:ListItem Value="100">100</asp:ListItem>
                                        </asp:DropDownList>
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
                </div>
            </div>
        </div>
    </section>
    <!--END HEADER SECTION-->
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
                                                    <asp:ListView ID="lv_hotels_sub" runat="server">
                                                        <ItemTemplate>
                                                            <li><span class="ho-hot-pri-dis"><%#Eval("price_per_night") %></span><span class="ho-hot-pri"><%#Eval("price_per_night") %></span> </li>
                                                        </ItemTemplate>
                                                    </asp:ListView>
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
    <!--====== SECTION: FREE CONSULTANT ==========-->
    <section>
        <div class="tb-space tour-consul">
            <div class="container">
                <div class="col-md-6">
                    <span class="to-con-1">Get in touch with us</span>
                    <h2>Get best travel deals</h2>
                    <p>Get best travel deals for hotels, holidays, trains.Donec eget odio a nunc lacinia rhoncus. Vivamus dignissim magna quis nisl fermentum porttitor. Maecenas venenatis mattis dui at pharetra.Nullam rutrum odio eu viverra accumsan. Nam orci elit, scelerisque eget dui non, sagittis tristique metus. Fusce nec nulla dapibus, fringilla nulla eu, vehicula odio. </p>
                    <span class="to-con-2">Help line: +91 89992 92525</span>
                    <div class="ho-con-cont"><a href="hotels-list.aspx" class="to-con-3 link-btn">Book Now</a> <a href="contact.aspx" class="to-con-4 link-btn">Contact Now</a> </div>
                </div>
                <div class="col-md-6 ho-vid">
                    <img src="images/video.png" alt="">
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

                <cc1:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" ServicePath="~/searchhotelevent.asmx"
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
    <!--====== REQUEST A QUOTE ==========-->
    <!--<section>
        <div class="form tb-space">
            <div class="rows container">
                <div class="spe-title">
                    <h2>Book your <span>favourite Package</span> Now!</h2>
                    <div class="title-line">
                        <div class="tl-1"></div>
                        <div class="tl-2"></div>
                        <div class="tl-3"></div>
                    </div>
                    <p>World's leading tour and travels Booking website,Over 30,000 packages worldwide. Book travel packages and enjoy your holidays with distinctive experience</p>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form_1">
                    <div class="succ_mess">Thank you for contacting us we will get back to you soon.</div>
                    <form id="home_form" name="home_form" action="mail/send.php">
                        <ul>
                            <li>
                                <input type="text" name="ename" value="" id="ename" placeholder="Name" required>
                            </li>
                            <li>
                                <input type="tel" name="emobile" value="" id="emobile" placeholder="Mobile" required>
                            </li>
                            <li>
                                <input type="email" name="eemail" value="" id="eemail" placeholder="Email id" required>
                            </li>
                            <li>
                                <input type="text" name="esubject" value="" id="esubject" placeholder="Subject" required>
                            </li>
                            <li>
                                <input type="text" name="ecity" value="" id="ecity" placeholder="City" required>
                            </li>
                            <li>
                                <input type="text" name="ecount" value="" id="ecount" placeholder="Country" required>
                            </li>
                            <li>
                                <textarea name="emess" cols="40" rows="3" id="text-comment" placeholder="Enter your message"></textarea>
                            </li>
                            <li>
                                <input type="submit" value="Submit" id="send_button">
                            </li>
                        </ul>
                    </form>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 family">
                    <img src="images/family.png" alt="" />
                </div>
            </div>
        </div>
    </section>-->
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

