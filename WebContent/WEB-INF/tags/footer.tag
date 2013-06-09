<%@ tag description="Simple menu" %>
<%@ tag import="lang.*" %>
<%@ attribute name="lang" required="true" rtexprvalue="true" type="java.lang.String" %>
<% LangPack l = LangFactory.getLangPack(lang); %>


<!-- aboutUs-->
<!-- helping-->
<!-- conditions -->
<!-- privicay -->
<!-- blog -->
<!-- state-->
<!-- applications-->
<!-- sources -->
<!-- advertisers-->
<!-- businesses -->
<!-- advertisers -->
<!-- copyright-->
<!-- developers -->

<div class="module site-footer ">
  <div class="flex-module">
    <div class="flex-module-inner js-items-container">
      <ul class="clearfix">
        <li class="copyright"><%=l.getAbout()%></li>
        <li><a href="/about"><%=l.getCopyright() %></a></li>
        <li><a href="//support.twitter.com"><%=l.getHelping()%></a></li>
        <li><a href="/tos"><%=l.getConditions()%></a></li>
        <li><a href="/privacy"><%=l.getPrivacy()%></a></li>
        <li><a href="http://blog.twitter.com"><%=l.getBlog()%></a></li>
        <li><a href="http://status.twitter.com"><%=l.getState()%></a></li>
        <li><a href="/download"><%=l.getApplications()%></a></li>
        <li><a href="/about/resources"><%=l.getSources()%></a></li>
        <li><a href="/jobs"><%=l.getCareer()%></a></li>
        <li><a href="https://business.twitter.com/start-advertising"><%=l.getAdvertisers()%></a></li>
        <li><a href="https://business.twitter.com"><%=l.getBusinesses()%></a></li>
        <li><a href="//media.twitter.com"><%=l.getMedia()%></a></li>
        <li><a href="//dev.twitter.com"><%=l.getDevelopers()%></a></li>
      </ul>
    </div>
  </div>
</div>