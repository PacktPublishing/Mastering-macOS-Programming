
import Foundation


let chars: [Character] = ["b","l","u","e"]
var string = String(chars)
let char: Character = "s"
string.append(char)
string.append("ey")

let a: NSMutableString = "Copyright"
let b = a

// won't compile
//a = "Mutated"
//will compile
a.replaceOccurrences(of: "right",
                     with: "left",
                     options: [],
                     range: NSRange(location: 0, length: a.length))
print(a, b)

var c = "Copyright"
let d = a
c.replacingOccurrences(of: "right", with: "left")
print(c, d)



let e: String = "SwiftString"
let characterView = e.characters


//indices and subranges
let question = "What will you do?"
question.startIndex
question.index(after: question.startIndex)
question.index(before: question.endIndex)
question.endIndex
question.index(question.startIndex,
               offsetBy: 3)
question.index(question.endIndex,
               offsetBy: -3)

let i = question.index(after: question.startIndex)
question[i]
let j = question.index(question.endIndex,
                       offsetBy: -3)
question[j]

let rangeStart = question.startIndex
let rangeEnd = question.index(question.startIndex,
                              offsetBy: 4)
let subrange = rangeStart ..< rangeEnd

let charIndex = question.characters.index(of: "l")
let youString = question.range(of: "you")

//modifying strings
//removing
var badBoys = "The Rolling Stones"
let s = badBoys.remove(at: badBoys.index(before: badBoys.endIndex))
let range1Start = badBoys.startIndex
let range1End = badBoys.index(badBoys.startIndex,
                              offsetBy: 4)
let range = range1Start ..< range1End
badBoys.removeSubrange(range)

//inserting
badBoys.insert(" ", at: badBoys.startIndex)

var wannaBeBad = "Justin"
let range2Start = wannaBeBad.index(wannaBeBad.endIndex,
                                  offsetBy: -2)
let range2End = wannaBeBad.endIndex
let range2 = range2Start ..< range2End
wannaBeBad.replaceSubrange(range2, with: " Like A")
let bobSong = wannaBeBad + badBoys

//string interpolation
let x = 0b001
let y = 0b010
let z = 0b100
let t = "The total is \(x + y + z)"
let gift = "Jaguar"
let wishfulThinking = "My wife bought me a \(gift.uppercased()) for my birthday!"


// new strings from old
let salutation = "hEllo"
let shout = salutation.uppercased()
let whisper = salutation.lowercased()

// NSStrings
let answer = "Enjoy the trip 😀"
answer.characters.count
answer.unicodeScalars.count
answer.utf16.count
answer.utf8.count

// other representation
let shortAnswer = "trip 😀"
shortAnswer.characters.map({ print($0, terminator: " ") })
print()
shortAnswer.unicodeScalars.map({ print($0, terminator: " ") })
print()
shortAnswer.unicodeScalars.map({ print($0.value, terminator: " ") })
print()
shortAnswer.utf16.map({ print($0, terminator: " ") })
print()
shortAnswer.utf8.map({ print($0, terminator: " ") })
print()


let swiftString = "string"
let cStringUTF8 = swiftString.cString(using: String.Encoding.utf8)

//String comparisons
let str = "Henry the V"
str.hasPrefix("H")
str.hasSuffix("V")
str.contains("the")

