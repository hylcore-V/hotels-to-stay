<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="TourDetails_AboutTheTour.aspx.cs" Inherits="admin_TourDetails_AboutTheTour" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
                            <h1>About The Tour</h1>
                            <h4 class="card-title">Popular Cities(Default.aspx) --> About The Tour Section(tour-details.aspx)</h4>
                            <div class="col-md-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="forms-sample">

                                            <div class="form-group">
                                                <label for="txtplacename">Enter Place Name</label>
                                                <asp:TextBox ID="txtplacename" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label for="txtPlacescovered">Enter Places covered</label>
                                                <asp:TextBox ID="txtPlacescovered" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label for="txtInclusions">Enter Inclusions</label>
                                                <asp:TextBox ID="txtInclusions" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label for="txtExclusions">Enter Exclusions</label>
                                                <asp:TextBox ID="txtExclusions" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                <link href="../css/CSS.css" rel="stylesheet" type="text/css" />
                                                <script src="../js/Extension.min.js" type="text/javascript"></script>
                                                <label for="txtEventDate">Enter Event Date</label>
                                                <asp:TextBox ID="txtEventDate" runat="server" CssClass="disable_past_dates form-control" Style="width: 80%;" />
                                                <asp:ImageButton runat="server" ID="imgPopup" CssClass="imgPopup" ImageUrl="../images/calender.png" />
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEventDate" PopupButtonID="imgPopup" />
                                            </div>

                                            <asp:Button ID="btnSubmit_AboutTour" runat="server" Text="Submit" OnClick="btnSubmit_AboutTour_Click" class="btn btn-gradient-primary me-2" />
                                            <asp:Button ID="btnUpdate_AboutTour" runat="server" Text="Update" Visible="false" OnClick="btnUpdate_AboutTour_Click" class="btn btn-gradient-primary me-2" />
                                            <asp:Button ID="btnCancel_AboutTour" runat="server" Text="Cancel" OnClick="btnCancel_AboutTour_Click" class="btn btn-gradient-primary me-2" />

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-12">
                                <div class="table-responsive">
                                    <table class="table" style="background-color: #fff;">
                                        <thead>
                                            <tr>
                                                <th scope="col">Id</th>
                                                <th scope="col">Place name</th>
                                                <th scope="col">Places covered</th>
                                                <th scope="col">Inclusions</th>
                                                <th scope="col">Exclusions</th>
                                                <th scope="col">Event Date</th>
                                                <th scope="col">status</th>
                                                <th scope="col">Edit</th>
                                                <th scope="col">Delete</th>
                                                <th scope="col">Change Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:HiddenField ID="hdnvalue" runat="server" />
                                            <asp:ListView ID="ListView_AboutTour" runat="server" OnItemCommand="ListView_AboutTour_ItemCommand" OnItemEditing="ListView_AboutTour_ItemEditing" OnItemDeleting="ListView_AboutTour_ItemDeleting">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblplacename" runat="server" Text='<%# Eval("placename") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblPlacescovered" runat="server" Text='<%# Eval("Placescovered") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblInclusions" runat="server" Text='<%# Eval("Inclusions") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblExclusions" runat="server" Text='<%# Eval("Exclusions") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblEventDate" runat="server" Text='<%# Eval("EventDate") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                                    <tr class="">
                                                        <td><%# Eval("Id") %></td>
                                                        <td><%# Eval("placename") %></td>
                                                        <td><%# Eval("Placescovered") %></td>
                                                        <td><%# Eval("Inclusions") %></td>
                                                        <td><%# Eval("Exclusions") %></td>
                                                        <td><%# Eval("EventDate") %></td>
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

