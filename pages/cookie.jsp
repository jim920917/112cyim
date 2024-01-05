<%@ page import="java.io.*, java.util.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*" %>


<%
    // 定義獲取特定名稱的Cookie的實用方法
    String getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    // 檢查'acceptedCookies' Cookie是否存在
    if (getCookie(request, "acceptedCookies") != null) {
%>
    <h1>歡迎訪問您的網站</h1>
    <p>這是您網站的主要內容。</p>
<%
    } else {
%>
    <div id="cookieNotice">
        <p>本網站使用Cookies以提升用戶體驗。<a href="/privacy-policy">了解更多</a></p>
        <button onclick="acceptCookies()">接受Cookies</button>
        <button onclick="rejectCookies()">拒絕Cookies</button>
    </div>

    <script>
        // 處理Cookies的JavaScript函數
        function acceptCookies() {
            // 設置'acceptedCookies' Cookie
            document.cookie = 'acceptedCookies=true; expires=' + new Date(new Date().getTime() + 365 * 24 * 60 * 60 * 1000).toUTCString() + '; path=/';
            location.reload();
        }

        function rejectCookies() {
            // 處理拒絕（例如，關閉窗口）
            window.close();
        }
    </script>
<%
    }
%>
