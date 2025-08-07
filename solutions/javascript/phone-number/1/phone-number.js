export const clean = (nanp) => {
    if (nanp.match(/[A-z]/)) {
        throw new Error('Letters not permitted')
    } else if (nanp.match(/[@:!]/)) {
        throw new Error('Punctuations not permitted')
    }

    if (nanp.match(/\([2-9][0-9]{2}\) +0/)) {
        throw new Error('Exchange code cannot start with zero');
    } else if (nanp.match(/\([2-9][0-9]{2}\) +1/)) {
        throw new Error('Exchange code cannot start with one');
    } else if (nanp.match(/\(0[0-9]{2}\)/)) {
        throw new Error('Area code cannot start with zero');
    } else if (nanp.match(/\(1[0-9]{2}\)/)) {
        throw new Error('Area code cannot start with one');
    }

    const cleaned = nanp.split('').filter((char) => char.match(/[0-9]/)).join('');

    if (cleaned.length == 11) {
        if (cleaned[0] == '1') {
            return cleaned.slice(1);
        } else {
            throw new Error('11 digits must start with 1');
        }
    } else if (cleaned.length > 11) {
        throw new Error('More than 11 digits');
    } else if (cleaned.length < 10) {
        throw new Error('Incorrect number of digits');
    }

    return cleaned;
};
