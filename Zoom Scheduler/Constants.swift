//
//  Constants.swift
//  Zoom Scheduler
//
//  Created by Francisco Bustamante on 2/22/21.
//

import Foundation
import UIKit

// light-weigth class to represent section headers for tableview
// sections have a title and an array of ZoomMeeting objects
// Sections will be days of week, ex: Monday
struct Section {
    var title: String
    var items: [ZoomMeeting]
}


//dictionary of days of week (Key,Value) = (Int, String) = (key, Day)
var weekDays: [Int:String] = [0:"Monday", 1:"Tuesday", 2:"Wednesday", 3:"Thursday", 4:"Friday", 5:"Saturday", 6:"Sunday"]

var ampm: [Int: String] = [0: "am", 1: "pm"]
// dictionary to represent all times of day, in increments of 5

var timeOfDay: [Int:String] = [
    // 1 AM
    0: "1:00",
    1: "1:05",
    2: "1:10",
    3: "1:15",
    4: "1:20",
    5: "1:25",
    6: "1:3",
    7: "1:35",
    8: "1:40",
    9: "1:45",
    10: "1:50",
    11: "1:55",
    //2 AM
    12: "2:00",
    13: "2:05",
    14: "2:10",
    15: "2:15",
    16: "2:20",
    17: "2:25",
    18: "2:30",
    19: "2:35",
    20: "2:40",
    21: "2:45",
    22: "2:50",
    23: "2:55",
    //3 AM
    24: "3:00",
    25: "3:05",
    26: "3:10",
    27: "3:15",
    28: "3:20",
    29: "3:25",
    30: "3:30",
    31: "3:35",
    32: "3:40",
    33: "3:45",
    34: "3:50",
    35: "3:55",
    //4 AM
    36: "4:00",
    37: "4:05",
    38: "4:10",
    39: "4:15",
    40: "4:20",
    41: "4:25",
    42: "4:30",
    43: "4:35",
    44: "4:40",
    45: "4:45",
    46: "4:50",
    47: "4:55",
    // 5 AM
    48: "5:00",
    49: "5:05",
    50: "5:10",
    51: "5:15",
    52: "5:20",
    53: "5:25",
    54: "5:30",
    55: "5:35",
    56: "5:40",
    57: "5:45",
    58: "5:50",
    59: "5:55",
    //6 AM
    60: "6:00",
    61: "6:05",
    62: "6:10",
    63: "6:15",
    64: "6:20",
    65: "6:25",
    66: "6:30",
    67: "6:35",
    68: "6:40",
    69: "6:45",
    70: "6:50",
    71: "6:55",
    //7 AM
    72: "7:00",
    73: "7:05",
    74: "7:10",
    75: "7:15",
    76: "7:20",
    77: "7:25",
    78: "7:30",
    79: "7:35",
    80: "7:40",
    81: "7:45",
    82: "7:50",
    83: "7:55",
    //8 AM
    84: "8:00",
    85: "8:05",
    86: "8:10",
    87: "8:15",
    88: "8:20",
    89: "8:25",
    90: "8:30",
    91: "8:35",
    92: "8:40",
    93: "8:45",
    94: "8:50",
    95: "8:55",
    //9 AM
    96: "9:00",
    97: "9:05",
    98: "9:10",
    99: "9:15",
    100: "9:20",
    101: "9:25",
    102: "9:30",
    103: "9:35",
    104: "9:40",
    105: "9:45",
    106: "9:50",
    107: "9:55",
    //10 AM
    108: "10:00",
    109: "10:05",
    110: "10:10",
    111: "10:15",
    112: "10:20",
    113: "10:25",
    114: "10:30",
    115: "10:35",
    116: "10:40",
    117: "10:45",
    118: "10:50",
    119: "10:55",
    //11 AM
    120: "11:00",
    121: "11:05",
    122: "11:10",
    123: "11:15",
    124: "11:20",
    125: "11:25",
    126: "11:30",
    127: "11:35",
    128: "11:40",
    129: "11:45",
    130: "11:50",
    131: "11:55",
    //12 AM
    132: "12:00",
    133: "12:05",
    134: "12:10",
    135: "12:15",
    136: "12:20",
    137: "12:25",
    138: "12:30",
    139: "12:35",
    140: "12:40",
    141: "12:45",
    142: "12:50",
    143: "12:55",
    
]
