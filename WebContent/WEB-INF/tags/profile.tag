<%@ tag description="Simple menu" %>
<%@ tag import="org.apache.commons.httpclient.util.URIUtil" %>
<%@ tag import="models.User" %>
<%@ tag import="lang.*" %>
<%@ attribute name="lang" required="true" rtexprvalue="true" type="java.lang.String" %>
<%@ attribute name="user" required="true" rtexprvalue="true" type="models.User" %>
<% LangPack l = LangFactory.getLangPack(lang); %>

<% String userName = user.getUserName(); %>
<% String userPictureUrl = ""; %> 
<% String showMyProfilePage = l.getShowMyProfilePage();%> 
<% String dataUserID = String.valueOf(user.getUserID()); %> 
<% String createNewTweet = l.getCreateNewTweet();%> 
<% String dragPhotoHere = ""; %> 
<% String orDragPhotoHere = ""; %> 
<% String TweetText = l.getTweetText(); %> 
<% String addPhoto = "";%> 
<% String addLocation = "";%> 
<% String confirmedAccount = l.getConfirmedAccount(); %> 
<% String imageWillAppearAsLink = "";%>  
<% String Following = l.getFollowing();%>  
<% String FollowingCount = String.valueOf(user.getFollowingConut());%>  
<% String followers = l.getFolllowers();%>  
<% String followersCount = String.valueOf(user.getFollowerConut());%>  
<% String tweetButton = l.getTweet(); %>  
<% String tweetCount = String.valueOf(user.getTweetConut()); %>  
<% String tweetCounter = String.valueOf(user.getTweetConut());%>  
<!-- userName  -->
<!-- userPictureUrl  -->
<!-- showMyProfilePage -->
<!-- dataUserID -->
<!-- createNewTweet-->
<!-- dragPhotoHere-->
<!-- orDragPhotoHere-->
<!-- TweetText-->
<!-- addPhoto-->
<!-- addLocation-->
<!-- confirmedAccount -->
<!-- imageWillAppearAsLink -->
<!-- Following -->
<!-- folllowers-->
<!-- tweetButton -->
<!-- tweetCounter -->
<!--  -->





<div class="module mini-profile">
  <div class="flex-module profile-summary js-profile-summary">
      

<a href="/koraytahta" class="account-summary account-summary-small js-nav" data-nav="profile">
  <div class="content">
    <div class="account-group js-mini-current-user" data-user-id="<%=dataUserID%>" data-screen-name="<%=userName%>">
      <img class="avatar size32" src="<%=userPictureUrl%>" alt="<%=userName%>" data-user-id="<%=dataUserID%>">
      <b class="fullname"><%=userName%></b>
      <small class="metadata">
          
          <%=showMyProfilePage%>
      </small>
    </div>
  </div>
</a>
  </div>

    <div class="js-mini-profile-stats-container">
        <ul class="stats js-mini-profile-stats" data-user-id="<%=dataUserID%>">
  <li><a class="js-nav" href="/<%=userName%>" data-element-term="tweet_stats" data-nav="profile"><strong><%=tweetCount%></strong> <%=tweetButton%></a></li>
  <li><a class="js-nav" href="/following" data-element-term="following_stats" data-nav="following"><strong><%=FollowingCount%></strong> <%=Following%></a></li>
  <li><a class="js-nav" href="/followers" data-element-term="follower_stats" data-nav="followers"><strong><%=followersCount%></strong> <%=followers%></a></li>
