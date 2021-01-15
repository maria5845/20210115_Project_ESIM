package com.tectone.util;


import java.util.ArrayList;
import java.util.Properties;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;


public class MongoDBUtil {
	
	public static MongoClient connectMongoClient_admin(Properties _config) throws Exception{
		
		MongoClient mongoClient = null;
		
		//연결 설정값 저장 (호스트, 포트, 아이디, 디비명, 비밀번호)
		java.util.List<ServerAddress> salist = new ArrayList<ServerAddress>();
		salist.add(new ServerAddress( _config.getProperty("mongo.host"), Integer.parseInt(_config.getProperty("mongo.port")) ));
		java.util.List<MongoCredential> mclist = new ArrayList<MongoCredential>();
		mclist.add(MongoCredential.createCredential( _config.getProperty("mongo.adminid"), _config.getProperty("mongo.admindbname"), _config.getProperty("mongo.adminpw").toCharArray()));
		
		//연결
		mongoClient = new MongoClient(salist, mclist
				, MongoClientOptions.builder().serverSelectionTimeout( Integer.parseInt(_config.getProperty("mongo.serverSelectionTimeout")) ).build());
		
		return mongoClient;
	};
	
	public static void createCollection(String loadNm, String dbNm, MongoClient	mongoClient) throws Exception{
		
		MongoDatabase mongodatabase = mongoClient.getDatabase("admin");
		
		Document doc = new Document();
		doc.append("shardcollection", "mes_eem." + loadNm);
		doc.append("key", new Document("_id", 1));
		
		//컬렉션 생성
		mongodatabase.runCommand(doc);
		
		//DB 변경
		mongodatabase = mongoClient.getDatabase(dbNm);
		MongoCollection<Document> mCollection = mongodatabase.getCollection( loadNm );
		
		doc = new Document();
		doc.append("_id", 1);
		doc.append("loadnm", "Sample");
		doc.append("variablenm", "Sample");
		doc.append("time_value", "1");
		doc.append("timestamp_value", Long.parseLong("1"));
		doc.append("data_value", Long.parseLong("1"));
		
		//샘플쿼리 입력
		mCollection.insertOne(doc);
		
		//인덱스 생성 timestamp_value,variablenm
		Document doc2 = new Document();
		doc2.append("timestamp_value", 1);
		doc2.append("variablenm", 1);
		mCollection.createIndex(doc2);
		
		//인덱스 생성 time_value,variablenm
		doc2 = new Document();
		doc2.append("time_value", 1);
		doc2.append("variablenm", 1);
		mCollection.createIndex(doc2);
		
		//인덱스 생성 variablenm
		doc2 = new Document();
		doc2.append("variablenm", 1);
		mCollection.createIndex(doc2);
		
		//인덱스 생성 timestamp_value
		doc2 = new Document();
		doc2.append("timestamp_value", 1);
		mCollection.createIndex(doc2);
		
		//인덱스 생성 time_value
		doc2 = new Document();
		doc2.append("time_value", 1);
		mCollection.createIndex(doc2);
		
		//샘플쿼리 삭제
		mCollection.deleteOne(doc);
		
		mongoClient.close();
	}
}
