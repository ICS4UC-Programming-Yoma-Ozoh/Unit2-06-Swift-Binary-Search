import Foundation

/**
 * Performs a binary search on an array of integers.
 *
 * - Parameters:
 *   - num: The number to search for.
 *   - array: The sorted array to search in.
 * - Returns: The index of the number if found, otherwise -1.
 */
func binarySearch(num: Int, in array: [Int]) -> Int {
    // Track the lowest index in the current search range
    var low = 0
    // Track the highest index in the current search range
    var high = array.count - 1

    // Continue searching as long as the search range is valid
    while low <= high {
        // Find the middle index of the current range
        let midpoint = (low + high) / 2

        // If the target number is in the right half
        if array[midpoint] < num {
            // Eliminate the left half by moving low past the midpoint
            low = midpoint + 1
        // If the target number is in the left half
        } else if array[midpoint] > num {
            // Eliminate the right half by moving high before the midpoint
            high = midpoint - 1
        // Target number was found at the midpoint
        } else {
            // Return the index where the number was found
            return midpoint
        }
    }

    // Return -1 if the number was not in the array
    return -1
}

/**
 * Main function to run the binary search program loop.
 */
func main() {
    // Variable to control whether the main loop continues running
    var keepPlaying = true

    // Main game loop
    while keepPlaying {
        // Create an array to hold 10 integers
        var numbers = [Int]()

        // Fill the array with 10 random integers between 0 and 100
        for _ in 0..<10 {
            numbers.append(Int.random(in: 0...100))
        }

        // Sort the numbers in ascending order (required for binary search)
        numbers.sort()

        // Print the prompt instructions for the user
        print("What number are you searching for in the list below? Enter \"q\" to quit.")

        // Display all the sorted numbers in the array separated by spaces
        for number in numbers {
            print("\(number) ", terminator: "")
        }
        // Prompt the user to enter their search term
        print("\tNumber: ", terminator: "")

        // Read the user's input line from the console and trim whitespace
        guard let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            continue
        }

        // Check if the user entered "q" or "Q" to quit the program
        if input.lowercased() == "q" {
            // Print quit message and set flag to false to stop the loop
            print("Thank you for playing!")
            keepPlaying = false
        } else {
            // Try converting the input string to an integer
            if let userNum = Int(input) {
                // Search for the integer using the binary search method
                let foundIndex = binarySearch(num: userNum, in: numbers)

                // Check if the number was found or not
                if foundIndex == -1 {
                    // Print message indicating the number was not found
                    print("The number \(userNum) is not found in the list of numbers.\n")
                } else {
                    // Print message showing where the number was found
                    print("The number \(userNum) is found at index \(foundIndex).\n")
                }
            } else {
                // Handle invalid input that isn't an integer or 'q'
                print("Please input a valid integer.\n")
            }
        }
    }
}

// Execute the main function
main()