</ul>

    </div>


    <div class="home-tweet-box tweet-box component tweet-user">
        <form class="tweet-form condensed" method="post" target="tweet-post-iframe" action="//upload.twitter.com/i/tweet/create_with_media.iframe" enctype="multipart/form-data">
  <input type="hidden" name="post_authenticity_token" class="auth-token">
  <input type="hidden" name="iframe_callback" class="iframe-callback">
  <input type="hidden" name="in_reply_to_status_id" class="in-reply-to-status-id">
  <input type="hidden" name="impression_id" class="impression-id">
  <input type="hidden" name="earned" class="earned">

  <div class="tweet-content">
    <i class="add-photo-icon hidden"></i>
    <span class="tweet-drag-help tweet-drag-photo-here hidden"><%=dragPhotoHere%></span>
    <span class="tweet-drag-help tweet-or-drag-photo-here hidden"><%=orDragPhotoHere%></span>
    <label class="visuallyhidden" for="tweet-box-mini-home-profile"><%=TweetText%></label>

    
    <div id="tweet-box-mini-home-profile" class="tweet-box rich-editor" contenteditable="true" spellcheck="true" role="textbox" aria-multiline="true" dir="ltr"><div><%=createNewTweet%>...</div></div>
    <div class="rich-normalizer"><div><%=createNewTweet%>..</div></div>

    <div class="dropdown-menu typeahead">
  <div class="dropdown-caret">
    <div class="caret-outer"></div>
    <div class="caret-inner"></div>
  </div>
  <div class="dropdown-inner js-typeahead-results"><div class="typeahead-accounts js-typeahead-accounts block0" style="display: none;">
  <ul class="typeahead-items">
    
    <li data-user-id="" data-user-screenname="" data-remote="true" data-score="" class="typeahead-item typeahead-account-item js-selectable">
      
      <a class="js-nav" data-query-source="typeahead_click" data-search-query="" data-ds="account">
        <img width="24" height="24" class="avatar size24">
        <span class="fullname"></span>
        <span class="js-verified hidden"><span class="icon verified"><span class="visuallyhidden"><%=confirmedAccount%></span></span></span>
        <span class="username"><s>@</s><b></b></span>
      </a>
    </li>
    <li class="js-selectable typeahead-accounts-shortcut js-shortcut"><a class="js-nav" href="" data-search-query="" data-query-source="typeahead_click" data-shortcut="true" data-ds="account_search"></a></li>
  </ul>
</div><ul class="typeahead-items topics-list block1" style="display: none;">
  
  <li class="typeahead-item typeahead-topic-item"><a class="js-nav" href="" data-search-query="" data-query-source="typeahead_click" data-ds="topics" tabindex="-1"><i class="generic-search"></i></a></li>
</ul></div>
</div>

    
    <textarea class="tweet-box-shadow" name="status"></textarea>

    
    <div class="thumbnail-container">
      <div class="preview">
        <a class="dismiss js-dismiss" href="#" tabindex="-1"><i class="dismiss-white"></i></a>

        <span class="filename"></span>
      </div>
      <div class="preview-message"><%=imageWillAppearAsLink%></div>
    </div>

  </div>

  <div class="toolbar js-toolbar" role="toolbar">
    <div class="tweet-box-extras">

      <div class="photo-selector">
        <button aria-hidden="true" class="btn" type="button" tabindex="-1">
          <i class="tweet-camera"></i>
        </button>
        <div class="image-selector">
          <input type="hidden" name="media_data[]" class="file-data">
          <label>
            <span class="visuallyhidden"><%=addPhoto%></span>
            <input type="file" name="media[]" class="file-input" tabindex="-1">
          </label>
          <div class="swf-container"></div>
        </div>
      </div>

        <div class="geo-picker">
  <button class="btn geo-picker-btn" type="button" tabindex="-1">
    <i class="tweet-geo"><span class="visuallyhidden"><%=addLocation%></span></i> <span class="caret"></span>
  </button>
  <span class="dropdown-container"></span>
  <span class="geo-status"></span>
  <input type="hidden" name="place_id">
</div>


    </div>
    <div class="tweet-button">
      <span class="spinner"></span>
      <span class="tweet-counter"><%=tweetCounter%></span>
      <button class="btn primary-btn tweet-action" type="button"><%=l.getTweet()%></button>
    </div>
  </div>
</form>

    </div>
</div>