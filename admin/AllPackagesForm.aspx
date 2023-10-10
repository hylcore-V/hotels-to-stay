<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AllPackagesForm.aspx.cs" Inherits="admin_AllPackagesForm" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <h1>All Packages Form</h1>
        <h4 class="card-title">(all-package.aspx)</h4>
        <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="forms-sample">

                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtpackage_name">Enter Packages Name</label>
                                    <asp:TextBox ID="txtpackage_name" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="txtpackage_price">Enter Packages Price</label>
                                    <asp:TextBox ID="txtpackage_price" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="txtpackage_place">Enter Packages Place / City</label>
                                    <asp:TextBox ID="txtpackage_place" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="package_image">Upload  Packages Image</label>
                                    <asp:FileUpload ID="package_image" runat="server" class="form-control file-upload-info" hotelholder="Upload Image" />
                                </div>

                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="exampleInputUsername1">Enter Packages Desciption</label>
                                    <div>
                                        <CKEditor:CKEditorControl ID="txtpackage_desc" BasePath="/ckeditor/" runat="server">
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
                            <th scope="col">Package Id</th>
                            <th scope="col">Package Name</th>
                            <th scope="col">Package Desc</th>
                            <th scope="col">Package Price</th>
                            <th scope="col">Package Place</th>
                            <th scope="col">Package Image</th>
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
                                <asp:Label ID="lblpackage_id" runat="server" Text='<%# Eval("package_id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblpackage_name" runat="server" Text='<%# Eval("package_name") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblpackage_desc" runat="server" Text='<%# Eval("package_desc") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblpackage_price" runat="server" Text='<%# Eval("package_price") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblpackage_place" runat="server" Text='<%# Eval("package_place") %>' Visible="false"></asp:Label>
                                <asp:FileUpload ID="lblpackage_image" runat="server" Text='<%# Eval("package_image") %>' Visible="false" />
                                <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                <tr class="">
                                    <td><%# Eval("package_id") %></td>
                                    <td><%# Eval("package_name") %></td>
                                    <td><%# Eval("package_desc") %></td>
                                    <td><%# Eval("package_price") %></td>
                                    <td><%# Eval("package_place") %></td>
                                    <td>
                                        <img src="../images/package_image/<%# Eval("package_image") %>" /></td>
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

