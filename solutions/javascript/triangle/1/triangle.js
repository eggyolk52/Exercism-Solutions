export class Triangle {
    constructor(...sides) {
        this.sides = sides;
    }

    isTriangle() {
        const [a, b, c] = this.sides;

        if (this.sides.length != 3) {
            return false;
        } else if (a === 0 || b === 0 || c === 0) {
            return false;
        } else if (a + b < c || b + c < a || c + a < b) {
            return false;
        } else {
            return true;
        }
    }

    get isEquilateral() {
        if (!this.isTriangle()) return false;

        const [a, b, c] = this.sides;

        if (a === b && b === c && c === a) {
            return true;
        } else {
            return false;
        }
    }

    get isIsosceles() {
        if (!this.isTriangle()) return false;

        const [a, b, c] = this.sides;

        return a === b || b === c || c === a;
    }

    get isScalene() {
        if (!this.isTriangle()) return false;

        const [a, b, c] = this.sides;

        return !this.isIsosceles;
    }
}
