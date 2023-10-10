<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="searchresult.aspx.cs" Inherits="searchresult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="place_result_section" class="tour_head1 place_result_section" runat="server">
        <div class="container">
            <h3>Places And Cities Related To Your Search</h3>
            <div class="tr-room-type">
                <ul>
                    <asp:ListView ID="ListViewCity" runat="server">
                        <ItemTemplate>
                            <li>
                                <div class="tr-room-type-list">
                                    <div class="col-md-3 tr-room-type-list-1">
                                        <a href="tour-details.aspx?place=<%# Eval("place") %>">
                                            <img src="images/Place_Images/<%# Eval("placeimage") %>" alt="" />
                                        </a>
                                    </div>
                                    <div class="col-md-6 tr-room-type-list-2">
                                        <a href="tour-details.aspx?place=<%# Eval("place") %>">
                                            <h2 style="margin: 0px;"><%# Eval("place") %></h2>
                                            <span class="v_pl_name">(<%# Eval("state") %>, <%# Eval("country") %>)
                                            </span>
                                            <p><b>Location : </b><%# Eval("place") %>, <%# Eval("district") %>-<%# Eval("district_code") %>, <%# Eval("state") %>, <%# Eval("country") %></p>
                                            <span><b>Nearby Places : </b><%# Eval("nearby_places") %></span>
                                            <span><b>Nearby Restaurant : </b><%# Eval("nearby_restaurant") %></span>
                                            <span><b>Nearest Shopping Malls : </b><%# Eval("nearby_malls") %></span>
                                            <span><b>Nearest Hotels : </b><%# Eval("nearby_hotels") %></span>
                                            <span><b>Nearby Hospitals : </b><%# Eval("nearby_hospitals") %></span>
                                            <span><b>Nearest Airports : </b><%# Eval("nearby_airport") %></span>
                                            <span><b>Nearest Railways : </b><%# Eval("nearby_railways") %></span>
                                            <span><b>Nearby Bus : </b><%# Eval("nearby_bus") %></span>
                                        </a>
                                    </div>
                                    <div class="col-md-3 tr-room-type-list-3"> <a href="booking.aspx" class="hot-page2-alp-quot-btn spec-btn-text">Book Now</a> </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:ListView>
                </ul>
            </div>
        </div>
    </div>

    <div id="hotel_result_section" class="tour_head1 hotel_result_section" runat="server">
        <div class="container">
            <h3>Hotels & Rooms Availablities Related To Your Search</h3>
            <div class="tr-room-type">
                <ul>
                    <asp:ListView ID="ListViewHotels" runat="server">
                        <ItemTemplate>
                            <li>
                                <div class="tr-room-type-list">
                                    <div class="col-md-3 tr-room-type-list-1">
                                        <a href="hotel-details.aspx?hotel=<%# Eval("hotel") %>&city=<%#Eval("city") %>">
                                            <img src="images/Hotel_Images/<%# Eval("hotelimage") %>" alt="" />
                                        </a>
                                    </div>
                                    <div class="col-md-6 tr-room-type-list-2">
                                        <a href="hotel-details.aspx?hotel=<%# Eval("hotel") %>&city=<%#Eval("city") %>">
                                            <h2 style="margin: 0px;"><%# Eval("hotel") %></h2>
                                            <span class="v_pl_name">(<%# Eval("city") %>,<%# Eval("state") %>, <%# Eval("country") %>)
                                            </span>
                                            <p><b>Location : </b><%# Eval("hotel") %>, <%# Eval("district") %>-<%# Eval("district_code") %>, <%# Eval("state") %>, <%# Eval("country") %></p>
                                            <span><b>Nearby Places : </b><%# Eval("nearby_places") %></span>
                                            <span><b>Nearest Shopping Malls : </b><%# Eval("nearby_malls") %></span>
                                            <span><b>Nearby Hospitals : </b><%# Eval("nearby_hospitals") %></span>
                                            <span><b>Nearest Airports : </b><%# Eval("nearby_airport") %></span>
                                            <span><b>Nearest Railways : </b><%# Eval("nearby_railways") %></span>
                                            <span><b>Nearby Bus : </b><%# Eval("nearby_bus") %></span>
                                        </a>
                                    </div>
                                    <div class="col-md-3 tr-room-type-list-3"><span class="hot-list-p3-1">Price Per Night</span> <span class="hot-list-p3-2"><%# Eval("price_per_night") %></span> <a href="booking.aspx" class="hot-page2-alp-quot-btn spec-btn-text">Book Now</a> </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:ListView>
                </ul>
            </div>
        </div>
    </div>

</asp:Content>

