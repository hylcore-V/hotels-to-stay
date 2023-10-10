<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="RegularPackagesForm.aspx.cs" Inherits="admin_RegularPackagesForm" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
                            <h1>regular packages Form</h1>
                            <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="forms-sample">

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                    <div class="form-group">
                                                        <label for="ddl_selectplace">Select place For regular package</label>
                                                        <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddl_selectplace_SelectedIndexChanged" ID="ddl_selectplace" runat="server" class="form-control form-control-lg" DataTextField="place" DataValueField="Id" AppendDataBoundItems="true">
                                                      <asp:ListItem Value="-1" Text="Select place For regular package"></asp:ListItem>
                                                              </asp:DropDownList>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtpackageDuration">Enter package duration in this format (12 Night/13 Days)</label>
                                                        <asp:TextBox ID="txtpackageDuration" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtpackageAvailableTickets">Enter Available Tickets </label>
                                                        <asp:TextBox ID="txtpackageAvailableTickets" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtpackageStartDate">Enter Package Start Date</label>
                                                        <asp:TextBox ID="txtpackageStartDate" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtpackageStartDate">Enter Package End Date</label>
                                                        <asp:TextBox ID="txtpackageEndDate" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtpackageInclusions">Enter place description</label>
                                                        <div>
                                                            <CKEditor:CKEditorControl ID="txtpackageInclusions" BasePath="/ckeditor/" runat="server" class="form-control">
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
                                                <th scope="col">Place Id</th>
                                                <th scope="col">Package duration</th>
                                                <th scope="col">Available Tickets</th>
                                                <th scope="col">Package Start Date</th>
                                                <th scope="col">Package End Date</th>
                                                <th scope="col">Package Tour Inclusions</th>
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
                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblplace_id" runat="server" Text='<%# Eval("place_id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblpackageDuration" runat="server" Text='<%# Eval("packageDuration") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblpackageAvailableTickets" runat="server" Text='<%# Eval("packageAvailableTickets") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblpackageStartDate" runat="server" Text='<%# Eval("packageStartDate") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblpackageEndDate" runat="server" Text='<%# Eval("packageEndDate") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblpackageInclusions" runat="server" Text='<%# Eval("packageInclusions") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                                    <tr class="">
                                                        <td><%# Eval("id") %></td>
                                                        <td><%# Eval("place_id") %></td>
                                                        <td><%# Eval("packageDuration") %></td>
                                                        <td><%# Eval("packageAvailableTickets") %></td>
                                                        <td><%# Eval("packageStartDate") %></td>
                                                        <td><%# Eval("packageEndDate") %></td>
                                                        <td><%# Eval("packageInclusions") %></td>
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

