package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import models.Post.SelectPost;

import components.DatabaseAction;
import components.DatabaseManager;

public class Tweet {
	private int tweetID;
	private int userID;
	private User user;
	private String tweet;
	private int originID;
	private Tweet origin;
	private int responseID;
	private Tweet response;
	private boolean isNewPost;
	
	private Tweet(int tweetID, int userID, String tweet, int originID, int responseID) {
		this.tweetID = tweetID;
		this.userID = userID;
		this.tweet = tweet;
		this.originID = originID;
		this.responseID = responseID;
		this.isNewPost = false;
	}
	
	public Tweet(int userID,  String tweet, int originID, int responseID) {
		super();
		this.tweetID = -1;
		this.userID = userID;
		this.tweet = tweet;
		this.originID = originID;
		this.responseID = responseID;
		this.isNewPost = true;
	}

	public void save() {
		if(isNewPost){
			String str = String.format("insert into  ttweet (userID, tweet, originID, responseID) VALUES (%d, '%s',%d,%d);", userID,tweet, originID,responseID);
			DatabaseManager.execute(str);
		}else{
			String str = String.format("update ttweet set userID = %d, tweet = '%s', originID = %d, responseID = %d where tweetID = %d;", userID, tweet, originID , responseID, tweetID);
			DatabaseManager.execute(str);			
		}  
	}
	public static List<Tweet> findAll() {
		LinkedList<Tweet> list = new LinkedList<Tweet>();
		DatabaseManager.executeQuery(new SelectTweet(list), "select * from ttweet");
		return list;
	}
	private static Tweet findById(int tweetID) {
		LinkedList<Tweet> list = new LinkedList<Tweet>();
		DatabaseManager.executeQuery(new SelectTweet(list), String.format("select * from ttweet where tweetID = %d", tweetID));
		if(list.size() > 0)
			return list.get(0);
		else
			return null;
	}
	public static class SelectTweet implements DatabaseAction{
		List<Tweet> list;
		public SelectTweet(List<Tweet> list){
			this.list = list;
		}
		@Override
		public void doAction(ResultSet rs) throws SQLException {
			System.out.printf("%d %s %s \n", rs.getInt(1),rs.getString(2),rs.getString(3));
			list.add(new Tweet(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4), rs.getInt(5)));
		}
		
	}
	
	public int getUserID() {
		
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public User getUser() {
		if(user == null)
			this.user = User.findById(userID);
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getTweet() {
		return tweet;
	}
	public void setTweet(String tweet) {
		this.tweet = tweet;
	}
	public int getOriginID() {
		return originID;
	}
	public void setOriginID(int originID) {
		this.originID = originID;
	}
	public Tweet getOrigin() {
		if(origin == null)
			this.origin = Tweet.findById(originID);;
		return origin;
	}
	public void setOrigin(Tweet origin) {
		this.origin = origin;
	}
	public int getResponseID() {
		return responseID;
	}
	public void setResponseID(int responseID) {
		this.responseID = responseID;
	}
	public Tweet getResponse() {
		if(response == null)
			this.response = Tweet.findById(responseID);;
		return response;
	}
	public void setResponse(Tweet response) {
		this.response = response;
	}
	public int getTweetID() {
		return tweetID;
	}

}
