const stringSort = (str) => str.toLowerCase().split("").sort().toString();

export const findAnagrams = (target, candidates) => {
    const targetSorted = stringSort(target);

    return candidates.filter((candidate) => {
        if (target.toLowerCase() === candidate.toLowerCase()) {
            return false;
        } else {
            return targetSorted === stringSort(candidate);
        }
    });
};
