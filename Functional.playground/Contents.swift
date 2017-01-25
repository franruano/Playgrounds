//: Playground - noun: a place where people can play

import UIKit



func transpose<T>(lists: [[T]]) -> [[T]] {
    return map(transform: head, list: lists) + transpose(lists: (map(transform: tail, list: lists)))
}

transpose(lists: [["hello"]])