const lowAdd = function (ebx, ecx) {
    let eax = ebx ^ ecx;  // XOR for sum without carry
    let CF = ebx & ecx;   // AND for carry
    while (CF !== 0) {    // Keep adding carry until there is no carry left
        CF <<= 1;         // Shift carry left
        let temp = eax ^ CF; // Add carry to the sum
        CF = eax & CF;    // Calculate new carry
        eax = temp;       // Update eax with the new sum
    }
    return eax;           // Final result
};

const res = lowAdd(9, 3);
console.log(res); // 12
