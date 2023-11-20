<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
</head>
<body>
<div class="container">
    <div class="row">
        <h2>Login</h2>
        <hr/>
    </div>

    <div class="row">
        <div class="col-sm-6">

            <form>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter Name"

                           value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
                           onChange="window.location='/login?email='+encodeURIComponent(event.target.value);"

                    />

                </div>

                <div class="form-group">
                    <label>password</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter Fee"

                           value="<%= request.getParameter("password") != null ? request.getParameter("password") : "" %>"
                           onChange="window.location='/login?password='+encodeURIComponent(event.target.value);"

                    />
                </div>
                <button type="submit" class="btn btn-primary" >Login</button>
            </form>
            <div className="container">
                <table className="table table-striped">
                    <tbody>
                    <tr>
                        <td><a href="http://localhost:8085/oauth2/authorization/google">Google</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>