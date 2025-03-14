function sha256(message) {
    const k = [
        0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
        0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
        0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
        0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
        0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
        0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
        0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
        0xc6e00bf3, 0xd5a79147, 0x6ca6351e, 0x748f82ee,
        0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa,
        0xa4506ceb, 0xbef9a3f7, 0xc67178f2
    ];
    const H = [
        0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
        0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
    ];
    
    const padMessage = function (message) {
        const length = message.length;
        const paddingLength = (56 - length % 64 + 64) % 64;
        const paddedMessage = new Array(length + paddingLength + 8);
        
        for (let i = 0; i < length; i++) {
            paddedMessage[i] = message.charCodeAt(i);
        }
        paddedMessage[length] = 0x80;
        
        for (let i = 0; i < paddingLength - 1; i++) {
            paddedMessage[length + 1 + i] = 0;
        }
        
        const bitLength = length * 8;
        paddedMessage[paddedMessage.length - 8] = (bitLength >>> 56) & 0xff;
        paddedMessage[paddedMessage.length - 7] = (bitLength >>> 48) & 0xff;
        paddedMessage[paddedMessage.length - 6] = (bitLength >>> 40) & 0xff;
        paddedMessage[paddedMessage.length - 5] = (bitLength >>> 32) & 0xff;
        paddedMessage[paddedMessage.length - 4] = (bitLength >>> 24) & 0xff;
        paddedMessage[paddedMessage.length - 3] = (bitLength >>> 16) & 0xff;
        paddedMessage[paddedMessage.length - 2] = (bitLength >>> 8) & 0xff;
        paddedMessage[paddedMessage.length - 1] = bitLength & 0xff;
        
        return paddedMessage;
    };

    const toWords = function (bytes) {
        const words = [];
        for (let i = 0; i < bytes.length; i += 4) {
            words.push((bytes[i] << 24) | (bytes[i + 1] << 16) | (bytes[i + 2] << 8) | bytes[i + 3]);
        }
        return words;
    };

    const words = toWords(padMessage(message));
    const blockCount = words.length / 16;

    for (let i = 0; i < blockCount; i++) {
        const w = words.slice(i * 16, i * 16 + 16);
        
        for (let j = 16; j < 64; j++) {
            const s0 = ((w[j - 15] >>> 7) | (w[j - 15] << 25)) ^ ((w[j - 15] >>> 18) | (w[j - 15] << 14)) ^ (w[j - 15] >>> 3);
            const s1 = ((w[j - 2] >>> 17) | (w[j - 2] << 15)) ^ ((w[j - 2] >>> 19) | (w[j - 2] << 13)) ^ (w[j - 2] >>> 10);
            w[j] = (w[j - 16] + s0 + w[j - 7] + s1) & 0xffffffff;
        }

        let [a, b, c, d, e, f, g, h] = H;
        
        for (let j = 0; j < 64; j++) {
            const temp1 = (h + ((e >>> 6) | (e << 26)) ^ ((e >>> 11) | (e << 21)) ^ ((e >>> 25) | (e << 7)) + ((e & f) ^ (~e & g)) + k[j] + w[j]) & 0xffffffff;
            const temp2 = ((a >>> 2) | (a << 30)) ^ ((a >>> 13) | (a << 19)) ^ ((a >>> 22) | (a << 10)) + ((a & b) ^ (a & c) ^ (b & c)) & 0xffffffff;
            h = g;
            g = f;
            f = e;
            e = (d + temp1) & 0xffffffff;
            d = c;
            c = b;
            b = a;
            a = (temp1 + temp2) & 0xffffffff;
        }

        H[0] = (H[0] + a) & 0xffffffff;
        H[1] = (H[1] + b) & 0xffffffff;
        H[2] = (H[2] + c) & 0xffffffff;
        H[3] = (H[3] + d) & 0xffffffff;
        H[4] = (H[4] + e) & 0xffffffff;
        H[5] = (H[5] + f) & 0xffffffff;
        H[6] = (H[6] + g) & 0xffffffff;
        H[7] = (H[7] + h) & 0xffffffff;
    }

    let hash = "";
    for (let i = 0; i < 8; i++) {
        hash += (H[i] >>> 28).toString(16) + ((H[i] >>> 4) & 0x0fff).toString(16) + ((H[i] << 4) & 0xffff).toString(16);
    }

    return hash;
}

const message = process.argv[2];
console.log(sha256(message));