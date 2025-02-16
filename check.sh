from collections import deque

def max_sliding_window(arr, k):
    n = len(arr)
    if n == 0: return []

    dq = deque()  # Deque to store indices of elements
    result = []

    for i in range(n):
        # Remove elements out of the current window
        if dq and dq[0] < i - k + 1:
            dq.popleft()

        # Maintain decreasing order: Remove smaller elements from the back
        while dq and arr[dq[-1]] < arr[i]:
            dq.pop()

        # Add current element's index to the deque
        dq.append(i)

        # Append the max (front of deque) to result once window size is reached
        if i >= k - 1:
            result.append(arr[dq[0]])

    return result

# Read input
n = int(input())
arr = list(map(int, input().split()))
k = int(input())

# Output the maximums for each sliding window
print(" ".join(map(str, max_sliding_window(arr, k))))
