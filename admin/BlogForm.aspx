<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="BlogForm.aspx.cs" Inherits="admin_BlogForm" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <h1>Blogs</h1>
        <div class="col-md-12 col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="forms-sample">

                        <asp:Label ID="lblId" runat="server" Visible="false"></asp:Label>

                        <div class="form-group">
                            <label for="heading">Enter blogs heading</label>
                            <asp:TextBox ID="heading" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="author">Enter blogs author</label>
                            <asp:TextBox ID="author" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="date">Enter blogs date</label>
                            <asp:TextBox ID="date" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="city">Enter blogs city</label>
                            <asp:TextBox ID="city" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="details">Enter blogs details</label>
                            <div>
                                <ckeditor:ckeditorcontrol id="details" basepath="/ckeditor/" runat="server">
                                                    </ckeditor:ckeditorcontrol>
                            </div>

                        </div>
                       
                        <div class="form-group">
                            <label>Upload blogs Image</label>
                            <asp:FileUpload ID="blogsUpload" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                        </div>

                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="btn btn-gradient-primary me-2" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false" OnClick="btnUpdate_Click" class="btn btn-gradient-primary me-2" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-gradient-primary me-2" />

                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 col-12">
            <div class="table-responsive">
                <table class="table" style="background-color: #fff;">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Heading</th>
                            <th scope="col">Author</th>
                            <th scope="col">Date</th>
                            <th scope="col">City</th>
                            <th scope="col">Details</th>
                            <th scope="col">Image</th>
                            <th scope="col">Status</th>
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
                                <asp:Label ID="lblheading" runat="server" Text='<%# Eval("heading") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblauthor" runat="server" Text='<%# Eval("author") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lbldate" runat="server" Text='<%# Eval("date") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblcity" runat="server" Text='<%# Eval("city") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lbldetails" runat="server" Text='<%# Eval("details") %>' Visible="false"></asp:Label>
                                <asp:FileUpload ID="lblimage" runat="server" Text='<%# Eval("image") %>' Visible="false" />
                                <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblrts" runat="server" Text='<%# Eval("rts") %>' Visible="false"></asp:Label>

                                <tr class="">
                                    <td><%# Eval("Id") %></td>
                                    <td><%# Eval("heading") %></td>
                                    <td><%# Eval("author") %></td>
                                    <td><%# Eval("date") %></td>
                                    <td><%# Eval("city") %></td>
                                    <td><%# Eval("details") %></td>
                                    <td>
                                        <img src="../images/blogs/<%# Eval("image") %>" /></td>
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

