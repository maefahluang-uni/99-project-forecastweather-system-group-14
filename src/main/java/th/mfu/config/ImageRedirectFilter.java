package th.mfu.config;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class ImageRedirectFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Cast ServletRequest to HttpServletRequest
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        // Check if the request path contains the problematic image path
        if (httpRequest.getServletPath().equals("/img/mian%20login%202%203.png")) {
            // Redirect to the login page
            request.getRequestDispatcher("/login").forward(request, response);
        } else {
            // Continue with the chain for other requests
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}
