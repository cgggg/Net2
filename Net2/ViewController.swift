//
//  ViewController.swift
//  Net2
//
//  Created by 陈刚 on 15/6/15.
//  Copyright (c) 2015年 cg. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLConnectionDataDelegate,NSURLConnectionDelegate {

    @IBAction func test(sender: UIButton) {
        self.getWeatherJson()
    }
   
    func getWeatherJson() {
        
        //创建NSURL对象
        var url:NSURL! = NSURL(string: "http://www.weather.com.cn/adat/sk/101010100.html")
        //创建请求对象
        var urlRequest:NSURLRequest = NSURLRequest(URL: url)
        //网络连接对象
        var conn:NSURLConnection? = NSURLConnection(request: urlRequest, delegate: self)
        conn?.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        //执行
        conn?.start()
        
    }
    
    
    
    func connection(connection: NSURLConnection, willSendRequest request: NSURLRequest, redirectResponse response: NSURLResponse?) -> NSURLRequest? {
        //将要发送请求
        return request
    }
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        //接收响应
    }
    var jsonData:NSMutableData = NSMutableData()
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        //收到数据
        jsonData.appendData(data)
    }
    func connection(connection: NSURLConnection, needNewBodyStream request: NSURLRequest) -> NSInputStream? {
        //需要新的内容流
        return request.HTTPBodyStream
    }
    func connection(connection: NSURLConnection, didSendBodyData bytesWritten: Int, totalBytesWritten: Int, totalBytesExpectedToWrite: Int) {
        //发送数据请求
    }
    func connection(connection: NSURLConnection, willCacheResponse cachedResponse: NSCachedURLResponse) -> NSCachedURLResponse? {
        //缓存响应
        return cachedResponse
    }
    func connectionDidFinishLoading(connection: NSURLConnection) {
        //请求结束
        var jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
        println(jsonString)
    }
}

