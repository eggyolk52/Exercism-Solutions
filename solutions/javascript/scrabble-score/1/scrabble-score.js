export const score = (word) => {
    return word.split('').reduce((accum, c) => {
        const cLower = c.toLowerCase();

        if (cLower.match(/[aeioulnrst]/)) return accum + 1;
        if (cLower.match(/[dg]/))         return accum + 2;
        if (cLower.match(/[bcmp]/))       return accum + 3;
        if (cLower.match(/[fhvwy]/))      return accum + 4;
        if (cLower.match(/[k]/))          return accum + 5;
        if (cLower.match(/[jx]/))         return accum + 8;
        if (cLower.match(/[qz]/))         return accum + 10;
        throw new Error("Not a valid character: '" + c + "'");
    }, 0)
};
