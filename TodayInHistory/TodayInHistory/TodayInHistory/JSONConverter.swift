//
//  JSONConverter.swift
//  TodayInHistory
//
//  Created by Tom on 3/5/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import Foundation

//通用解码器
public struct JSONConverter {
    //调用该方法时，将从getUers()函数获取的数据传递给Data，并且该Data是符合Decodable的
    public static func decode<T: Decodable>(_ data: Data) throws -> T? {
        //do/catch模块是实际解码的地方
        do {
            //调用JSONDecoder()的decode方法，并传入我们Model及实际的data，将data解码为T模型的数据
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            //如果上面解码错误，捕捉抛出的错误
            throw error
        }
    }
    
    public static func encode<T: Encodable>(_ value: T) throws -> Data? {
        do {
            let data = try JSONEncoder().encode(value)
            return data
        } catch {
            throw error
        }
    }
}
