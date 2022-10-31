import Foundation

func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        
    // Create a map for the words
    var hash: [String: Int] = [:]
    
    // Iterate through the words
    for word in words {
        // .. and count them
        hash[word, default: 0] += 1
    }
    
    /**
    Sort by frequency or alternatively alphabetically,
    as requested in the challenge
    */
    let sorted: [(key: String, value: Int)] = hash.sorted { element1, element2 in
                                
        if element1.value == element2.value {
            return element1.key < element2.key
        }
        return element1.value > element2.value
    }

    // Get only k elements...
    let shrunk: [(key: String, value: Int)] = Array(sorted[0..<k])
        
    // And return only the key
    return shrunk.map { element in
        return element.key
    }
}
let words = ["plpaboutit","jnoqzdute","sfvkdqf","mjc","nkpllqzjzp","foqqenbey","ssnanizsav","nkpllqzjzp","sfvkdqf","isnjmy","pnqsz","hhqpvvt","fvvdtpnzx","jkqonvenhx","cyxwlef","hhqpvvt","fvvdtpnzx","plpaboutit","sfvkdqf","mjc","fvvdtpnzx","bwumsj","foqqenbey","isnjmy","nkpllqzjzp","hhqpvvt","foqqenbey","fvvdtpnzx","bwumsj","hhqpvvt","fvvdtpnzx","jkqonvenhx","jnoqzdute","foqqenbey","jnoqzdute","foqqenbey","hhqpvvt","ssnanizsav","mjc","foqqenbey","bwumsj","ssnanizsav","fvvdtpnzx","nkpllqzjzp","jkqonvenhx","hhqpvvt","mjc","isnjmy","bwumsj","pnqsz","hhqpvvt","nkpllqzjzp","jnoqzdute","pnqsz","nkpllqzjzp","jnoqzdute","foqqenbey","nkpllqzjzp","hhqpvvt","fvvdtpnzx","plpaboutit","jnoqzdute","sfvkdqf","fvvdtpnzx","jkqonvenhx","jnoqzdute","nkpllqzjzp","jnoqzdute","fvvdtpnzx","jkqonvenhx","hhqpvvt","isnjmy","jkqonvenhx","ssnanizsav","jnoqzdute","jkqonvenhx","fvvdtpnzx","hhqpvvt","bwumsj","nkpllqzjzp","bwumsj","jkqonvenhx","jnoqzdute","pnqsz","foqqenbey","sfvkdqf","sfvkdqf"], k = 4
topKFrequent(words, k)
