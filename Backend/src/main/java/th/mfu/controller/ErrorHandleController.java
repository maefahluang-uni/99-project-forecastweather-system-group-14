//package th.mfu.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.web.reactive.error.ErrorAttributes;
//import org.springframework.boot.web.servlet.error.ErrorController;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.context.request.ServletWebRequest;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.Map;
//
//@Controller
//public class ErrorHandleController implements ErrorController, ErrorPath {
//
//    @Autowired
//    private ErrorAttributes errorAttributes;
//
//    @RequestMapping("/error")    //mandatory mapping
//    public @ResponseBody String handleError(HttpServletRequest req) {
//
//        ServletWebRequest servletWebRequest = new ServletWebRequest(req);
//
//        @SuppressWarnings("deprecation")
//        Map<String, Object> errors = errorAttributes.getErrorAttributes(servletWebRequest, true);
//
//
//
//        StringBuilder builder = new StringBuilder();
//        builder.append("<html><body>");
//        builder.append("<h2>ERROR SUMMARY</h2>");
//
//        builder.append("<table border='1.5'>");
//        errors.forEach((key, value) -> {
//            builder.append("<tr>").append("<td>").append(key).append("</td>").append("<td>").append(value).append("</td>")
//                    .append("</tr>");
//        });
//        builder.append("</table>");
//        builder.append("</body></html>");
//        return builder.toString();
//    }
//
//    @Override
//    public String getErrorPath() {
//        return "/error";
//    }
//}