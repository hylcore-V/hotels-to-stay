<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="HotelDetailsForm.aspx.cs" Inherits="admin_HotelDetailsForm" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
                            <h1>Hotel Details Form</h1>
                           
                            <h4 class="card-title">( hotel-details.aspx )</h4>
                            <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="forms-sample">

                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="form-group">
                                                        <label for="txthotel">Enter Hotel Name</label>
                                                        <asp:TextBox ID="txthotel" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtcity">Enter Hotel city</label>
                                                        <asp:TextBox ID="txtcity" runat="server" class="form-control"></asp:TextBox>
                                                    </div>


                                                    <div class="form-group">
                                                        <label for="txtdistrict">Enter Hotel district</label>
                                                        <asp:TextBox ID="txtdistrict" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtstate">Enter Hotel state</label>
                                                        <asp:TextBox ID="txtstate" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtcountry">Enter Hotel country</label>
                                                        <asp:TextBox ID="txtcountry" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtdistrict_code">Enter Hotel District Code</label>
                                                        <asp:TextBox ID="txtdistrict_code" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="hotelimage">Upload  Hotel Image</label>
                                                        <asp:FileUpload ID="hotelimage" runat="server" class="form-control file-upload-info" hotelholder="Upload Image" />
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="hotelimage">Upload Hotel Banner Image</label>
                                                        <asp:FileUpload ID="bannerimage" runat="server" class="form-control file-upload-info" hotelholder="Upload Image" />
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="exampleInputUsername1">Enter Hotel Nearby railways</label>
                                                        <asp:TextBox ID="txtnearby_railways" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">

                                                    <div class="form-group">
                                                        <label for="txtnearby_airports">Enter Hotel Nearby airports</label>
                                                        <asp:TextBox ID="txtnearby_airports" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtnearby_hospitals">Enter Nearby hospitals</label>
                                                        <asp:TextBox ID="txtnearby_hospitals" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtnearby_malls">Enter Hotel Nearby malls</label>
                                                        <asp:TextBox ID="txtnearby_malls" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtnearby_bus">Enter Hotel Nearby bus stop</label>
                                                        <asp:TextBox ID="txtnearby_bus" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txthotel_map">Enter Map of Hotel </label>
                                                        <asp:TextBox ID="txthotel_map" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="exampleInputUsername1">Enter Hotel description</label>
                                                        <div>
                                                            <CKEditor:CKEditorControl ID="description" BasePath="/ckeditor/" runat="server">
                                                            </CKEditor:CKEditorControl>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="btn btn-gradient-primary me-2" />
                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false" OnClick="btnUpdate_Click" class="btn btn-gradient-primary me-2" />
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-gradient-primary me-2" />

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-sm-12 col-md-12 col-12">
                                <div class="table-responsive">
                                    <table class="table" style="background-color: #fff;">
                                        <thead>
                                            <tr>
                                                <th scope="col">Id</th>
                                                <th scope="col">hotel</th>
                                                <th scope="col">city</th>
                                                <th scope="col">district</th>
                                                <th scope="col">state</th>
                                                <th scope="col">country</th>
                                                <th scope="col">district_code</th>
                                                <th scope="col">hotel_image</th>
                                                <th scope="col">bannerimage</th>
                                                <th scope="col">nearby_hospitals</th>
                                                <th scope="col">nearby_malls</th>
                                                <th scope="col">nearby_airport</th>
                                                <th scope="col">nearby_railways</th>
                                                <th scope="col">nearby_bus</th>
                                                <th scope="col">hotel_map</th>
                                                <th scope="col">status</th>
                                                <th scope="col">Edit</th>
                                                <th scope="col">Delete</th>
                                                <th scope="col">Change Status</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:HiddenField ID="hdnvalue" runat="server" />
                                            <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" OnItemEditing="ListView1_ItemEditing" OnItemDeleting="ListView1_ItemDeleting">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblhotel" runat="server" Text='<%# Eval("hotel") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblcity" runat="server" Text='<%# Eval("city") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbldistrict" runat="server" Text='<%# Eval("district") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblstate" runat="server" Text='<%# Eval("state") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblcountry" runat="server" Text='<%# Eval("country") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbldistrict_code" runat="server" Text='<%# Eval("district_code") %>' Visible="false"></asp:Label>
                                                    <asp:FileUpload ID="lblhotelimage" runat="server" Text='<%# Eval("hotelimage") %>' Visible="false" />
                                                    <asp:FileUpload ID="lblbannerimage" runat="server" Text='<%# Eval("hotel_bannerimage") %>' Visible="false" />

                                                    <asp:Label ID="lblnearby_hospitals" runat="server" Text='<%# Eval("nearby_hospitals") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblnearby_malls" runat="server" Text='<%# Eval("nearby_malls") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblnearby_airport" runat="server" Text='<%# Eval("nearby_airport") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblnearby_railways" runat="server" Text='<%# Eval("nearby_railways") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblnearby_bus" runat="server" Text='<%# Eval("nearby_bus") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblhotel_map" runat="server" Text='<%# Eval("hotel_map") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblhotel_desc" runat="server" Text='<%# Eval("hotel_desc") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                                    <tr class="">
                                                        <td><%# Eval("Id") %></td>
                                                        <td><%# Eval("hotel") %></td>
                                                        <td><%# Eval("city") %></td>
                                                        <td><%# Eval("district") %></td>
                                                        <td><%# Eval("state") %></td>
                                                        <td><%# Eval("country") %></td>
                                                        <td><%# Eval("district_code") %></td>
                                                        <td>
                                                            <img src="../images/Hotel_Images/<%# Eval("hotelimage") %>" /></td>

                                                        <td>
                                                            <img src="../images/Hotel_Images/<%# Eval("hotel_bannerimage") %>" /></td>

                                                        <td><%# Eval("nearby_hospitals") %></td>
                                                        <td><%# Eval("nearby_malls") %></td>
                                                        <td><%# Eval("nearby_airport") %></td>
                                                        <td><%# Eval("nearby_railways") %></td>
                                                        <td><%# Eval("nearby_bus") %></td>
                                                        <td><%# Eval("hotel_map") %></td>
                                                        <td><%# Eval("hotel_desc") %></td>
                                                        <td><%# Eval("status") %></td>

                                                        <td>
                                                            <asp:Button ID="EditBtn" runat="server" Text="Edit" CommandName="edit" class="btn btn-gradient-primary me-2" />
                                                        </td>

                                                        <td>
                                                            <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CommandName="delete" class="btn btn-gradient-primary me-2" />
                                                        </td>

                                                        <td>
                                                            <span id="Span1" runat="server" visible='<%# Eval("status").ToString() == "1" ? true : false %>'>
                                                                <asp:Button ID="Active" runat="server" Text="Deactive" CommandName="Deactive" class="btn btn-gradient-primary me-2" />
                                                            </span>

                                                            <span id="Span2" runat="server" visible='<%# Eval("status").ToString() == "0" ? true : false %>'>
                                                                <asp:Button ID="Deactive" runat="server" Text="Active" CommandName="Active" class="btn btn-gradient-primary me-2" />
                                                            </span>
                                                        </td>


                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
</asp:Content>

