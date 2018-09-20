Array.prototype.bubbleSort = function () {
  let sorted = true;

  while (sorted) {
    sorted = false;
    for (let i = 0; i < this.length - 1; i++) {

      if (this[i] > this[i+1]) {
        [this[i], this[i+1]] = [this[i+1], this[i]];
        sorted = true;
      }
    }
  }
  return this;
};

String.prototype.substrings = function () {
  let substrings = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      if (substrings.includes(this.slice(i, j + 1))) {
        continue;
      } else {
        substrings.push(this.slice(i, j + 1));
      }

    }
  }
  return substrings;
};
