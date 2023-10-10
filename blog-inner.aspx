<%@ Page Title="" Language="C#" MasterPageFile="~/Travelz.master" AutoEventWireup="true" CodeFile="blog-inner.aspx.cs" Inherits="blog_inner_html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--====== ALL POST ==========-->
    <section>
        <div class="rows inn-page-bg com-colo">
            <div class="container inn-page-con-bg tb-space pad-bot-redu-5" id="inner-page-title">
                <!--===== POSTS ======-->
                <div class="rows">
                    <asp:ListView ID="lv_innerblogs" runat="server">
                        <ItemTemplate>
                            <div class="posts">
                        <div class="col-lg-12 col-md-6 col-sm-6 col-12">
                            <img src="images/blogs/<%# Eval("image") %>" alt="<%#Eval("heading") %>" />
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                            <h3><%#Eval("heading") %></h3>
                            <h5><span class="post_author">Author: <%#Eval("author") %></span><span class="post_date">Date: <%#Eval("date") %></span><span class="post_city">City: <%#Eval("city") %></span></h5>
                            <div class="post-btn">
                                <ul>
                                    <li><a href="https://www.facebook.com/"><i class="fa fa-facebook fb1"></i>Share On Facebook</a>
                                    </li>
                                    <li><a href="https://www.twitter.com"><i class="fa fa-twitter tw1"></i>Share On Twitter</a>
                                    </li>
                                    <li><a href="https://www.google.com"><i class="fa fa-google-plus gp1"></i>Share On Google Plus</a>
                                    </li>
                                </ul>
                            </div>
                            <p><%#Eval("details") %></p>
                        </div>
                    </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <!--===== POST END ======-->
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

